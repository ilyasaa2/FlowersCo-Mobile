import 'package:flutter/material.dart';
import 'main_navigation_page.dart';

enum _SectionType { heading, paragraph }

class _TipSection {
  final _SectionType type;
  final String text;
  _TipSection({required this.type, required this.text});
}

class DetailTipPage extends StatelessWidget {
  final Map<String, dynamic> tip;
  const DetailTipPage({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    final String title = (tip["title"] ?? "Tips").toString().replaceAll(
      "\n",
      " ",
    );
    final String content = tip["fullContent"] ?? "";
    final List<_TipSection> sections = _parseContent(content);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFBC1A6F)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Flowers.co",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFFBC1A6F),
            ),
            onPressed: () => Navigator.pushNamed(context, '/keranjang'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFBC1A6F)),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "✨ Tips Hari Ini • ${tip['category'] ?? 'Umum'}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "⏱ ${tip['readTime'] ?? '3 mnt'}",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    tip["shortDesc"] ?? "",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sections.map((s) => _buildSection(s)).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 16,
                    color: Color(0xFFBC1A6F),
                  ),
                  label: const Text(
                    "Kembali ke Perpustakaan",
                    style: TextStyle(
                      color: Color(0xFFBC1A6F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFBC1A6F)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<_TipSection> _parseContent(String raw) {
    final lines = raw.trim().split("\n");
    final sections = <_TipSection>[];
    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) continue;
      if (trimmed.startsWith("**") && trimmed.endsWith("**")) {
        sections.add(
          _TipSection(
            type: _SectionType.heading,
            text: trimmed.replaceAll("**", ""),
          ),
        );
      } else {
        sections.add(_TipSection(type: _SectionType.paragraph, text: trimmed));
      }
    }
    return sections;
  }

  Widget _buildSection(_TipSection section) {
    if (section.type == _SectionType.heading) {
      return Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 8),
        child: Text(
          section.text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFBC1A6F),
            height: 1.3,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          section.text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.7,
          ),
        ),
      );
    }
  }
}
