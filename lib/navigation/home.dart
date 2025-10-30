import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
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
                    // color: Colors.purple,
                    child: Column(
                      children: [
                        // body
                        Expanded(child: Container()),
                        // navigation
                        Container(
                          height: 100,
                          color: Color.fromARGB(75, 168, 240, 218),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/home');
                                    },
                                    icon: const Icon(
                                      Icons.home,
                                      size: 30,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const Text(
                                    'Home',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/donasi');
                                    },
                                    icon: const Icon(
                                      Icons.volunteer_activism,
                                      size: 30,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const Text(
                                    'Donasi',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/info');
                                    },
                                    icon: const Icon(
                                      Icons.info,
                                      size: 30,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const Text(
                                    'Info',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/profil');
                                    },
                                    icon: const Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const Text(
                                    'Profil',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
