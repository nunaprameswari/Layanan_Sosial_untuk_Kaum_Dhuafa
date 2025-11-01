import 'package:flutter/material.dart';
class RumahSakit extends StatefulWidget {
  const RumahSakit({super.key});

  @override
  State<RumahSakit> createState() => _RumahSakitState();
}

class _RumahSakitState extends State<RumahSakit> {
    final List<Map<String, String>> hospitals = [
      {
        'name': 'RS Mitra Keluarga',
        'category': 'Umum',
        'rating': '4.7',
        'address': 'Jl Kopo No. 12...',
        'distance': '1.5 km',
        'image': 'assets/image/poster1.png',
      },
      {
        'name': 'RS Anak Bunda',
        'category': 'Ibu & Anak',
        'rating': '4.9',
        'address': 'Jl Buah Batu No. 5...',
        'distance': '2.1 km',
        'image': 'assets/image/poster2.png',
      },
      {
        'name': 'RS Khusus Bedah Sentosa',
        'category': 'Khusus HD & GD',
        'rating': '4.5',
        'address': 'Jl Gatot Subroto...',
        'distance': '3.2 km',
        'image': 'assets/image/poster3.png',
      },
    ];

int selectedTab = 0;
  final List<String> kategori = ["Semua", "Umum", "Gigi & Mulut", "Hewan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF116686),
        title: const Text(
          "Info Rumah Sakit",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Cari nama rumah sakit atau lokasi...',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔘 Filter Tabs
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

            // 🏥 Daftar Rumah Sakit
            Expanded(
              child: ListView.builder(
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  final rs = hospitals[index];
                  return GestureDetector(
                    onTap: () {
                      // Arahkan ke halaman detail (nanti bisa kamu buat)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Membuka ${rs['name']}'),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBF0),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🖼️ Gambar Rumah Sakit
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              rs['image']!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // 📋 Detail RS
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rs['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  rs['category']!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        size: 16, color: Colors.amber),
                                    const SizedBox(width: 4),
                                    Text(
                                      rs['rating'].toString(),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        rs['address']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // 📍 Jarak
                          Text(
                            rs['distance']!,
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
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

  // 🔹 Widget Filter Chip
  static Widget _filterChip(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF6CA8A1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF6CA8A1)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF6CA8A1),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
