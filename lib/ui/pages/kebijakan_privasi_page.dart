import 'package:flutter/material.dart';

class KebijakanPrivasiPage extends StatelessWidget {
  const KebijakanPrivasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kebijakan Privasi")),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kebijakan Privasi Flowers.co",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Terakhir diperbarui: Mei 2026\n\nKami di Flowers.co sangat menghargai privasi Anda. Halaman ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda saat menggunakan aplikasi kami.\n\n1. Pengumpulan Data\nKami mengumpulkan informasi yang Anda berikan secara langsung kepada kami, seperti saat Anda membuat akun, melakukan pembelian, atau menghubungi layanan pelanggan.\n\n2. Penggunaan Data\nData Anda digunakan untuk memproses pesanan, mengirimkan notifikasi pengiriman, dan memberikan rekomendasi bunga yang relevan.",
            ),
          ],
        ),
      ),
    );
  }
}
