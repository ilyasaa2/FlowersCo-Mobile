import 'package:flutter/material.dart';

class LacakPesananPage extends StatelessWidget {
  const LacakPesananPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lacak Pesanan")),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.grey.shade200,
            child: const Center(
              child: Icon(Icons.map, size: 100, color: Colors.grey),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text("Pesanan Diproses"),
                    subtitle: Text("10:00 AM"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.radio_button_checked,
                      color: Color(0xFFD63384),
                    ),
                    title: Text("Kurir Sedang Menuju Lokasi"),
                    subtitle: Text("10:45 AM"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
