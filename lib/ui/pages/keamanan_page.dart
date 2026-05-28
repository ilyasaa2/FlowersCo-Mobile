import 'package:flutter/material.dart';

class KeamananPage extends StatelessWidget {
  const KeamananPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keamanan Akun")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text("Ubah Password"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.fingerprint),
            title: Text("Autentikasi Biometrik"),
            trailing: Switch(value: true, onChanged: null),
          ),
        ],
      ),
    );
  }
}
