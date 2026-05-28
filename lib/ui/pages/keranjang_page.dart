import 'package:flutter/material.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  // Data produk di keranjang
  final List<Map<String, dynamic>> _cartItems = [
    {
      "id": 1,
      "name": "Rose Bouquet \"Eternal Love\"",
      "subtitle": "Warna: Deep Red",
      "price": 450000,
      "qty": 1,
      "imageUrl":
          "https://images.unsplash.com/photo-1561181286-d3fee7d55364?w=200",
    },
    {
      "id": 2,
      "name": "Peony Luxe Box",
      "subtitle": "Tipe: Signature",
      "price": 850000,
      "qty": 1,
      "imageUrl":
          "https://images.unsplash.com/photo-1526047932273-341f2a7631f9?w=200",
    },
  ];

  int _calculateSubtotal() {
    int total = 0;
    for (var item in _cartItems) {
      total += (item["price"] as int) * (item["qty"] as int);
    }
    return total;
  }

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

  @override
  Widget build(BuildContext context) {
    int subtotal = _calculateSubtotal();

    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Keranjang Belanja",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _cartItems.isEmpty
          ? const Center(child: Text("Keranjang Anda Kosong"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item["imageUrl"],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    item["subtitle"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _formatRupiah(item["price"]),
                                    style: const TextStyle(
                                      color: Color(0xFFBC1A6F),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Tombol Tambah/Kurang Quantity
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (item["qty"] > 1) {
                                        item["qty"]--;
                                      } else {
                                        _cartItems.removeAt(index);
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  "${item["qty"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Color(0xFFBC1A6F),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      item["qty"]++;
                                    });
                                  },
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Subtotal",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              _formatRupiah(subtotal),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBC1A6F),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              // 🌟 NAVIGASI: Pindah ke halaman pembayaran
                              Navigator.pushNamed(context, '/pembayaran');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFBC1A6F),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Lanjut ke Pembayaran",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
