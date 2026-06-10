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

  static String _extractStringValue(
    Map<String, dynamic> json,
    List<String> keys,
    String fallback,
  ) {
    for (final key in keys) {
      if (json.containsKey(key) && json[key] != null) {
        final value = json[key].toString().trim();
        if (value.isNotEmpty) return value;
      }
    }
    return fallback;
  }

  static double _extractDoubleValue(
    Map<String, dynamic> json,
    List<String> keys,
    double fallback,
  ) {
    for (final key in keys) {
      if (json.containsKey(key) && json[key] != null) {
        final raw = json[key].toString();
        final normalized = raw
            .replaceAll(RegExp(r'[^0-9\.,]'), '')
            .replaceAll(',', '.');
        final parsed = double.tryParse(normalized);
        if (parsed != null) return parsed;
      }
    }
    return fallback;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: _extractStringValue(json, ['id', 'product_id', 'id_produk'], ''),
      nama: _extractStringValue(json, [
        'nama_produk',
        'nama',
        'name',
        'product_name',
      ], 'Nama tidak tersedia'),
      harga: _extractDoubleValue(json, ['harga', 'price', 'harga_produk'], 0.0),
      gambar: _extractStringValue(json, ['gambar', 'image', 'img', 'foto'], ''),
      kategori: _extractStringValue(json, [
        'kategori',
        'category',
        'jenis',
      ], 'Umum'),
    );
  }
}
