import 'package:flutter/material.dart';
import 'homepage.dart';
import 'katalog_page.dart';
import 'wishlist_page.dart';
import 'profile_page.dart';

// Silahkan sesuaikan import Wishlist dan Profile di bawah ini dengan project Anda
// import 'wishlist/wishlist_page.dart'; 
// import 'profile/profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  final int initialIndex;
  const MainNavigationPage({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  String _selectedCategory = 'Semua Produk'; // State untuk menampung kategori aktif

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    // List halaman ditaruh di dalam build agar selalu mendapat pembaruan variabel _selectedCategory
    final List<Widget> _pages = [
      HomePage(
        onNavigateToKatalog: (category) {
          setState(() {
            _selectedCategory = category;
            _selectedIndex = 1; // Pindah otomatis ke tab Katalog
          });
        },
      ),
      KatalogPage(initialCategory: _selectedCategory), 
      const WishlistPage(), 
      const ProfilePage(),  
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Menggunakan IndexedStack membuat data katalog tidak ter-reset saat pindah tab
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFBC1A6F),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // Jika user menekan tombol Katalog langsung dari nav bar bawah, tampilkan semua produk
            if (index == 1) {
              _selectedCategory = 'Semua Produk';
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Katalog'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}