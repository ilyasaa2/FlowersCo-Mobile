class Product {
  final String id;
  final String nama;
  final double harga;
  final String gambar;
  final String kategori;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.kategori,
  });

  // Pastikan factory ini ada untuk mapping dari database/web
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      nama: json['nama_produk'] ?? 'Nama tidak tersedia',
      harga: double.tryParse(json['harga'].toString()) ?? 0.0,
      gambar: json['gambar'] ?? '',
      kategori: json['kategori'] ?? 'Umum',
    );
  }
}
