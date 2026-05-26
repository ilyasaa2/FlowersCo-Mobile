import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'ui/auth/login_page.dart';
import 'ui/auth/register_page.dart';
import 'ui/auth/forgot_password_page.dart';
import 'ui/pages/homepage.dart';
import 'ui/pages/katalog_page.dart';
import 'ui/pages/keranjang_page.dart';
import 'ui/pages/profile_page.dart';
import 'ui/pages/lengkapi_profil_page.dart';
import 'ui/pages/riwayat_pesanan_page.dart';
import 'ui/pages/buket_saya_page.dart';
import 'ui/pages/lacak_pesanan_page.dart';
import 'ui/pages/keamanan_page.dart';
import 'ui/pages/alamat_pengiriman_page.dart';
import 'ui/pages/notifikasi_page.dart';
import 'ui/pages/pusat_bantuan_page.dart';
import 'ui/pages/kebijakan_privasi_page.dart';
import 'ui/pages/tentang_kami_page.dart';

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
        '/profil': (context) => const ProfilePage(),
        '/lengkapi-profil': (context) => const LengkapiProfilPage(),
        '/riwayat-pesanan': (context) => const RiwayatPesananPage(),
        '/buket-saya': (context) => const BuketSayaPage(),
        '/lacak-pesanan': (context) => const LacakPesananPage(),
        '/keamanan': (context) => const KeamananPage(),
        '/alamat-pengiriman': (context) => const AlamatPengirimanPage(),
        '/notifikasi': (context) => const NotifikasiPage(),
        '/pusat-bantuan': (context) => const PusatBantuanPage(),
        '/kebijakan-privasi': (context) => const KebijakanPrivasiPage(),
        '/tentang-kami': (context) => const TentangKamiPage(),
      },
    );
  }
}
