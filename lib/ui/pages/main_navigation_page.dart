import 'package:flutter/material.dart';
import 'homepage.dart';
import 'katalog_page.dart';
import 'profile_page.dart';
import 'wishlist_page.dart';
import '../components/custom_sidebar.dart';

class MainNavigationPage extends StatefulWidget {
  final int initialIndex;

  const MainNavigationPage({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  // Daftar halaman utama aplikasi
  final List<Widget> _pages = [
    const HomePage(), // Index 0
    const KatalogPage(), // Index 1
    const WishlistPage(), // Index 2
    const ProfilePage(), // Index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Tambahkan AppBar global agar tombol menu tiga garis otomatis muncul di semua sub-halaman
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ), // Mengubah warna ikon menu menjadi hitam/gelap
        title: const Text(
          'Flowers.co',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Color(0xFFBC1A6F), // Warna pink khas FlowersCo kamu
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFFBC1A6F),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/keranjang');
            },
          ),
        ],
      ),

      // 2. Pasang Sidebar Custom kamu di sini
      drawer: const CustomSidebar(),

      body: _pages[_currentIndex], // Menampilkan halaman aktif

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFBC1A6F),
        unselectedItemColor: Colors.black45,
        currentIndex: _currentIndex,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Pindah halaman utama saat ditekan
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist_outlined),
            activeIcon: Icon(Icons.local_florist),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
