import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/navigation/latest.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/navigation/message.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/navigation/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // static const TextStyle optionStyle = TextStyle(
  //   fontSize: 30,
  //   fontWeight: FontWeight.bold,
  // );
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    LatestNews(),
    Message(),
    AccountProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/image/health.png", height: 40),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                text: "Layanan Sosial\n",
                style: GoogleFonts.acme(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4F80FF),
                ),
                children: [
                  TextSpan(
                    text: "untuk Kaum Dhuafa",
                    style: GoogleFonts.abel(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        backgroundColor: Color(0xFF116686),
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Color(0xFF116686),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 130,
                          // width: 300,
                          margin: const EdgeInsets.only(top: 16, right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          // color: Colors.green,
                          child: LayoutBuilder(
                            builder: (context, Constraints) => Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    "assets/image/poster1.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 130,
                          // width: 300,
                          margin: const EdgeInsets.only(top: 16, right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          // color: Colors.green,
                          child: LayoutBuilder(
                            builder: (context, Constraints) => Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    "assets/image/poster2.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 130,
                          // width: 300,
                          margin: const EdgeInsets.only(top: 16, right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          // color: Colors.green,
                          child: LayoutBuilder(
                            builder: (context, Constraints) => Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    "assets/image/poster3.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 6, color: Colors.white),
                Expanded(
                  child: Container(
                    color: Colors.purple,
                    child: Column(
                      children: [
                        // body
                        Expanded(child: Container()),
                        // navigation
                        Container(
                          height: 100,
                          // color: Color(0xFF),
                          child: Center(
                            child: _widgetOptions.elementAt(_selectedIndex)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'home'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
