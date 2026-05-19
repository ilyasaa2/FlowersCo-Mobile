import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'homepage.dart';
import 'katalog_page.dart';
import 'keranjang_page.dart';
import 'profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    KatalogPage(),
    KeranjangPage(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryPink,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 0,

          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

          onTap: _onItemTapped,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: "Katalog",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Keranjang",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }
}
