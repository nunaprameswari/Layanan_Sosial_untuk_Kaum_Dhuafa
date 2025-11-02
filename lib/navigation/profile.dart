import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6CA8A1), // 💚 warna toska
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Akun Layanan Sosial",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // 🔹 Isi Halaman
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔶 Tombol Masuk / Daftar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF6CA8A1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Masuk / Daftar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Info login
            const Row(
              children: [
                Icon(Icons.volunteer_activism,
                    color: Color(0xFF6CA8A1), size: 20),
                SizedBox(width: 6),
                Text(
                  "Login untuk mendukung program sosial",
                  style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Menu Utama
            _buildMenuSection(
              title: "Riwayat Donasi",
              icon: Icons.favorite_rounded,
              color: const Color(0xFF6CA8A1),
            ),
            _buildMenuSection(
              title: "Program Sosial",
              icon: Icons.volunteer_activism_rounded,
              color: const Color(0xFF6CA8A1),
            ),
            _buildMenuSection(
              title: "Data Relawan",
              icon: Icons.groups_2_rounded,
              color: const Color(0xFF6CA8A1),
            ),
            _buildMenuSection(
              title: "Bantuan & Konsultasi",
              icon: Icons.help_outline_rounded,
              color: const Color(0xFF6CA8A1),
            ),
            _buildMenuSection(
              title: "Informasi Lembaga",
              icon: Icons.apartment_rounded,
              color: const Color(0xFF6CA8A1),
            ),

            const SizedBox(height: 16),

            // 🔹 Menu Pengaturan
            _buildMenuSection(
              title: "Pengaturan Akun",
              icon: Icons.settings_rounded,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }

  // 🔸 Widget Menu Reusable
  Widget _buildMenuSection({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
