# LAPORAN UJIAN AKHIR SEMESTER
## PRAKTIKUM APLIKASI SELULER (MOBILE)
### Aplikasi Mobile Flowers.co

**Universitas Tidar**
**Fakultas Teknik — Jurusan Teknik Elektro, Mekatronika dan Informasi**
**Program Studi S1 Teknologi Informasi**
**Genap TA 2025/2026**

Disusun oleh Kelompok 5:
1. Azzahra Febia Mufida (2420506023)
2. Muhammad Ramdhan (2520506027)
3. Mayza Lutfi Setyaji (2420506033)
4. Ilyasa Abiyyu Wicaksono (2420506035)
5. Erlyn Nur Rizqi Maulidya (2430506067)

Dosen Pengampu: Muhammad Ichwandar Akrianto, S.Kom., M.Eng.

---

## BAB I: PENDAHULUAN & MANAJEMEN PROYEK

### 1.1 Latar Belakang Masalah

Proses transaksi penjualan buket bunga di banyak toko konvensional masih dilakukan secara manual, baik melalui kunjungan langsung maupun komunikasi pemesanan yang tidak terpusat (mis. chat pribadi). Pola ini menimbulkan beberapa kendala operasional: pencatatan pesanan kurang rapi, risiko kesalahan detail pesanan (jenis bunga, ucapan kartu), serta pelanggan kesulitan mengetahui ketersediaan stok secara real-time, terutama saat terjadi lonjakan permintaan pada momen tertentu.

### 1.2 Deskripsi Solusi Aplikasi Mobile

**Flowers.co Mobile** dikembangkan sebagai kanal akses kedua (mendampingi versi web) dari sistem pemesanan buket bunga Flowers.co, dibangun menggunakan **Flutter** agar pelanggan dapat menjelajah katalog, melakukan transaksi, dan memantau status pesanan langsung dari smartphone, dengan pengalaman navigasi satu tangan (*one-handed navigation*) yang lebih ringkas dibanding versi web. Aplikasi mobile berbagi sumber data yang sama dengan versi web melalui backend PHP dan database MySQL/MariaDB, sehingga data produk, stok, dan transaksi tetap sinkron di kedua kanal.

### 1.3 Target Pengguna

| Persona | Kebutuhan Utama |
|---|---|
| **Pelanggan** | Kemudahan, kecepatan, dan visualisasi produk yang jelas sebelum membeli; mengetahui ketersediaan stok dan harga total dengan cepat melalui genggaman ponsel |
| **Admin/Pemilik Toko** | Memantau status pesanan dan performa toko secara mobile kapan saja, tanpa harus berada di lokasi toko |

### 1.4 Ringkasan Timeline & Pembagian Tugas Tim

Proyek dikerjakan selama 13 minggu (26 Februari – 28 Mei 2026) dengan metodologi **Agile/Scrum**, dibagi ke 5 tahapan: Analisis & Perencanaan, Perancangan UI/UX, Pengembangan (Coding), Pengujian & Debugging, serta Finalisasi & Laporan. Progres dipantau menggunakan papan Kanban (To-Do / In Progress / Done) di **Notion**.

Pembagian peran tim:

| No | Nama | Peran | Tanggung Jawab |
|---|---|---|---|
| 1 | Ilyasa Abiyyu Wicaksono | Koordinator Proyek & Backend Developer | Mengoordinasikan proyek, mengembangkan backend & database, membantu integrasi sistem |
| 2 | Mayza Lutfi Setyaji | UI/UX Designer & Frontend Web Developer | Mendesain antarmuka web & mobile, implementasi tampilan, membantu pengujian |
| 3 | Muhammad Ramdhan | Mobile Developer & System Integrator | Mengembangkan aplikasi Flutter, integrasi fitur dengan backend, debugging & pengujian |
| 4 | Erlyn Nur Rizqi Maulidya | Database Engineer & QA | Merancang basis data, pengujian sistem, dokumentasi hasil pengujian |
| 5 | Azzahra Febia Mufida | System Analyst & Documentation Specialist | Analisis kebutuhan, diagram sistem, laporan proyek |

Pengembangan fitur mobile dibagi ke 4 sprint, dengan prioritas fitur inti (autentikasi, katalog, keranjang, checkout) dikerjakan pada Sprint 1–2, dan fitur pendukung (riwayat, wishlist, profil, dashboard admin) pada Sprint 3–4.

---

## BAB II: PERANCANGAN UI/UX KE MOBILE

### 2.1 Kebutuhan Fungsional Aplikasi (Fitur Utama)

| Pengguna | Fitur/Fungsi |
|---|---|
| **Pelanggan** | Registrasi/Login, melihat katalog produk per kategori bunga, detail produk, pencarian produk, wishlist (favorit), tambah ke keranjang, checkout/pemesanan, lacak & lihat riwayat pesanan, kelola profil |
| **Admin** | (dikelola lewat dashboard web) CRUD produk, kelola kategori, konfirmasi status pesanan, laporan penjualan |

Fitur khusus mobile: *side drawer* navigasi cepat (koleksi buket, riwayat pesanan, panduan perawatan), *bottom navigation bar*, dan kolom pencarian cepat di homepage.

### 2.2 High-Fidelity Design (Figma)

*(Sertakan tangkapan layar/embed Figma untuk halaman: Homepage, Katalog, Detail Produk, Keranjang, Wishlist, Profil — silakan tempelkan screenshot Figma kelompok di sini sebelum dikonversi ke PDF.)*

Implementasi antarmuka aktual pada aplikasi (`lib/ui/pages/`) merealisasikan desain tersebut ke dalam halaman: `homepage.dart`, `katalog_page.dart`, `wishlist_page.dart`, `keranjang_page.dart`, `profile_page.dart`, `riwayat_pesanan_page.dart`, `lacak_pesanan_page.dart`, dan halaman pendukung lain (pembayaran, alamat pengiriman, panduan perawatan, dsb).

---

## BAB III: INTEGRASI BACKEND & API

### 3.1 Diagram Arsitektur Sistem

```
 ┌─────────────────┐        HTTP/JSON        ┌──────────────────────┐
 │  Flutter Mobile  │ ───────────────────────▶│   PHP Backend (API)  │
 │  (lib/services)  │ ◀─────────────────────── │  api_flowers/*.php   │
 └─────────────────┘                          └──────────┬───────────┘
                                                           │ mysqli
                                                ┌──────────▼───────────┐
                                                │   MySQL / MariaDB    │
                                                │   (flowers_db)       │
                                                └──────────────────────┘
          ▲
          │ HTTP (session-based)
 ┌─────────────────┐
 │  Web (PHP+Tailwind)│  ── berbagi database & tabel yang sama dengan mobile
 └─────────────────┘
```

Aplikasi mobile berkomunikasi dengan backend PHP melalui HTTP request berformat JSON (menggunakan package `http` di Flutter), terpisah dari jalur sesi (session) yang dipakai versi web. Backend memproses request, mengakses database MySQL melalui `mysqli`, lalu mengembalikan response dalam format JSON yang di-parsing oleh model Dart (`Product.fromJson`).

> **Catatan teknis (kendala nyata yang ditemukan tim):** base URL backend yang dipanggil dari sisi mobile sempat tidak konsisten antar halaman selama pengembangan — `homepage.dart` memanggil `http://localhost/api_flowers`, `katalog_page.dart` memanggil tunnel ngrok (`https://pandemic-turbofan-alone.ngrok-free.dev/api_flowers`), sedangkan `services/api_sevices.dart` dan `services/product_sevices.dart` masing-masing memakai `10.0.2.2` (alamat loopback host dari Android Emulator) dan `127.0.0.1`. Hal ini dibahas lebih lanjut pada BAB VI sebagai kendala teknis.

### 3.2 Dokumentasi Endpoint API

**1. `POST /api_flowers/get_products.php`** — mengambil seluruh data produk

Request: tanpa body (GET sederhana untuk versi `api_get_produk.php` di sisi web; versi mobile memanggilnya sebagai GET ke `get_products.php`)

Response (200 OK):
```json
[
  {
    "id": "1",
    "nama_produk": "Buket Mawar Merah",
    "harga": "150000"
  },
  {
    "id": "2",
    "nama_produk": "Buket Bunga Matahari",
    "harga": "120000"
  }
]
```
Field di atas dipetakan secara fleksibel oleh `Product.fromJson()` di Flutter (mendukung beberapa alias key seperti `nama_produk`/`nama`/`name`, dan `harga`/`price`) agar tahan terhadap variasi penamaan kolom backend.

**2. `POST /api_flowers/login.php`** — autentikasi pengguna

Request (form-urlencoded):
```json
{
  "email": "user@gmail.com",
  "password": "********"
}
```
Response (sukses):
```json
{
  "status": "success",
  "message": "Login berhasil",
  "user": {
    "id": 1,
    "fullname": "Nama Pengguna",
    "email": "user@gmail.com"
  }
}
```
Response (gagal):
```json
{
  "status": "error",
  "message": "Email atau password salah"
}
```

**3. `POST /api_flowers/register.php`** — registrasi akun baru *(mengikuti pola endpoint pada `Register.php`/`register_process.php` versi web, diadaptasi sebagai endpoint JSON untuk mobile)*

Request:
```json
{
  "fullname": "Nama Pengguna",
  "email": "user@gmail.com",
  "password": "********"
}
```
Response:
```json
{
  "status": "success",
  "message": "Akun berhasil dibuat"
}
```

---

## BAB IV: IMPLEMENTASI KODE APLIKASI MOBILE

### 4.1 Library yang Digunakan

| Library | Fungsi |
|---|---|
| `flutter` (SDK) | Framework inti UI berbasis widget |
| `http: ^1.2.0` | Melakukan HTTP request (GET/POST) ke backend PHP, parsing response JSON |
| `cupertino_icons: ^1.0.8` | Ikon bergaya iOS untuk konsistensi tampilan |
| `flutter_lints: ^6.0.0` (dev) | Aturan linting untuk menjaga kualitas kode |

Versi environment: Flutter 3.41.0 (Channel Stable), Dart 3.11.0, dikembangkan di Visual Studio Code dengan ekstensi Flutter & Dart, diuji pada Android Emulator dan perangkat fisik.

### 4.2 Struktur Direktori Kode

```
lib/
├── core/
│   └── constants.dart          # Palet warna & style teks global (AppColors, AppTheme)
├── data/
│   └── models/
│       ├── app_state.dart      # State management sederhana (ValueNotifier)
│       └── product_model.dart  # Model data produk + parsing JSON fleksibel
├── services/
│   ├── api_sevices.dart        # Service autentikasi (login)
│   └── product_sevices.dart    # Service pengambilan data produk
├── ui/
│   ├── auth/
│   │   ├── login_page.dart
│   │   ├── register_page.dart
│   │   └── forgot_password_page.dart
│   ├── components/
│   │   └── custom_sidebar.dart
│   └── pages/
│       ├── homepage.dart
│       ├── katalog_page.dart
│       ├── keranjang_page.dart
│       ├── wishlist_page.dart
│       ├── profile_page.dart
│       ├── riwayat_pesanan_page.dart
│       ├── lacak_pesanan_page.dart
│       ├── pembayaran_page.dart
│       ├── pembayaran_berhasil_page.dart
│       ├── selesai_pembayaran_page.dart
│       ├── alamat_pengiriman_page.dart
│       ├── lengkapi_profil_page.dart
│       ├── main_navigation_page.dart   # Bottom navigation + routing antar tab
│       └── ... (notifikasi, panduan perawatan, kebijakan privasi, dll.)
└── main.dart
```

Struktur ini memisahkan tanggung jawab kode menjadi empat lapisan: `core` (konstanta tampilan), `data` (model & state), `services` (komunikasi API), dan `ui` (tampilan & halaman), sehingga memudahkan kolaborasi tim — anggota dapat mengerjakan halaman (`ui/pages`) secara paralel tanpa banyak bentrok kode pada lapisan `services`/`data`.

### 4.3 Menerjemahkan Desain Figma ke Komponen Layout Mobile

Contoh penerapan tema visual (warna brand pink Flowers.co) yang konsisten dengan palet di desain Figma, didefinisikan terpusat di `core/constants.dart`:

```dart
class AppColors {
  static const Color primaryPink = Color(0xFFD63384);
  static const Color lightPink = Color(0xFFFFF5F7);
}

class AppTheme {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF2D3436),
  );
}
```

Halaman Login (`login_page.dart`) menerjemahkan desain kartu login pada Figma menjadi `Container` dengan `BoxDecoration` (sudut membulat, bayangan halus, gambar latar bunga) yang menjaga identitas visual brand di layar sekecil ponsel:

```dart
Container(
  width: 340,
  margin: const EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
    ],
  ),
  child: /* ...form login... */,
)
```

### 4.4 State Management

Aplikasi mobile menggunakan pendekatan **`ValueNotifier`** (state management ringan bawaan Flutter) untuk data lintas-halaman seperti keranjang belanja dan wishlist, dikelola terpusat pada `AppState`:

```dart
class AppState {
  static final ValueNotifier<List<Product>> cartNotifier =
      ValueNotifier<List<Product>>([]);
  static final ValueNotifier<List<Product>> wishlistNotifier =
      ValueNotifier<List<Product>>([]);

  static void addToCart(Product item, BuildContext context) {
    cartNotifier.value = List.from(cartNotifier.value)..add(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item.nama} berhasil ditambahkan ke keranjang!')),
    );
  }

  static void toggleWishlist(Product item, BuildContext context) {
    List<Product> currentWishlist = List.from(wishlistNotifier.value);
    bool isExist = currentWishlist.any((e) => e.id == item.id);
    if (isExist) {
      currentWishlist.removeWhere((e) => e.id == item.id);
    } else {
      currentWishlist.add(item);
    }
    wishlistNotifier.value = currentWishlist;
  }
}
```

Untuk perubahan state lokal per-halaman (mis. status *loading* saat mengambil data produk), tim menggunakan `StatefulWidget` + `setState()`, contohnya pada `katalog_page.dart`:

```dart
bool _isLoading = true;
String _errorMessage = '';

@override
void initState() {
  super.initState();
  _loadProducts();
}
```

`_isLoading` dipakai untuk menampilkan indikator pemuatan (*loading spinner*) selama data belum diterima, lalu di-*set* `false` begitu request API selesai (baik sukses maupun gagal).

### 4.5 Fungsi Asynchronous (HTTP Request)

Pengambilan data produk dari backend dilakukan secara asynchronous menggunakan `async`/`await`, kemudian hasilnya diparsing ke model `Product` dan ditampilkan di UI melalui `setState()`:

```dart
Future<void> _loadProducts() async {
  final url = Uri.parse('$baseUrl/get_products.php');
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products = body
          .map((dynamic item) => Product.fromJson(item))
          .toList();

      setState(() {
        _allProducts = products;
        _isLoading = false;
      });
      _applyFilter();
    } else {
      setState(() {
        _errorMessage = 'Gagal memuat produk dari server';
        _isLoading = false;
      });
    }
  } catch (e) {
    setState(() {
      _errorMessage = 'Gagal terhubung ke server: $e';
      _isLoading = false;
    });
  }
}
```

---

## BAB V: PENGUJIAN DAN BUILD (TESTING & DEPLOYMENT)

### 5.1 Tabel Pengujian Fungsionalitas (Black-box Testing)

Diuji pada Android Emulator dan perangkat fisik:

| No | Fitur | Skenario Uji | Hasil yang Diharapkan | Status |
|---|---|---|---|---|
| 1 | Register Akun | Isi form dengan data valid, klik daftar | Akun berhasil dibuat, redirect ke login | Berhasil |
| 2 | Login Pelanggan | Input email & password yang benar | Masuk ke homepage, sesi aktif | Berhasil |
| 3 | Login Gagal | Input password yang salah | Muncul pesan kesalahan "Email atau password salah" | Berhasil |
| 4 | Lihat Katalog | Buka halaman katalog produk | Semua produk tampil dalam grid 2 kolom | Berhasil |
| 5 | Cari Produk | Ketik nama produk di search bar | Produk relevan muncul, lainnya tersaring | Berhasil |
| 6 | Tambah Keranjang | Tekan tombol tambah pada produk | Produk masuk keranjang, `cartNotifier` ter-update | Berhasil |
| 7 | Tambah/Hapus Wishlist | Tekan ikon hati pada produk | Produk masuk/keluar wishlist secara instan | Berhasil |
| 8 | Checkout | Lengkapi alamat & metode bayar, konfirmasi | Pesanan tersimpan, muncul halaman konfirmasi | Berhasil |
| 9 | Lacak Pesanan | Buka halaman lacak pesanan | Status pesanan terbaru ditampilkan | Berhasil |
| 10 | Gagal Memuat Data (Offline) | Matikan koneksi/server saat membuka katalog | Muncul pesan "Gagal terhubung ke server", tanpa crash | Berhasil |

### 5.2 Penanganan Error / Offline Mode

Setiap pemanggilan API dibungkus dalam blok `try-catch`. Jika terjadi kegagalan jaringan (server tidak terjangkau, timeout, atau respons bukan 200), aplikasi tidak crash — melainkan menampilkan `_errorMessage` yang informatif ke pengguna, sembari menghentikan status *loading*:

```dart
catch (e) {
  setState(() {
    _errorMessage = 'Gagal terhubung ke server: $e';
    _isLoading = false;
  });
}
```

Pesan ini kemudian ditampilkan di UI (mis. ikon ilustrasi + teks error beserta tombol "Coba Lagi") sehingga pengguna memahami penyebab kegagalan tanpa aplikasi berhenti merespons (*not responding*).

### 5.3 Langkah Build Aplikasi (APK)

1. Pastikan environment Flutter sudah terkonfigurasi (`flutter doctor` tanpa error blocking).
2. Jalankan `flutter pub get` untuk mengunduh seluruh dependency di `pubspec.yaml`.
3. Pastikan base URL API di `services/` dan setiap halaman mengarah ke endpoint backend yang aktif/dapat diakses publik (bukan `localhost`/`127.0.0.1`, karena tidak terjangkau dari perangkat fisik) — gunakan IP jaringan lokal atau tunnel (mis. ngrok) untuk pengujian, dan domain server produksi untuk build rilis.
4. Jalankan `flutter build apk --release` untuk menghasilkan APK release teroptimasi, atau `flutter build apk --debug` untuk keperluan debugging cepat.
5. File hasil build tersedia di `build/app/outputs/flutter-apk/app-release.apk`.
6. Instal APK ke perangkat fisik melalui `flutter install`, transfer manual, atau `adb install app-release.apk` untuk pengujian akhir di luar emulator.

---

## BAB VI: KESIMPULAN & KENDALA

### 6.1 Kesimpulan

Aplikasi mobile Flowers.co berhasil dibangun sebagai kanal akses kedua dari sistem Flowers.co, mendampingi versi web yang sudah ada, dengan memanfaatkan backend PHP dan database MySQL yang sama. Fitur inti — autentikasi, katalog produk, pencarian, wishlist, keranjang, checkout, hingga pelacakan pesanan — berhasil diimplementasikan menggunakan Flutter dengan pendekatan state management ringan (`ValueNotifier` + `setState`) dan komunikasi data asynchronous melalui HTTP/JSON. Hasil pengujian black-box pada emulator maupun perangkat fisik menunjukkan seluruh skenario utama berjalan sesuai harapan, termasuk penanganan kondisi gagal koneksi.

### 6.2 Kendala Teknis Terbesar

1. **Inkonsistensi base URL backend antar halaman.** Karena pengembangan API dan UI mobile berjalan paralel oleh anggota berbeda, beberapa file (`api_sevices.dart`, `product_sevices.dart`, `homepage.dart`, `katalog_page.dart`) sempat memakai alamat backend yang berbeda-beda (`localhost`, `127.0.0.1`, `10.0.2.2`, hingga tunnel ngrok) sehingga aplikasi tidak selalu bisa terhubung ke server saat diuji di perangkat yang berbeda. Solusi jangka panjang yang direkomendasikan tim adalah memusatkan base URL dalam satu file konfigurasi (`core/constants.dart` atau `.env`) agar mudah diubah tanpa menyentuh banyak file.
2. **Variasi nama kolom JSON dari backend PHP.** Karena backend web dan mobile awalnya dikembangkan terpisah, nama field pada response JSON tidak selalu konsisten (mis. `nama_produk` vs `nama` vs `name`). Tim mengatasinya dengan membangun parser fleksibel pada `Product.fromJson()` yang mencoba beberapa kemungkinan key sebelum jatuh ke nilai fallback.
3. **Akses backend lokal dari perangkat fisik.** Backend yang dijalankan di XAMPP lokal (`localhost`) tidak dapat diakses langsung dari smartphone fisik tanpa berada di jaringan yang sama atau menggunakan tunnel (ngrok), sehingga tim perlu menyesuaikan workflow pengujian saat berpindah dari emulator ke perangkat fisik.
4. **Pembagian fokus tim** antara pengembangan web (PHP/Tailwind) dan mobile (Flutter) yang berjalan bersamaan, sehingga sinkronisasi struktur data antar kedua platform memerlukan komunikasi dan koordinasi ekstra, khususnya antara peran *Backend Developer* dan *Mobile Developer*.

