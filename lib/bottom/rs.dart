import 'package:flutter/material.dart';

class RumahSakit extends StatefulWidget {
  const RumahSakit({super.key});

  @override
  State<RumahSakit> createState() => _RumahSakitState();
}

class _RumahSakitState extends State<RumahSakit> {
  final List<Map<String, String>> hospitals = [
    {
      'name': 'RSUD Dr. H. Slamet Martodirdjo (RSUD Smart)',
      'category': 'Rumah Sakit Umum',
      'rating': '4.4',
      'address': 'Jl. Raya Panglegur No. 4, Kramat...',
      'distance': '5.8 km',
      'image': 'assets/image/RS_slamet.jpeg',
    },
    {
      'name': 'RSUD Mohammad Noer Provinsi Jawa Timur',
      'category': 'Rumah Sakit',
      'rating': '4.6',
      'address': 'Jl. Bonorogo No. 17, Taman...',
      'distance': '8.7 km',
      'image': 'assets/image/RS_noer.jpeg',
    },
    {
      'name': 'Kusuma Hospital',
      'category': 'Rumah Sakit',
      'rating': '4.5',
      'address': 'Jl. Bonorogo No. 3, Taman...',
      'distance': '8.6 km',
      'image': 'assets/image/kusuma.jpeg',
    },
    {
      'name': 'RSUD Waru Pamekasan',
      'category': 'Rumah Sakit',
      'rating': '3.6',
      'address': 'Jl. Palalangan, Waru Bar...',
      'distance': '41 km',
      'image': 'assets/image/RS_waru.jpeg',
    },
    {
      'name': 'Rumah Sakit Larasati',
      'category': 'Rumah Sakit Umum',
      'rating': '4.1',
      'address': 'Jl. Mandilaras No. 74-80...',
      'distance': '8.4 km',
      'image': 'assets/image/larasati.jpeg',
    },
    {
      'name': 'Rumah Sakit Umum Asyifa Husada',
      'category': 'Rumah Sakit',
      'rating': '4.3',
      'address': 'Jl.Mandilaras No. 80 - 90...',
      'distance': '8.5 km',
      'image': 'assets/image/asyifa.jpeg',
    },
  ];

  int selectedTab = 0;
  final List<String> kategori = [
    "Semua", "Umum", "Gigi & Mulut", "Hewan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text(
          "Info Rumah Sakit",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
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
                hintText: 'Cari nama rumah sakit atau lokasi...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFE0F2F1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF6CA8A1)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        kategori[index],
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFF116686)
                              : Colors.black87,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
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
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  final berita = hospitals[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailBeritaPage(berita: berita),
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
                              berita['image']!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  berita['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  berita['category']!,
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
                                      berita['rating'].toString(),
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        berita['address']!,
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

                          Text(
                            berita['distance']!,
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
}

class DetailBeritaPage extends StatefulWidget {
  const DetailBeritaPage({super.key, required Map<String, String> berita});

  @override
  State<DetailBeritaPage> createState() => _DetailBeritaPageState();
}

class _DetailBeritaPageState extends State<DetailBeritaPage> {
  String selectedFilter = "Semua";

  final List<Map<String, dynamic>> rooms = [
    {
      'name': 'RSUD Dr. H. Slamet Martodirdjo (RSUD Smart)',
      'category': 'Rumah Sakit Umum',
      'rating': '4.4',
      'address': 'Jl. Raya Panglegur No. 4, Kramat...',
      'distance': '5.8 km',
      'image': 'assets/image/RS_slamet.jpeg',
    },
  ];

  final List<Map<String, dynamic>> roomDetails = [
    {
      'name': 'Kamar VIP',
      'gambar': 'assets/image/kelasvip.jpeg',
      'rating': '4.9',
      'desc':
          'Ruangan luas, kamar mandi dalam, TV, kulkas, sofa, jendela besar',
      'price': 'Rp 1.500.000 / malam',
    },
    {
      'name': 'Kamar Kelas 1',
      'gambar': 'assets/image/kelas1.jpeg',
      'rating': '4.5',
      'desc': '2 ranjang, kamar mandi dalam, TV',
      'price': 'Rp 750.000 / malam',
    },
    {
      'name': 'Kamar Kelas 2',
      'gambar': 'assets/image/kelas2.jpeg',
      'rating': '4.5',
      'desc': '2 ranjang, kamar mandi dalam, TV',
      'price': 'Rp 750.000 / malam',
    },
    {
      'name': 'Kamar Kelas 3',
      'gambar': 'assets/image/kelas3.jpeg',
      'rating': '4.5',
      'desc': '2 ranjang, kamar mandi dalam, TV',
      'price': 'Rp 750.000 / malam',
    },
  ];

  final List<String> filters = ["Semua", "Kelas 1", "Kelas 2", "Isolasi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6CA8A1),
        title: const Text(
          "Pemesanan Kamar",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Info Rumah Sakit
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/image/RS_slamet.jpeg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RSUD Dr. H. Slamet Martodirdjo (RSUD Smart)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text("Umum"),
                        Text(
                          "Jl Kopo No. 12...",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "1.1 km",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6CA8A1),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Filter Kategori
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = filter == selectedFilter;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6CA8A1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF6CA8A1)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade700,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Daftar Kamar
            Expanded(
              child: ListView.builder(
                itemCount: roomDetails.length,
                itemBuilder: (context, index) {
                  final room = roomDetails[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              room['gambar']!,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "RSUD Dr. H. Slamet Martodirdjo (RSUD Smart)",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                room['name'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${room['rating']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                room['desc'],
                                style: const TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    room['price'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6CA8A1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text("Pilih Kamar"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
