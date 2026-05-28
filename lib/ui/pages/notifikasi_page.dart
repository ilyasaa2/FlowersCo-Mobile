import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifikasi")),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFFCE4EC),
              child: Icon(Icons.local_offer, color: Color(0xFFD63384)),
            ),
            title: Text("Promo Spesial Hari Ibu!"),
            subtitle: Text("Dapatkan diskon 30% untuk semua buket mawar."),
            trailing: Text(
              "2j",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFE8F5E9),
              child: Icon(Icons.local_shipping, color: Colors.green),
            ),
            title: Text("Pesanan #FLW120 sedang dikirim"),
            subtitle: Text("Kurir kami sedang menuju alamat Anda."),
            trailing: Text(
              "1h",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
