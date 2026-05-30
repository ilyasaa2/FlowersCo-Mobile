import 'package:flutter/material.dart';
import 'main_navigation_page.dart';

class DetailTanamanPage extends StatefulWidget {
  final Map<String, dynamic> plant;
  const DetailTanamanPage({super.key, required this.plant});

  @override
  State<DetailTanamanPage> createState() => _DetailTanamanPageState();
}

class _DetailTanamanPageState extends State<DetailTanamanPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final plant = widget.plant;
    final List<String> benefits = List<String>.from(plant["benefits"] ?? []);
    final List<String> careSteps = List<String>.from(plant["careSteps"] ?? []);
    final String funFact = plant["funFact"] ?? "";

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFBC1A6F),
        unselectedItemColor: Colors.black45,
        currentIndex: 1,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        onTap: (index) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => MainNavigationPage(initialIndex: index),
            ),
            (route) => false,
          );
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
      body: CustomScrollView(
        slivers: [
          // --- HERO IMAGE APP BAR ---
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFFBC1A6F),
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFFBC1A6F),
                  size: 18,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: const Color(0xFFBC1A6F),
                    size: 18,
                  ),
                ),
                onPressed: () {
                  setState(() => _isFavorite = !_isFavorite);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _isFavorite
                            ? '${plant["name"]} ditambahkan ke Favorit!'
                            : '${plant["name"]} dihapus dari Favorit',
                      ),
                      backgroundColor: const Color(0xFFBC1A6F),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    plant["imageUrl"] ?? "assets/images/Bunga mawar.jpg",
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      color: const Color(0xFFFCE4EC),
                      child: const Icon(
                        Icons.local_florist,
                        size: 80,
                        color: Color(0xFFBC1A6F),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama & Latin
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plant["name"] ?? "",
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              plant["latinName"] ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCE4EC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _getCategoryLabel(plant["category"] ?? ""),
                          style: const TextStyle(
                            color: Color(0xFFBC1A6F),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Stats Row
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF5F8),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          Icons.star_outline,
                          "Kesulitan",
                          plant["difficulty"] ?? "-",
                          Colors.orange,
                        ),
                        _buildDivider(),
                        _buildStatItem(
                          Icons.wb_sunny_outlined,
                          "Cahaya",
                          plant["light"] ?? "-",
                          Colors.amber,
                        ),
                        _buildDivider(),
                        _buildStatItem(
                          Icons.water_drop_outlined,
                          "Siram",
                          plant["water"] ?? "-",
                          Colors.blue,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Deskripsi
                  const Text(
                    "Tentang Tanaman Ini",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    plant["description"] ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Manfaat
                  if (benefits.isNotEmpty) ...[
                    const Text(
                      "Manfaat",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...benefits.map(
                      (b) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFFBC1A6F),
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                b,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Tips Perawatan
                  if (careSteps.isNotEmpty) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFEEEEEE)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.tips_and_updates_outlined,
                                color: Color(0xFFBC1A6F),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Tips Perawatan",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          ...careSteps.asMap().entries.map(
                            (entry) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFBC1A6F),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${entry.key + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      entry.value,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Fun Fact
                  if (funFact.isNotEmpty) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCE4EC),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("💡", style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Fakta Menarik",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Color(0xFFBC1A6F),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  funFact,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Tombol Favorit
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() => _isFavorite = !_isFavorite);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              _isFavorite
                                  ? '${plant["name"]} ditambahkan ke Favorit!'
                                  : '${plant["name"]} dihapus dari Favorit',
                            ),
                            backgroundColor: const Color(0xFFBC1A6F),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      label: Text(
                        _isFavorite
                            ? "Tersimpan di Favorit"
                            : "Simpan ke Favorit",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isFavorite
                            ? Colors.grey.shade200
                            : const Color(0xFFBC1A6F),
                        foregroundColor: _isFavorite
                            ? Colors.black54
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.black45),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() =>
      Container(width: 1, height: 40, color: Colors.black12);

  String _getCategoryLabel(String cat) {
    switch (cat) {
      case 'bunga_potong':
        return 'Bunga Potong';
      case 'tanaman_indoor':
        return 'Tanaman Indoor';
      case 'tanaman_bermanfaat':
        return 'Tanaman Bermanfaat';
      default:
        return 'Tanaman';
    }
  }
}
