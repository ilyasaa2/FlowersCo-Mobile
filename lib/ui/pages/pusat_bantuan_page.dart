import 'package:flutter/material.dart';

class PusatBantuanPage extends StatelessWidget {
  const PusatBantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pusat Bantuan")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ExpansionTile(
            title: Text("Bagaimana cara melacak pesanan?"),
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Anda dapat melacak pesanan melalui menu 'Aktivitas Saya' lalu pilih 'Lacak Pesanan'.",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Apakah bisa retur bunga yang layu?"),
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Kami memberikan garansi kesegaran 100%. Hubungi tim support kami dalam waktu 2 jam setelah bunga diterima.",
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ListTile(
            tileColor: Color(0xFFF8F9FA),
            leading: Icon(Icons.support_agent, color: Color(0xFFD63384)),
            title: Text("Hubungi Customer Service"),
            subtitle: Text("WhatsApp: 0812-XXXX-XXXX"),
          ),
        ],
      ),
    );
  }
}
