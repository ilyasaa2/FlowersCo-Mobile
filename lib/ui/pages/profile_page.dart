import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        250,
        248,
        250,
      ), // Background abu-abu sangat muda
      // --- 1. MENAMBAHKAN SIDEBAR (DRAWER) ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFD63384)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xFFD63384),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Menu Flowers.co",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Color(0xFFD63384),
              ),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.pushNamed(context, '/'); // Arahkan ke Beranda/Home
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.admin_panel_settings_outlined,
                color: Color(0xFFD63384),
              ),
              title: const Text('Mode Admin'),
              onTap: () {
                Navigator.pop(context);
                // Tambahkan navigasi ke halaman admin jika diperlukan
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings_outlined, color: Colors.grey),
              title: const Text('Pengaturan Aplikasi'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER PROFIL ---
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFE9ECEF),
                    child: Icon(Icons.person, size: 60, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Tamu",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD63384),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/lengkapi-profil');
                    },
                    icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                    label: const Text(
                      "Lengkapi Profil",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD63384),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 2),

            // --- STATS CARDS (Poin, Voucher, Status) ---
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatCard(
                    Icons.monetization_on_outlined,
                    "Poin Saya",
                    "0",
                  ),
                  _buildStatCard(
                    Icons.confirmation_number_outlined,
                    "Voucher",
                    "0",
                  ),
                  _buildStatCard(
                    Icons.local_shipping_outlined,
                    "Status Pesanan",
                    "-",
                  ),
                ],
              ),
            ),

            // --- MENU SECTIONS ---
            _buildSectionTitle("AKTIVITAS SAYA"),
            _buildMenuItem(
              context,
              Icons.assignment_outlined,
              "Riwayat Pesanan",
              () {
                Navigator.pushNamed(context, '/riwayat-pesanan');
              },
            ),
            _buildMenuItem(
              context,
              Icons.local_florist_outlined,
              "Buket Saya",
              () {
                Navigator.pushNamed(context, '/buket-saya');
              },
            ),
            _buildMenuItem(
              context,
              Icons.location_searching_rounded,
              "Lacak Pesanan",
              () {
                Navigator.pushNamed(context, '/lacak-pesanan');
              },
            ),

            _buildSectionTitle("PENGATURAN AKUN"),
            _buildMenuItem(context, Icons.security_outlined, "Keamanan", () {
              Navigator.pushNamed(context, '/keamanan');
            }),
            _buildMenuItem(
              context,
              Icons.location_on_outlined,
              "Alamat Pengiriman",
              () {
                Navigator.pushNamed(context, '/alamat-pengiriman');
              },
            ),
            _buildMenuItem(
              context,
              Icons.notifications_none_outlined,
              "Notifikasi",
              () {
                Navigator.pushNamed(context, '/notifikasi');
              },
            ),

            _buildSectionTitle("BANTUAN & INFORMASI"),
            _buildMenuItem(
              context,
              Icons.help_outline_rounded,
              "Pusat Bantuan",
              () {
                Navigator.pushNamed(context, '/pusat-bantuan');
              },
            ),
            _buildMenuItem(
              context,
              Icons.verified_user_outlined,
              "Kebijakan Privasi",
              () {
                Navigator.pushNamed(context, '/kebijakan-privasi');
              },
            ),
            _buildMenuItem(
              context,
              Icons.info_outline_rounded,
              "Tentang Kami",
              () {
                Navigator.pushNamed(context, '/tentang-kami');
              },
            ),

            // --- TOMBOL KELUAR ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.red.shade100),
                ),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Konfirmasi Keluar"),
                          content: const Text(
                            "Apakah Anda yakin ingin keluar dari akun Flowers.co?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Batal",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(context, '/');
                              },
                              child: const Text(
                                "Keluar",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFD63384), size: 28),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD63384),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback action,
  ) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFD63384), size: 22),
        title: Text(title, style: const TextStyle(fontSize: 15)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: action,
      ),
    );
  }
}
