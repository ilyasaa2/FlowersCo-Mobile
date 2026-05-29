import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/custom_sidebar.dart';
import '../../data/models/product_model.dart';
import '../../data/models/app_state.dart';

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  // Fungsi untuk mengambil data dari MySQL via API Web Anda
  Future<List<Product>> _fetchProductsFromDatabase() async {
    // Ganti URL di bawah ini dengan URL file PHP/API di hosting/web server Anda
    final url = Uri.parse('http://localhost/api_flowers/get_products.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Product> products = body
            .map((dynamic item) => Product.fromJson(item))
            .toList();
        return products;
      } else {
        throw Exception('Gagal memuat produk dari server');
      }
    } catch (e) {
      throw Exception('Gagal terhubung ke server: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomSidebar(), // Sesuaikan warna background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- REVISI: JUDUL SEKARANG RATA KIRI (LEBIH CANTIK & KONSISTEN) ---
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Katalog',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBC1A6F),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Temukan buket sempurna untuk setiap\nkesempatan',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- SEARCH BAR ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari produk...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- FILTER CHIPS ---
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('Semua Produk', isSelected: true),
                    _buildFilterChip('Valentine', icon: Icons.favorite),
                    _buildFilterChip('Ulang Tahun', icon: Icons.cake),
                    _buildFilterChip('Wisuda', icon: Icons.school),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // --- PRODUCT GRID DENGAN FUTUREBUILDER (DARI DATABASE) ---
              FutureBuilder<List<Product>>(
                future: _fetchProductsFromDatabase(),
                builder: (context, snapshot) {
                  // Saat data sedang loading/loading dari web
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFBC1A6F),
                          ),
                        ),
                      ),
                    );
                  }

                  // Jika terjadi error saat fetch data
                  if (snapshot.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          'Error: ${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  }

                  // Jika data kosong
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text('Tidak ada produk tersedia di database.'),
                      ),
                    );
                  }

                  // Jika data berhasil diambil, tampilkan ke GridView
                  final products = snapshot.data!;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.60,
                        ),
                    itemBuilder: (context, index) {
                      return _buildProductCard(
                        context: context,
                        item: products[index],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    String label, {
    bool isSelected = false,
    IconData? icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFBC1A6F) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFBC1A6F), width: 1),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : const Color(0xFFBC1A6F),
            ),
          if (icon != null) const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFFBC1A6F),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required BuildContext context,
    required Product item,
  }) {
    bool isBestSeller = item.kategori == 'Best Seller';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      'http://localhost/api_flowers/img/${item.gambar}',
                      fit: BoxFit.cover,
                      // 1. Menangani jika item.gambar kosong atau null di database
                      errorBuilder: (context, error, stackTrace) {
                        // 2. Jika gagal (baik karena file tidak ada di folder img atau masalah CORS),
                        // maka tampilkan gambar default dari aset lokal Anda
                        return Image.asset(
                          'assets/bunga_default.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                if (isBestSeller)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBC1A6F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'TERLARIS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: ValueListenableBuilder<List<Product>>(
                    valueListenable: AppState.wishlistNotifier,
                    builder: (context, wishlist, child) {
                      bool isFavorited = wishlist.any((e) => e.id == item.id);
                      return IconButton(
                        icon: Icon(
                          isFavorited
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorited
                              ? const Color(0xFFBC1A6F)
                              : Colors.black45,
                          size: 26,
                        ),
                        onPressed: () {
                          AppState.toggleWishlist(item, context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp ${item.harga.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: const TextStyle(
                    color: Color(0xFFBC1A6F),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: OutlinedButton(
                    onPressed: () {
                      AppState.addToCart(item, context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFBC1A6F)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Tambah ke Keranjang',
                      style: TextStyle(
                        color: Color(0xFFBC1A6F),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
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
