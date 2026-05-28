import 'package:flutter/material.dart';

class RiwayatPesananPage extends StatelessWidget {
  const RiwayatPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Flowers.co",
          style: TextStyle(
            color: Color(0xFFD63384),
            fontSize: 22,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Riwayat Pesanan",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Tinjau dan lacak pesanan karangan bunga Anda baru-baru ini.",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 25),

            // Item #1: Terkirim
            _buildHistoryItem(
              orderCode: "#PNP-8472",
              dateInfo: "24 Okt 2023 • 2 Barang",
              price: "150.000",
              statusText: "Terkirim",
              badgeColor: const Color(0xFFE9ECEF),
              textColor: Colors.black54,
              isSuccess: true,
            ),
            const SizedBox(height: 16),

            // Item #2: Diproses
            _buildHistoryItem(
              orderCode: "#PNP-8510",
              dateInfo: "02 Nov 2023 • 1 Barang",
              price: "75.000",
              statusText: "Diproses",
              badgeColor: const Color(0xFFE83E8C),
              textColor: Colors.white,
              isSuccess: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem({
    required String orderCode,
    required String dateInfo,
    required String price,
    required String statusText,
    required Color badgeColor,
    required Color textColor,
    required bool isSuccess,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gambar Thumbnail Bulat Samping Kiri
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.local_florist,
              color: Color(0xFFD63384),
              size: 26,
            ),
          ),
          const SizedBox(width: 14),

          // Area Teks Tengah (Dibungkus Expanded agar tidak meluap)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menggunakan Wrap sebagai pengganti Row agar fleksibel jika layar sempit
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Text(
                      "Pesanan $orderCode",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Menjaga badge tetap pas dengan teksnya
                        children: [
                          Icon(
                            isSuccess
                                ? Icons.check_circle_outline
                                : Icons.cached,
                            size: 11,
                            color: textColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            statusText,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  dateInfo,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Text(
                  "Rp $price",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBC1A6F),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Panah Dropdown Kanan
          const Icon(Icons.keyboard_arrow_down, color: Colors.black38),
        ],
      ),
    );
  }
}
