import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'ui/auth/login_page.dart';
import 'ui/auth/register_page.dart';
import 'ui/auth/forgot_password_page.dart';
import 'ui/pages/homepage.dart';
import 'ui/pages/katalog_page.dart';
import 'ui/pages/keranjang_page.dart';
import 'ui/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flowers.co',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.pink),

      initialRoute: '/',

      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/home': (context) => const HomePage(),
        '/katalog': (context) =>
            const KatalogPage(), // Buat file katalog_page.dart jika belum ada
        '/keranjang': (context) =>
            const KeranjangPage(), // Buat file keranjang_page.dart jika belum ada
        '/profil': (context) => const ProfilPage(),
      },
    );
  }
}
