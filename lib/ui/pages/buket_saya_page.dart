import 'package:flutter/material.dart';

class BuketSayaPage extends StatefulWidget {
  const BuketSayaPage({super.key});

  @override
  State<BuketSayaPage> createState() => _BuketSayaPageState();
}

class _BuketSayaPageState extends State<BuketSayaPage> {
  // Menyimpan status filter yang dipilih saat ini
  String _selectedFilter = "Semua";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context); // Otomatis kembali ke halaman sebelumnya
          },
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Buket Saya",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBC1A6F),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Koleksi pilihan pesanan aktif Anda dan rangkaian bunga favorit sebelumnya.",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 15),

            // --- FILTER CHIPS BAR PERFEKTIF ---
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("Semua"),
                  _buildFilterChip("Pesanan Aktif"),
                  _buildFilterChip("Terdahulu"),
                  _buildFilterChip("Tersimpan"),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // --- LIST KARTU SESUAI FIGMA & FILTER YANG DIPILIH ---

            // 1. Midnight Rose (Masuk kategori 'Semua' dan 'Pesanan Aktif')
            if (_selectedFilter == "Semua" ||
                _selectedFilter == "Pesanan Aktif") ...[
              _buildBouquetCard(
                context: context,
                title: "Midnight Rose",
                description:
                    "Komposisi dramatis dan elegan dari mawar merah tua yang lembut dan dedaunan yang kontras.",
                badgeText: "Dalam Perjalanan",
                badgeColor: const Color(0xFFFFEBEE),
                badgeTextColor: Colors.red.shade700,
                infoLabel: "Perkiraan Pengiriman",
                infoValue: "Besok, 14:00",
                buttonText: "Lacak Pesanan",
                isPrimaryButton: true,
                hasHeartIcon: false,
                onButtonTap: () =>
                    Navigator.pushNamed(context, '/lacak-pesanan'),
              ),
              const SizedBox(height: 20),
            ],

            // 2. Summer Serenity (Masuk kategori 'Semua' dan 'Terdahulu')
            if (_selectedFilter == "Semua" ||
                _selectedFilter == "Terdahulu") ...[
              _buildBouquetCard(
                context: context,
                title: "Summer Serenity",
                description: "Terkirim pada 12 Agt 2023",
                badgeText: "Terkirim",
                badgeColor: const Color(0xFFF1F3F5),
                badgeTextColor: Colors.black54,
                infoLabel: "",
                infoValue: "",
                buttonText: "Pesan Lagi",
                isPrimaryButton: false,
                hasHeartIcon: true,
                onButtonTap: () {},
              ),
              const SizedBox(height: 20),
            ],

            // 3. Wild Berry (Masuk kategori 'Semua' dan 'Tersimpan')
            if (_selectedFilter == "Semua" ||
                _selectedFilter == "Tersimpan") ...[
              _buildBouquetCard(
                context: context,
                title: "Wild Berry",
                description:
                    "Dahlia mencolok dan aksen lavender untuk karya yang memukau.",
                badgeText: "Ide Tersimpan",
                badgeColor: const Color(0xFFF1F3F5),
                badgeTextColor: Colors.black54,
                infoLabel: "",
                infoValue: "",
                buttonText: "Lihat Detail",
                isPrimaryButton: false,
                hasHeartIcon: false,
                onButtonTap: () {},
              ),
              const SizedBox(height: 20),
            ],

            // 4. Cloud Nine (Masuk kategori 'Semua' dan 'Terdahulu')
            if (_selectedFilter == "Semua" ||
                _selectedFilter == "Terdahulu") ...[
              _buildBouquetCard(
                context: context,
                title: "Cloud Nine",
                description: "Terkirim pada 04 Mei 2023",
                badgeText: "Terkirim",
                badgeColor: const Color(0xFFF1F3F5),
                badgeTextColor: Colors.black54,
                infoLabel: "",
                infoValue: "",
                buttonText: "Pesan Lagi",
                isPrimaryButton: false,
                hasHeartIcon: false,
                onButtonTap: () {},
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),

      // --- NAVBAR BOTTOM ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, "Beranda", false, () {
                Navigator.pushReplacementNamed(context, '/homepage');
              }),
              _buildNavItem(Icons.local_florist_outlined, "Katalog", false, () {
                Navigator.pushReplacementNamed(context, '/katalog');
              }),
              _buildNavItem(Icons.favorite_border, "Wishlist", false, () {
                Navigator.pushReplacementNamed(context, '/wishlist');
              }),
              _buildNavItem(Icons.person_outline, "Akun", false, () {
                Navigator.pushReplacementNamed(context, '/profile');
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget untuk Item Navigasi Kustom (Efek Pill Pink)
  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 20 : 10,
          vertical: isActive ? 8 : 4,
        ),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFD63384) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : const Color(0xFF5A4A4A),
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive ? Colors.white : const Color(0xFF5A4A4A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label; // Mengubah filter aktif
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFBC1A6F)
              : const Color(0xFFF8D7DA).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFBC1A6F),
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildBouquetCard({
    required BuildContext context,
    required String title,
    required String description,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required String infoLabel,
    required String infoValue,
    required String buttonText,
    required bool isPrimaryButton,
    required bool hasHeartIcon,
    required VoidCallback onButtonTap,
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: badgeTextColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        badgeText,
                        style: TextStyle(
                          color: badgeTextColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Icon(
                      hasHeartIcon ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFFBC1A6F),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                if (infoLabel.isNotEmpty) ...[
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.local_shipping_outlined,
                              size: 16,
                              color: Color(0xFFBC1A6F),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              infoLabel,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              infoValue,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const LinearProgressIndicator(
                          value: 0.6,
                          minHeight: 4,
                          backgroundColor: Color(0xFFE9ECEF),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFBC1A6F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: onButtonTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPrimaryButton
                          ? const Color(0xFFBC1A6F)
                          : const Color(0xFFFFF5F8),
                      foregroundColor: isPrimaryButton
                          ? Colors.white
                          : const Color(0xFFBC1A6F),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: const Color(0xFFBC1A6F),
                          width: isPrimaryButton ? 0 : 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (isPrimaryButton) ...[
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward, size: 14),
                        ],
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
}
