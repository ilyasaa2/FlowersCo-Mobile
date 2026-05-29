import 'package:flutter/material.dart';
import 'product_model.dart'; // Import ini aman karena satu folder

class AppState {
  // Notifier static untuk menampung data global
  static final ValueNotifier<List<Product>> cartNotifier =
      ValueNotifier<List<Product>>([]);
  static final ValueNotifier<List<Product>> wishlistNotifier =
      ValueNotifier<List<Product>>([]);

  // Fungsi menambah barang ke keranjang
  static void addToCart(Product item, BuildContext context) {
    cartNotifier.value = List.from(cartNotifier.value)..add(item);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.nama} berhasil ditambahkan ke keranjang!'),
        duration: const Duration(seconds: 1),
        backgroundColor: const Color(0xFFBC1A6F),
      ),
    );
  }

  // Fungsi menambah/menghapus produk dari wishlist
  static void toggleWishlist(Product item, BuildContext context) {
    List<Product> currentWishlist = List.from(wishlistNotifier.value);
    bool isExist = currentWishlist.any((e) => e.id == item.id);

    if (isExist) {
      currentWishlist.removeWhere((e) => e.id == item.id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${item.nama} dihapus dari Wishlist'),
          duration: const Duration(seconds: 1),
        ),
      );
    } else {
      currentWishlist.add(item);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${item.nama} ditambahkan ke Wishlist! ❤️'),
          duration: const Duration(seconds: 1),
          backgroundColor: const Color(0xFFBC1A6F),
        ),
      );
    }
    wishlistNotifier.value = currentWishlist;
  }
}
