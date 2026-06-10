import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/models/product_model.dart';
import '../../data/models/app_state.dart';

class KatalogPage extends StatefulWidget {
  final String? initialCategory; // Menerima lemparan data kategori awal dari HomePage

  const KatalogPage({super.key, this.initialCategory});

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  final String baseUrl = 'http://localhost/api_flowers'; 

  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = true;
  String _errorMessage = '';
  
  String _selectedCategory = 'Semua Produk'; // Menyimpan state kategori aktif di Katalog
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory ?? 'Semua Produk';
    _loadProducts();
  }

  // JIKA WIDGET DI-REBUILD OLEH PARENT (Ditekan dari HomePage)
  @override
  void didUpdateWidget(covariant KatalogPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCategory != oldWidget.initialCategory) {
      setState(() {
        _selectedCategory = widget.initialCategory ?? 'Semua Produk';
      });
      _applyFilter(); // Terapkan filter otomatis
    }
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
          _allProducts = products;
          _isLoading = false;
        });
        _applyFilter(); // Filter data setelah sukses dimuat pertama kali
      } else {
        setState(() {
          _errorMessage = 'Gagal memuat produk dari server';
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

  // FUNGSI UTAMA: Menggabungkan Filter Kategori & Filter Search Bar
  void _applyFilter() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        // 1. Cek search bar cocok atau tidak
        bool matchesSearch = product.nama.toLowerCase().contains(query);
        
        // 2. Cek kategori cocok atau tidak (Gunakan toLowerCase agar aman dari perbedaan huruf kapital di DB)
        bool matchesCategory = _selectedCategory == 'Semua Produk' ||
            product.kategori.toLowerCase() == _selectedCategory.toLowerCase();

        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER & SEARCH BAR ---
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Katalog',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBC1A6F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Temukan buket sempurna untuk setiap kesempatan',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),

                  // --- SEARCH BAR ---
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => _applyFilter(), // Filter real-time setiap ngetik
                      decoration: const InputDecoration(
                        hintText: 'Cari produk...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- FILTER CHIPS AKTIF ---
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('Semua Produk', 
                          isSelected: _selectedCategory == 'Semua Produk',
                          onTap: () {
                            setState(() => _selectedCategory = 'Semua Produk');
                            _applyFilter();
                          }
                        ),
                        _buildFilterChip('Anniversary', 
                          icon: Icons.favorite,
                          isSelected: _selectedCategory == 'Anniversary',
                          onTap: () {
                            setState(() => _selectedCategory = 'Anniversary');
                            _applyFilter();
                          }
                        ),
                        _buildFilterChip('Ulang Tahun', 
                          icon: Icons.cake,
                          isSelected: _selectedCategory == 'Ulang Tahun',
                          onTap: () {
                            setState(() => _selectedCategory = 'Ulang Tahun');
                            _applyFilter();
                          }
                        ),
                        _buildFilterChip('Pernikahan', 
                          icon: Icons.wc,
                          isSelected: _selectedCategory == 'Pernikahan',
                          onTap: () {
                            setState(() => _selectedCategory = 'Pernikahan');
                            _applyFilter();
                          }
                        ),
                        _buildFilterChip('Wisuda', 
                          icon: Icons.school,
                          isSelected: _selectedCategory == 'Wisuda',
                          onTap: () {
                            setState(() => _selectedCategory = 'Wisuda');
                            _applyFilter();
                          }
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            // --- PRODUCT GRID AREA ---
            Expanded(
              child: _buildProductContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFBC1A6F)),
        ),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            _errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    if (_filteredProducts.isEmpty) {
      return const Center(
        child: Text('Produk tidak ditemukan.'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: _filteredProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20,
        childAspectRatio: 0.58, 
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(
          context: context,
          item: _filteredProducts[index],
        );
      },
    );
  }

  // Widget filter chip yang sekarang dibungkus GestureDetector agar responsif terhadap klik
  Widget _buildFilterChip(String label, {required bool isSelected, IconData? icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Widget _buildProductCard({required BuildContext context, required Product item}) {
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
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      'assets/images/${item.gambar}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
                          ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                          isFavorited ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: isFavorited ? const Color(0xFFBC1A6F) : Colors.black45,
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
                  item.kategori.isNotEmpty && item.kategori != 'Best Seller'
                      ? item.kategori.toUpperCase()
                      : 'UMUM',
                  style: const TextStyle(
                    color: Color(0xFFBC1A6F), 
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 4), 
                
                Text(
                  item.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                        fontSize: 11,
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