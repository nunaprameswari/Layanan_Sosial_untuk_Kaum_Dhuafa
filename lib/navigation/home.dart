import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart';
import 'message.dart';
import 'latest.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/bottom/danger.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/bottom/doctor.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/bottom/rs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DasboardHome(),
    LatestNews(),
    Message(),
    AccountProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF116686),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_sharp),
            label: 'Berita',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class DasboardHome extends StatelessWidget {
  const DasboardHome({super.key});

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
            margin: EdgeInsets.only(top: 30),
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
                        Expanded(
                          child: Container(
                            child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _menuButton(
                                      Icons.local_hospital_rounded,
                                      "Info Rumah\nSakit", () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RumahSakit()));
                                      }
                                    ),
                                    _menuButton(Icons.group, "Konsultasi", () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Consultation()));
                                      }),
                                    _menuButton(
                                      Icons.dangerous_outlined,
                                      "SOS", () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dangers()));
                                      }
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Berita Terkini",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigasi ke halaman berita
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LatestNews(),
                                          ), // ganti dengan nama halaman kamu
                                        );
                                      },
                                      child: Text(
                                        "Lihat Semua",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 14),

                                SizedBox(
                                  height: 180,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      beritaCard(
                                        "assets/image/poster1.png",
                                        "Update Donasi Korban Bencana Alam",
                                      ),
                                      beritaCard(
                                        "assets/image/poster2.png",
                                        "Relawan untuk Program Bakti Sosial",
                                      ),
                                      beritaCard(
                                        "assets/image/poster3.png",
                                        "Program Beasiswa Anak Dhuafa",
                                      ),
                                      beritaCard(
                                        "assets/image/poster1.png",
                                        "Kegiatan Donor Darah Bersama",
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF4F3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF116686)),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget beritaCard(String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail berita
        // Ganti dengan halaman kamu sendiri
        print("Berita diklik: $title");
      },
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Gambar berita
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              child: Image.asset(
                imagePath,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // 🔹 Judul berita
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
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
