import 'package:flutter/material.dart';

class LengkapiProfilPage extends StatelessWidget {
  const LengkapiProfilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lengkapi Profil"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.camera_alt, size: 40),
            ),
            const SizedBox(height: 20),
            _buildField("Nama Lengkap", "Tamu"),
            _buildField("Nomor Telepon", "0812xxxx"),
            _buildField("Email", "tamu@flowers.co"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: value,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}
