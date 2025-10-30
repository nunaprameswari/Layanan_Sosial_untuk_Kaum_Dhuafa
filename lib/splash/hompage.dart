import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF09485E),
        // toolbarHeight: 40,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 12, left: 15),
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/image/health.png", height: 45),

              // const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Layanan Sosial\n",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF4F80FF),
                        height: 0.5,
                        fontFamily: "Sansita One",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "untuk Kaum Dhuafa",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        height: 0.5,
                        fontFamily: "Ruwudu",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == "Setting") {
                // return setting();
              } else if (value == "About") {
                // return abbout();
              }
            },
            itemBuilder: (BuildContext) {
              return [
                const PopupMenuItem(value: "Setting", child: Text("Setting")),
                const PopupMenuItem(value: "About", child: Text("About")),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Color(0xFF09485E),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
              children: [
                Positioned(
                  top: 50,
                  // left: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Silahkan Daftarkan Diri Anda!",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),

                        const SizedBox(width: 65),

                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                            ),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        // padding: EdgeInsets.only(top: 10),
                        height: 130,
                        width: 300,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset("assets/image/poster1.png"),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.only(top: 10),
                        height: 130,
                        width: 300,
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset("assets/image/poster2.png"),
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.only(top: 10),
                        height: 130,
                        width: 300,
                        margin: const EdgeInsets.only(right: 16, top: 16),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset("assets/image/poster3.png"),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 10,
                  color: Colors.white,
                ),

                Expanded(
                  child: Container(
                    height: 100,
                      color: Colors.amber,
                      child: Column(
                        children: [
                          // // body
                          // Expanded(child: Container(),),
                          // // navigation
                          Container(
                            height: 100,
                            color: Colors.amber,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset("assets/image/Home.png")
                                  ],
                                )
                              ],
                            ),
                          )
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
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 80,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
