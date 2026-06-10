import 'package:flutter/material.dart';
import 'main_navigation_page.dart';
// Import agar bisa melempar index navbar

class SelesaiPage extends StatelessWidget {
  const SelesaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Tanda Centang Sukses
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF0F5),
                ),
                child: const Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Color(0xFFBC1A6F), // Warna utama Flowers.co kamu
                ),
              ),
              const SizedBox(height: 32),

              // Teks Informasi
              const Text(
                "Pesanan Terkirim!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Terima kasih! Pesanan Anda telah kami terima. Mohon tunggu konfirmasi pembayaran dari Admin.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Tombol Utama: Kembali ke Beranda
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MainNavigationPage(initialIndex: 0),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Kembali ke Beranda",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBC1A6F),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
