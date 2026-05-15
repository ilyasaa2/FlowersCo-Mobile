import 'package:flutter/material.dart';

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
          _buildMenuTile(Icons.logout, "Keluar", color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildMenuTile(
    IconData icon,
    String title, {
    Color color = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
