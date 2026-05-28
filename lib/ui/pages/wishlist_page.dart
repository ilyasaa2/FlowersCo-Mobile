import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  // Tetap menggunakan const constructor agar aman di MainNavigation
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // INTEGRASI DRAWER YANG SAMA DENGAN HOMEPAGE
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFD63384)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xFFD63384),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Menu Flowers.co",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Color(0xFFD63384),
              ),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.pop(context); // Tutup laci drawer
                Navigator.pushNamed(context, '/'); // Navigasi ke Beranda
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.admin_panel_settings_outlined,
                color: Color(0xFFD63384),
              ),
              title: const Text('Mode Admin'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: Colors.grey),
              title: const Text('Pengaturan Aplikasi'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        // MENGGUNAKAN BUILDER AGAR TOMBOL RESPONSIP MEMBUKA DRAWER
        leading: Builder(
          builder: (internalContext) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFFBC1A6F)),
            onPressed: () {
              Scaffold.of(internalContext).openDrawer(); // Membuka laci drawer
            },
          ),
        ),
        
        centerTitle: true,
        title: const Text(
          "Wishlist",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontSize: 22,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Koleksi bunga favorit pilihan Anda.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),

              // GRID LIST WISH ITEM (Sesuai tampilan screenshot kamu)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 1, // Dibuat list vertikal melebar seperti screenshot
                childAspectRatio: 0.75,
                mainAxisSpacing: 20,
                children: [
                  _buildWishlistItem(
                    name: "Peony Merona",
                    price: "Rp 850.000",
                    status: "Tersedia",
                    statusColor: const Color(0xFFD63384),
                    buttonText: "Terpilih",
                    isButtonActive: true,
                    imageUrl: 'https://images.unsplash.com/photo-1561181286-d3fee7d55364?q=80&w=600',
                  ),
                  _buildWishlistItem(
                    name: "Mawar Merah Tua",
                    price: "Rp 1.200.000",
                    status: "Terlaris",
                    statusColor: Colors.purple,
                    buttonText: "Tambah",
                    isButtonActive: false,
                    imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8?q=80&w=600',
                  ),
                  _buildWishlistItem(
                    name: "Anggrek Malam",
                    price: "Rp 950.000",
                    status: "Tersedia",
                    statusColor: const Color(0xFFD63384),
                    buttonText: "Tambah",
                    isButtonActive: false,
                    imageUrl: 'https://images.unsplash.com/photo-1525310072745-f49212b5ac6d?q=80&w=600',
                  ),
                  _buildWishlistItem(
                    name: "Lili Putih",
                    price: "Rp 700.000",
                    status: "Sedang Tidak Musim",
                    statusColor: Colors.grey,
                    buttonText: "Beri tahu saya",
                    isButtonActive: false,
                    isGreyedOut: true,
                    imageUrl: 'https://images.unsplash.com/photo-1572454530994-4eb15933d24e?q=80&w=600',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET HELPER: Komponen Item Halaman Wishlist
  Widget _buildWishlistItem({
    required String name,
    required String price,
    required String status,
    required Color statusColor,
    required String buttonText,
    required bool isButtonActive,
    required String imageUrl,
    bool isGreyedOut = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ColorFiltered(
        colorFilter: isGreyedOut
            ? const ColorFilter.mode(Colors.grey, BlendMode.saturation)
            : const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Tag Status (Tersedia / Terlaris / Tidak Musim)
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Tombol Heart Merah di Pojok Kanan Atas
                  Positioned(
                    top: 12,
                    right: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: Icon(
                        isGreyedOut ? Icons.favorite_border : Icons.favorite,
                        size: 18,
                        color: isGreyedOut ? Colors.grey : const Color(0xFFD63384),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Rangkai bunga pilihan berkualitas tinggi untuk menyempurnakan hari Anda...",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xFFD63384),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      // Tombol Aksi dinamis (Terpilih / Tambah / Beri tahu saya)
                      ElevatedButton.icon(
                        onPressed: isGreyedOut ? null : () {},
                        icon: isButtonActive 
                            ? const Icon(Icons.check, size: 16, color: Colors.white)
                            : const Icon(Icons.add_shopping_cart, size: 16, color: Color(0xFFD63384)),
                        label: Text(
                          buttonText,
                          style: TextStyle(
                            color: isButtonActive ? Colors.white : const Color(0xFFD63384),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonActive 
                              ? const Color(0xFFD63384) 
                              : Colors.white,
                          elevation: 0,
                          side: BorderSide(
                            color: isGreyedOut ? Colors.grey : const Color(0xFFD63384),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}