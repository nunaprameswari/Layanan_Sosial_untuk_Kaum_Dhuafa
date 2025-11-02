import 'package:flutter/material.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  final List<Map<String, String>> beritaList = [
    {
      'judul': 'Update Donasi Korban Bencana Alam',
      'penulis': 'Renat Mitsuth',
      'waktu': '2 jam lalu',
      'gambar': 'assets/image/korban_bencana.jpeg'
    },
    {
      'judul': 'Panggilan Relawan untuk Program "Bakti Sosial Kasih"',
      'penulis': 'Renat Mitsuth',
      'waktu': '2 jam lalu',
      'gambar': 'assets/image/relawan_bs.jpg'
    },
    {
      'judul': 'Kegiatan Donor Darah Bersama"',
      'penulis': 'Renat Mitsuth',
      'waktu': '2 jam lalu',
      'gambar': 'assets/image/donor_darah.jpeg'
    },
    {
      'judul': 'Peluncaran Program Beasiswa Anak Yatim & Dhuafa',
      'penulis': 'Ranngal Ilaudin',
      'waktu': '1 jam lalu',
      'gambar': 'assets/image/beasiswa.jpeg'
    },
  ];

  int selectedTab = 0;
  final List<String> kategori = ["Relawan", "Dreleh", "Stamain Slaaia", "Ulaakan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text(
          "Berita & Update",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: const Color(0xFF6CA8A1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Kolom pencarian
            TextField(
              decoration: InputDecoration(
                hintText: "Cari berita atau relawan...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 🔹 Tab Kategori (Relawan, Dreleh, dst)
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kategori.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedTab == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedTab = index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFE0F2F1) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? const Color(0xFF6CA8A1) : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        kategori[index],
                        style: TextStyle(
                          color: isSelected ? const Color(0xFF116686) : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // 📜 Daftar berita
            Expanded(
              child: ListView.builder(
                itemCount: beritaList.length,
                itemBuilder: (context, index) {
                  final berita = beritaList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailBeritaPage(berita: berita),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              berita['gambar']!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  berita['judul']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  berita['penulis']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.favorite_border, size: 16, color: Colors.teal),
                                    Text(
                                      berita['waktu']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailBeritaPage extends StatelessWidget {
  final Map<String, String> berita;
  const DetailBeritaPage({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(berita['judul']!, style: const TextStyle(fontFamily: 'Poppins')),
        backgroundColor: const Color(0xFF6CA8A1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(berita['gambar']!, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              berita['judul']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 8),
            Text(
              "Oleh ${berita['penulis']} - ${berita['waktu']}",
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              "Isi lengkap berita akan ditampilkan di sini. Kamu bisa menulis deskripsi, detail kegiatan, foto tambahan, dan informasi relawan.",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
