import 'package:flutter/material.dart';


class AlamatPengirimanPage extends StatefulWidget {
  const AlamatPengirimanPage({super.key});

  @override
  State<AlamatPengirimanPage> createState() => _AlamatPengirimanPageState();
}

class _AlamatPengirimanPageState extends State<AlamatPengirimanPage> {
  // 1. Data Dummy Alamat yang bisa dimanipulasi (ditambah/diubah)
  final List<Map<String, dynamic>> _addresses = [
    {
      "title": "Rumah",
      "address": "Jl. Mawar Merah No. 12, Jakarta Selatan",
      "isUtama": true,
    },
    {
      "title": "Kantor",
      "address": "Gedung Bunga Lantai 5, Jakarta Pusat",
      "isUtama": false,
    },
  ];

  // 2. Fungsi untuk menampilkan Dialog Tambah / Edit Alamat
  void _showAddressDialog({int? index}) {
    final isEdit = index != null;
    final titleController = TextEditingController(
      text: isEdit ? _addresses[index]['title'] : '',
    );
    final addressController = TextEditingController(
      text: isEdit ? _addresses[index]['address'] : '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            isEdit ? "Ubah Alamat" : "Tambah Alamat Baru",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFBC1A6F),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: "Label Alamat (ex: Rumah, Kantor)",
                    hintText: "Masukkan nama tempat",
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: addressController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Alamat Lengkap",
                    hintText: "Masukkan nama jalan, nomor rumah, kota",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal", style: TextStyle(color: Colors.grey)),
            ),
            if (isEdit)
              TextButton(
                onPressed: () {
                  setState(() {
                    // Jika yang dihapus adalah alamat utama, pindahkan status utama ke alamat pertama yang tersisa
                    bool wasUtama = _addresses[index]['isUtama'];
                    _addresses.removeAt(index);
                    if (wasUtama && _addresses.isNotEmpty) {
                      _addresses[0]['isUtama'] = true;
                    }
                  });
                  Navigator.pop(context);
                },
                child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    addressController.text.isEmpty)
                  return;

                setState(() {
                  if (isEdit) {
                    _addresses[index]['title'] = titleController.text;
                    _addresses[index]['address'] = addressController.text;
                  } else {
                    // Tambah baru, otomatis tidak utama jika sudah ada alamat lain
                    _addresses.add({
                      "title": titleController.text,
                      "address": addressController.text,
                      "isUtama": _addresses.isEmpty ? true : false,
                    });
                  }
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBC1A6F),
                foregroundColor: Colors.white,
              ),
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  // 3. Fungsi untuk mengubah alamat utama saat kartu alamat ditap
  void _setUtama(int index) {
    setState(() {
      for (var address in _addresses) {
        address['isUtama'] = false;
      }
      _addresses[index]['isUtama'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFFDF8F9,
      ), // Background pastel khas Flowers.co
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Alamat Pengiriman",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _addresses.isEmpty
          ? const Center(child: Text("Belum ada alamat tersimpan."))
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final item = _addresses[index];
                return _buildAddressCard(
                  index,
                  item["title"],
                  item["address"],
                  item["isUtama"],
                );
              },
            ),
      // Menggunakan bottomNavigationBar untuk tombol aksi agar posisinya statis di bawah layar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () => _showAddressDialog(),
              icon: const Icon(Icons.add),
              label: const Text(
                "Tambah Alamat Baru",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBC1A6F),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressCard(
    int index,
    String title,
    String address,
    bool isUtama,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUtama ? const Color(0xFFBC1A6F) : Colors.transparent,
          width: 1.5, // Highlight border tipis jika menjadi alamat utama
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: () =>
            _setUtama(index), // Tap kartu untuk mengubah jadi alamat Utama
        leading: const Icon(Icons.location_on, color: Color(0xFFBC1A6F)),
        title: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            if (isUtama) ...[
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Utama",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            address,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              height: 1.3,
            ),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, size: 20, color: Colors.black54),
          onPressed: () => _showAddressDialog(index: index), // Buka dialog edit
        ),
      ),
    );
  }
}
