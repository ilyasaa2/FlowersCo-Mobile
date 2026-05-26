import 'package:flutter/material.dart';

class AlamatPengirimanPage extends StatelessWidget {
  const AlamatPengirimanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alamat Pengiriman")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildAddressCard(
            "Rumah",
            "Jl. Mawar Merah No. 12, Jakarta Selatan",
            true,
          ),
          _buildAddressCard(
            "Kantor",
            "Gedung Bunga Lantai 5, Jakarta Pusat",
            false,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text("Tambah Alamat Baru"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: const Color(0xFFD63384),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(String title, String address, bool isUtama) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Color(0xFFD63384)),
        title: Row(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (isUtama) ...[
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Utama",
                  style: TextStyle(fontSize: 10, color: Colors.green),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(address),
        trailing: IconButton(
          icon: const Icon(Icons.edit, size: 20),
          onPressed: () {},
        ),
      ),
    );
  }
}
