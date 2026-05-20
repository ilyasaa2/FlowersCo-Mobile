import 'package:flutter/material.dart';
import '../auth/login_page.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 15),
          const Text(
            "Ilyasa Abiyyu W.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text("2420506035", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          const Divider(),
          _buildMenuTile(Icons.shopping_bag_outlined, "Riwayat Pesanan"),
          _buildMenuTile(Icons.location_on_outlined, "Alamat Saya"),
          _buildMenuTile(Icons.settings_outlined, "Pengaturan"),
          _buildMenuTile(
            Icons.logout,
            "Keluar",
            color: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Konfirmasi"),
                  content: const Text("Apakah yakin ingin keluar?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Keluar",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(
    IconData icon,
    String title, {
    Color color = Colors.black,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
