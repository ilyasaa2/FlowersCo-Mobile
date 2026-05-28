import 'package:flutter/material.dart';

class LacakPesananPage extends StatelessWidget {
  const LacakPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD63384)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Lacak Pesanan",
          style: TextStyle(
            color: Color(0xFFD63384),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFFD63384),
            ),
            onPressed: () => Navigator.pushNamed(context, '/keranjang'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. CARD PETA / ESTIMASI TIBA ---
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  // Menggunakan placeholder map yang mirip dengan gambar mockup
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=600',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Overlay warna maroon transparan khas desain Flowers.co
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF6A1B4D).withOpacity(0.3),
                    ),
                  ),
                  // PIN Rumah
                  const Positioned(
                    bottom: 40,
                    right: 40,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: Icon(
                        Icons.home,
                        color: Color(0xFFD63384),
                        size: 18,
                      ),
                    ),
                  ),
                  // PIN Kurir Motor (Tengah)
                  const Positioned(
                    top: 80,
                    left: 140,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFD63384),
                      radius: 18,
                      child: Icon(
                        Icons.motorcycle,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  // PIN Toko/Asal
                  const Positioned(
                    top: 40,
                    left: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFFD63384),
                        size: 18,
                      ),
                    ),
                  ),
                  // Widget Estimasi Tiba di Kanan Atas
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Color(0xFFD63384),
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Estimasi Tiba",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "12:00",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFD63384),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- 2. CARD DETAIL PRODUK & KURIR ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Detail Produk
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: const Color(
                            0xFF222222,
                          ), // Background gelap sesuai mockup bunga mawar gelap
                          child: const Icon(
                            Icons.local_florist,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Midnight Rose",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "ID Pesanan: #PP-847291",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(color: Color(0xFFEEEEEE), height: 1),
                  ),
                  // Detail Nama Kurir & Tombol Hubungi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFFE9ECEF),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kurir",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Budi Santoso",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.phone_in_talk_outlined,
                          size: 14,
                        ),
                        label: const Text(
                          "Hubungi",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFD63384),
                          side: const BorderSide(color: Color(0xFFD63384)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- 3. SEKSI STATUS PESANAN (TIMELINE) ---
            const Text(
              "Status Pesanan",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Item 1: Pesanan Diterima (Selesai)
            _buildTimelineItem(
              title: "Pesanan Diterima",
              subtitle: "Pembayaran terverifikasi dan pesanan sedang diproses.",
              time: "10:00",
              isCompleted: true,
              isFirst: true,
            ),

            // Item 2: Bunga Sedang Dirangkai (Selesai)
            _buildTimelineItem(
              title: "Bunga Sedang Dirangkai",
              subtitle:
                  "Florist kami sedang merangkai pesanan Anda dengan hati-hati.",
              time: "10:30",
              isCompleted: true,
            ),

            // Item 3: Dalam Perjalanan (Sedang Aktif - Card Pink Highlighted)
            _buildActiveTimelineItem(
              title: "Dalam Perjalanan",
              subtitle: "Kurir sedang menuju ke lokasi pengiriman.",
              time: "11:30",
            ),

            // Item 4: Sampai (Belum Selesai)
            _buildTimelineItem(
              title: "Sampai",
              subtitle: "Pesanan tiba di lokasi tujuan.",
              time: "Estimasi 12:15",
              isCompleted: false,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk Baris Tracker Standar (Selesai & Belum Selesai)
  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String time,
    required bool isCompleted,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kolom Indikator Garis dan Lingkaran
          Column(
            children: [
              Container(
                width: 2,
                height: 10,
                color: isFirst ? Colors.transparent : const Color(0xFFD63384),
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: isCompleted
                    ? const Color(0xFFD63384)
                    : const Color(0xFFE0E0E0),
                child: isCompleted
                    ? const Icon(Icons.check, size: 8, color: Colors.white)
                    : null,
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: isLast ? Colors.transparent : const Color(0xFFE0E0E0),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Kolom Konten Teks
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: isCompleted ? Colors.black87 : Colors.black38,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: isCompleted ? Colors.black54 : Colors.black38,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11,
                      color: isCompleted ? Colors.black45 : Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget khusus untuk Status yang Sedang Aktif (Kotak Highlight Pink)
  Widget _buildActiveTimelineItem({
    required String title,
    required String subtitle,
    required String time,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kolom Indikator Garis dan Lingkaran Aktif
          Column(
            children: [
              Container(width: 2, height: 10, color: const Color(0xFFD63384)),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFCE4EC), // Outer ring soft pink
                ),
                child: const CircleAvatar(
                  radius: 5,
                  backgroundColor: Color(0xFFD63384), // Inner circle hot pink
                ),
              ),
              Expanded(
                child: Container(width: 2, color: const Color(0xFFE0E0E0)),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Kotak Konten Highlighted
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFFFF0F5,
                  ), // Latar belakang pink muda tipis
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFAD2E1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFFD63384),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD63384),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
