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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      nama: json['nama'],
      harga: double.parse(json['harga'].toString()),
      gambar: json['gambar'],
      kategori: json['kategori'] ?? 'General',
    );
  }
}
