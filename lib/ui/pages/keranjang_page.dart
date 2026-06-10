import 'package:flutter/material.dart';
import 'pembayaran_page.dart';
import '../../data/models/product_model.dart';
import '../../data/models/app_state.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  // Fungsi memformat angka menjadi format Rupiah
  String _formatRupiah(int number) {
    String str = number.toString();
    String result = "";
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      result = str[i] + result;
      count++;
      if (count == 3 && i != 0) {
        result = ".$result";
        count = 0;
      }
    }
    return "Rp $result";
  }

  // Fungsi mengurangi 1 item dari state keranjang
  void _kurangiItem(Product item) {
    List<Product> currentCart = List.from(AppState.cartNotifier.value);
    // Cari index pertama dari produk ini dan hapus
    int index = currentCart.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      currentCart.removeAt(index);
      AppState.cartNotifier.value = currentCart;
    }
  }

  // Fungsi menambah 1 item senyap (tanpa memunculkan snackbar lagi)
  void _tambahItem(Product item) {
    List<Product> currentCart = List.from(AppState.cartNotifier.value);
    currentCart.add(item);
    AppState.cartNotifier.value = currentCart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Keranjang",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder<List<Product>>(
        valueListenable: AppState.cartNotifier,
        builder: (context, cartList, child) {
          if (cartList.isEmpty) {
            return const Center(child: Text("Keranjang Anda Kosong"));
          }

          // 1. Mengelompokkan produk yang sama agar menjadi Quantity (qty)
          Map<String, int> qtyMap = {};
          Map<String, Product> productMap = {};

          for (var item in cartList) {
            qtyMap[item.id] = (qtyMap[item.id] ?? 0) + 1;
            productMap[item.id] = item;
          }

          // Mendapatkan daftar produk unik
          List<Product> uniqueItems = productMap.values.toList();

          // 2. Menghitung subtotal semua barang di keranjang
          int subtotal = 0;
          for (var item in cartList) {
            subtotal += item.harga.toInt();
          }

          return Column(
            children: [
              // --- TAMBAHAN: HEADER INFORMASI PERSIS DESAIN ---
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                alignment: Alignment.centerLeft,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Keranjang Belanja",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Tinjau rangkaian bunga pilihan Anda sebelum check-out.",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: uniqueItems.length,
                  itemBuilder: (context, index) {
                    final item = uniqueItems[index];
                    final qty = qtyMap[item.id]!;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://pandemic-turbofan-alone.ngrok-free.dev/Flowersco/img/${item.gambar}', // Pastikan URL lengkap
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (c, e, s) => Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey[200],
                                child: const Icon(Icons.image_not_supported),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _formatRupiah(item.harga.toInt()),
                                  style: const TextStyle(
                                    color: Color(0xFFBC1A6F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Kontrol Quantity
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => _kurangiItem(item),
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Text(
                                  "$qty",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _tambahItem(item),
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  color: Color(0xFFBC1A6F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Bagian Bawah: Total & Tombol Lanjut ke Pembayaran
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Estimasi:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _formatRupiah(subtotal),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFBC1A6F),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // 1. Ubah data Product menjadi List<Map<String, dynamic>> agar sesuai dengan PembayaranPage
                            List<Map<String, dynamic>>
                            dataUntukPembayaran = uniqueItems.map((item) {
                              return {
                                "id": item.id,
                                "name": item
                                    .nama, // Sesuaikan dengan properti di model Product Anda
                                "subtitle": "Kategori: ${item.kategori}",
                                "price": item.harga.toInt(),
                                "imageUrl":
                                    'https://pandemic-turbofan-alone.ngrok-free.dev/Flowersco/img/${item.gambar}',
                                "qty": qtyMap[item.id],
                              };
                            }).toList();

                            // 2. Kirim data tersebut
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PembayaranPage(
                                  cartItems: dataUntukPembayaran,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFBC1A6F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Lanjutkan Pembayaran →",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
