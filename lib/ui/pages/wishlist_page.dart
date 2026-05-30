import 'package:flutter/material.dart';
import '../../data/models/app_state.dart';
import '../../data/models/product_model.dart';
import '../components/custom_sidebar.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryPink = Color(0xFFBC1A6F); // Warna khas Flowers.co

    return Material(
      color: Colors.white, // Sesuaikan background
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= JUDUL HALAMAN =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wishlist',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Koleksi bunga favorit pilihan Anda.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54, // Perbaikan dari Colors.black70
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // ================= REAL-TIME INTEGRATED BODY =================
            Expanded(
              child: ValueListenableBuilder<List<Product>>(
                valueListenable: AppState
                    .wishlistNotifier, // Mengupate UI otomatis dari Beranda/Katalog
                builder: (context, wishlistItems, child) {
                  // TAMPILAN JIKA WISHLIST KOSONG (Kreatif & Unik)
                  if (wishlistItems.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: primaryPink.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite_border_rounded,
                                size: 80,
                                color: primaryPink,
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Bunga Favoritmu Masih Bersembunyi!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Wah, sekeranjang rindu tapi wishlist masih kosong? Yuk, jelajahi katalog dan hiasi halaman ini dengan buket impianmu!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Direct langsung ke katalog agar user bisa belanja
                                Navigator.pushNamed(context, '/katalog');
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              label: const Text('Cari Buket Cantik'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryPink,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // TAMPILAN JIKA ADA PRODUK (Sesuai Mockup)
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      final product = wishlistItems[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        elevation: 0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: Colors.grey.shade100),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Stack Gambar, Tombol Heart, dan Label Kategori
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Image.network(
                                    product.gambar,
                                    height: 380,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              height: 380,
                                              color: Colors.grey.shade200,
                                              child: const Icon(
                                                Icons.broken_image,
                                                size: 50,
                                              ),
                                            ),
                                  ),
                                ),
                                // Label Status/Kategori (Pojok Kiri Bawah Gambar)
                                Positioned(
                                  bottom: 12,
                                  left: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      product
                                          .kategori, // Mengambil kategori produk dinamis
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                                // Tombol Un-Wishlist Heart Merah (Pojok Kanan Atas)
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Fungsi hapus dari wishlist
                                      List<Product> updatedList = List.from(
                                        AppState.wishlistNotifier.value,
                                      );
                                      updatedList.removeWhere(
                                        (item) => item.id == product.id,
                                      );
                                      AppState.wishlistNotifier.value =
                                          updatedList;

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '${product.nama} dihapus dari wishlist',
                                          ),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons
                                            .favorite, // Isi penuh pink karena terpilih
                                        color: primaryPink,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Info Detail Produk & Tombol Tambah
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.nama,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Rangkaian bunga ${product.nama.toLowerCase()} segar pilihan terbaik, sempurna untuk momen spesial Anda.',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rp ${product.harga.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: primaryPink,
                                        ),
                                      ),
                                      // Tombol Tambah ke Keranjang
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          // Pengecekan menggunakan AppState.cartNotifier untuk mencegah duplikat
                                          if (AppState.cartNotifier.value.any(
                                            (item) => item.id == product.id,
                                          )) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Produk sudah ada di keranjang!',
                                                ),
                                              ),
                                            );
                                          } else {
                                            // Jika belum ada, panggil fungsi bawaan dari AppState kamu
                                            AppState.addToCart(
                                              product,
                                              context,
                                            );
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.add_shopping_cart,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        label: const Text('Tambah'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryPink,
                                          foregroundColor: Colors.white,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
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
