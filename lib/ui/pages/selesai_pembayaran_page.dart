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
                "Pembayaran Berhasil!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Terima kasih atas pembayaran Anda. Pesanan Anda telah diterima oleh Florist kami dan akan segera diproses.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // PILIHAN 1: Tombol Lacak Pesanan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Buka halaman Lacak Pesanan yang terdaftar di route '/lacak-pesanan'
                    Navigator.pushNamed(context, '/lacak-pesanan');
                  },
                  icon: const Icon(Icons.local_shipping, color: Colors.white),
                  label: const Text(
                    "Lacak Pesanan Anda",
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
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // PILIHAN 2: Tombol Kembali ke Beranda
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Pindah ke MainNavigationPage dan minta buka Index Beranda (Index 0)
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        // 👈 KATA 'const' DI SINI JUGA SUDAH DIHAPUS
                        builder: (context) =>
                            MainNavigationPage(initialIndex: 0),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Color(0xFFBC1A6F),
                  ),
                  label: const Text(
                    "Kembali ke Beranda",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBC1A6F),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFBC1A6F),
                      width: 1.5,
                    ),
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
