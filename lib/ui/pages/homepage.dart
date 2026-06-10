import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/models/product_model.dart';
import '../../data/models/app_state.dart';

class HomePage extends StatefulWidget {
  final Function(String) onNavigateToKatalog; // Callback diubah agar bisa mengirim data teks kategori

  const HomePage({super.key, required this.onNavigateToKatalog});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String baseUrl = 'http://localhost/api_flowers';
  List<Product> _featuredProducts = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final url = Uri.parse('$baseUrl/get_products.php');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Product> products = body
            .map((dynamic item) => Product.fromJson(item))
            .toList();
        
        setState(() {
          // Mengambil 3 produk pertama sebagai produk pilihan untuk beranda
          _featuredProducts = products.take(3).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Gagal memuat produk';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal terhubung ke server: $e';
        _isLoading = false;
      });
    }
  }

  // WIDGET HELPER: Kartu Kesempatan (Mendukung aksi klik)
  Widget _buildOccasionCard({
    required String title,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black.withOpacity(0.35),
          ),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(14),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  // WIDGET HELPER: Item List Produk Vertikal
  Widget _buildVerticalProductCard({
    required BuildContext context,
    required Product product,
  }) {
    String imageUrl = 'http://localhost/api_flowers/img/${product.gambar}';
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: ValueListenableBuilder<List<Product>>(
                  valueListenable: AppState.wishlistNotifier,
                  builder: (context, wishlist, child) {
                    bool isFavorited = wishlist.any((e) => e.id == product.id);
                    return GestureDetector(
                      onTap: () => AppState.toggleWishlist(product, context),
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        radius: 16,
                        child: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: isFavorited ? const Color(0xFFBC1A6F) : Colors.black54,
                        ),
                      ),
                    );
                  },
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
                      product.nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Rp ${product.harga.toInt().toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (Match m) => "${m[1]}.")}',
                      style: const TextStyle(
                        color: Color(0xFFBC1A6F),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "Buket bunga segar pilihan terbaik untuk momen spesial Anda.",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      AppState.addToCart(product, context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFBC1A6F)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Tambah ke Keranjang",
                      style: TextStyle(
                        color: Color(0xFFBC1A6F),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HERO BANNER
          Container(
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1526047932273-341f2a7631f9?q=80&w=1000',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.2),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Katakan\ndengan\nBunga",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Buket pilihan untuk setiap momen tulus, dirangkai dengan cinta dan dikirim dengan penuh perhatian.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => widget.onNavigateToKatalog('Semua Produk'), // Pindah tab halus
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBC1A6F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      "Belanja Koleksi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // KATEGORI
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Belanja Berdasarkan\nKesempatan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
              children: [
                _buildOccasionCard(
                  title: "Ulang Tahun",
                  imageUrl: 'https://images.unsplash.com/photo-1533616688419-b7a585564566?q=80&w=500',
                  onTap: () => widget.onNavigateToKatalog('Ulang Tahun'),
                ),
                _buildOccasionCard(
                  title: "Anniversary",
                  imageUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=500',
                  onTap: () => widget.onNavigateToKatalog('Anniversary'),
                ),
                _buildOccasionCard(
                  title: "Pernikahan",
                  imageUrl: 'https://images.unsplash.com/photo-1523438885200-e635ba2c371e?q=80&w=500',
                  onTap: () => widget.onNavigateToKatalog('Pernikahan'),
                ),
                _buildOccasionCard(
                  title: "Wisuda",
                  imageUrl: 'https://images.unsplash.com/photo-1544816155-12df9643f363?q=80&w=500',
                  onTap: () => widget.onNavigateToKatalog('Wisuda'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // PRODUK PILIHAN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Bunga Pilihan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => widget.onNavigateToKatalog('Semua Produk'),
                  child: const Text(
                    "Lihat Semua",
                    style: TextStyle(
                      color: Color(0xFFBC1A6F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Menampilkan Produk Dinamis dari Database
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(color: Color(0xFFBC1A6F)),
              ),
            )
          else if (_errorMessage.isNotEmpty)
            Center(child: Text(_errorMessage))
          else if (_featuredProducts.isEmpty)
            const Center(child: Text("Tidak ada produk pilihan."))
          else
            ..._featuredProducts.map((product) {
              return _buildVerticalProductCard(
                context: context,
                product: product,
              );
            }).toList(),
            
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}