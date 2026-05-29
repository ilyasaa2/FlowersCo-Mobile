import 'package:flutter/material.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil nama rute halaman yang sedang aktif saat ini
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // --- HEADER SIDEBAR ---
            DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 1),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[100],
                    child: const Icon(
                      Icons.person_outline,
                      size: 35,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tamu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Masuk ke akun Anda',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(
                            0xFFBC1A6F,
                          ), // Warna pink pekat keranjang
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // --- MENU ITEMS (Direct sesuai routes main.dart) ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                children: [
                  _buildMenuItem(
                    context: context,
                    icon: Icons.shopping_bag_rounded,
                    title: 'Buket Saya',
                    targetRoute:
                        '/buket-saya', // 👈 Sesuai nama di main.dart kamu
                    currentRoute: currentRoute,
                  ),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.assignment_rounded,
                    title: 'Riwayat Pesanan',
                    targetRoute:
                        '/riwayat-pesanan', // 👈 Sesuai nama di main.dart kamu
                    currentRoute: currentRoute,
                  ),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.local_florist_rounded,
                    title: 'Panduan Perawatan',
                    targetRoute:
                        '/panduan-perawatan', // 👈 Sesuai nama di main.dart kamu
                    currentRoute: currentRoute,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Divider(color: Colors.black12),
                  ),
                  _buildMenuItem(
                    context: context,
                    icon: Icons.settings_rounded,
                    title: 'Pengaturan Akun',
                    targetRoute: '/profil', // 👈 Sesuai nama di main.dart kamu
                    currentRoute: currentRoute,
                  ),
                ],
              ),
            ),

            // --- FOOTER (TOMBOL KELUAR) ---
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black12, width: 1),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context); // Tutup sidebar
                  // Redirect ke halaman login awal dan hapus riwayat tumpukan halaman
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                child: const Row(
                  children: [
                    Icon(Icons.logout_rounded, color: Colors.black54),
                    SizedBox(width: 16),
                    Text(
                      'Keluar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget Item Menu dengan Efek Background Highlight Pink Melengkung
  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String targetRoute,
    required String? currentRoute,
  }) {
    bool isSelected = currentRoute == targetRoute;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        // Efek background berwarna pink muda halus saat menu dipilih atau aktif
        color: isSelected ? const Color(0xFFFCE4EC) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
              ? const Color(0xFFBC1A6F)
              : Colors.black54, // Ikon ganti warna pink jika terpilih
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? const Color(0xFFBC1A6F)
                : Colors.black87, // Teks ganti warna pink jika terpilih
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          Navigator.pop(context); // Otomatis tutup sidebar dahulu saat ditekan

          // Pindah ke halaman tujuan jika user tidak sedang berada di halaman tersebut
          if (currentRoute != targetRoute) {
            Navigator.pushNamed(context, targetRoute);
          }
        },
      ),
    );
  }
}
