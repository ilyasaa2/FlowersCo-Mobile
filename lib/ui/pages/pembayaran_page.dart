import 'package:flutter/material.dart';
import 'konfirmasi_pesanan_page.dart';

class PembayaranPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const PembayaranPage({super.key, required this.cartItems});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  // Controller untuk menangani input teks dari user
  final TextEditingController _namaController = TextEditingController(text: "");
  final TextEditingController _phoneController = TextEditingController(text: "");
  final TextEditingController _alamatController = TextEditingController(text: "");

  // Controller dan state untuk diskon
  final TextEditingController _discountCodeController = TextEditingController();
  int _appliedDiscountAmount = 0;
  String _discountMessage = ''; // Untuk menampilkan pesan sukses/error diskon
  // State untuk menyimpan metode pembayaran yang dipilih
  String _selectedPayment = "Transfer Bank (BCA)";
  final List<String> _paymentMethods = [
    "Transfer Bank (BCA)",
    "Transfer Bank (Mandiri)",
    "GoPay",
    "OVO",
    "ShopeePay",
    "COD",
  ];

  @override
  void dispose() {
    _namaController.dispose();
    _phoneController.dispose();
    _alamatController.dispose();
    _discountCodeController.dispose(); // Dispose discount controller
    super.dispose();
  }

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

  // Fungsi untuk menerapkan diskon
  void _applyDiscount() {
    setState(() {
      String code = _discountCodeController.text.trim().toUpperCase();
      if (code == "HEMAT20") { // Contoh kode diskon
        _appliedDiscountAmount = 20000; // Contoh nilai diskon
        _discountMessage = 'Diskon HEMAT20 berhasil diterapkan!';
      } else {
        _appliedDiscountAmount = 0;
        _discountMessage = 'Kode diskon tidak valid.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // LOGIKA UTAMA: Menghitung total harga dari item yang dikirim
    // Ini memastikan harga bertambah sesuai dengan qty yang ada di keranjang
    int subtotal = widget.cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] as int) * (item['qty'] as int),
    );
    int biayaPengiriman = 15000;
    int totalPembayaran = subtotal + biayaPengiriman - _appliedDiscountAmount; // Kurangi dengan diskon

    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFBC1A6F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pembayaran",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // --- BAGIAN INFORMASI PENGIRIMAN ---
                const Text(
                  "Informasi Pengiriman",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _buildInputCard(
                  child: Column(
                    children: [
                      _buildTextField(controller: _namaController, label: "Nama Penerima", icon: Icons.person),
                      const SizedBox(height: 12),
                      _buildTextField(controller: _phoneController, label: "Nomor HP", icon: Icons.phone, keyboardType: TextInputType.phone),
                      const SizedBox(height: 12),
                      _buildTextField(controller: _alamatController, label: "Alamat Lengkap", icon: Icons.location_on, maxLines: 2),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // --- BAGIAN METODE PEMBAYARAN ---
                const Text(
                  "Metode Pembayaran",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _buildInputCard(
                  child: DropdownButtonFormField<String>(
                    value: _selectedPayment,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.account_balance_wallet, color: Color(0xFFBC1A6F)),
                    ),
                    items: _paymentMethods.map((method) {
                      return DropdownMenuItem(
                        value: method,
                        child: Text(method, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPayment = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // --- BAGIAN KODE DISKON ---
                const Text(
                  "Kode Diskon",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _buildInputCard(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _discountCodeController,
                          decoration: const InputDecoration(
                            hintText: "Masukkan kode diskon",
                            border: InputBorder.none,
                            isDense: true, // Membuat TextField lebih ringkas
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _applyDiscount,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFBC1A6F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        child: const Text("Terapkan"),
                      ),
                    ],
                  ),
                ),
                if (_discountMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _discountMessage,
                      style: TextStyle(
                        color: _appliedDiscountAmount > 0 ? Colors.green : Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                const SizedBox(height: 24),

                const Text(
                  "Ringkasan Pesanan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                // Daftar Produk
                ...widget.cartItems.map((item) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item['imageUrl'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => Container(
                              width: 60,
                              height: 60,
                              color: Colors.grey[200],
                              child: const Icon(Icons.broken_image, size: 20),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${item['qty']} x ${_formatRupiah(item['price'])}",
                                style: const TextStyle(color: Colors.black54, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          _formatRupiah((item['price'] as int) * (item['qty'] as int)),
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFBC1A6F)),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                const Divider(height: 32),
                // Detail Perhitungan
                _buildDetailRow("Subtotal Produk", _formatRupiah(subtotal)),
                _buildDetailRow("Biaya Pengiriman", _formatRupiah(biayaPengiriman)),
                _buildDetailRow("Diskon", "- ${_formatRupiah(_appliedDiscountAmount)}", color: Colors.green),
                const Divider(height: 32),
                _buildDetailRow(
                  "Total Pembayaran",
                  _formatRupiah(totalPembayaran),
                  isBold: true,
                  color: const Color(0xFFBC1A6F),
                ),
              ],
            ),
          ),
          // Tombol Bayar
          // Ganti bagian "Tombol Bayar" dengan kode ini:

Container(
  padding: const EdgeInsets.all(20),
  decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
  ),
  child: SafeArea(
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // 1. Logika Pengecekan
          if (_namaController.text.trim().isEmpty || 
              _phoneController.text.trim().isEmpty || 
              _alamatController.text.trim().isEmpty) {
            
            // 2. Tampilkan notifikasi jika ada yang kosong
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Mohon lengkapi semua data pengiriman terlebih dahulu!"),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            // 3. Jika semua sudah terisi, baru jalankan navigasi
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => KonfirmasiPesananPage(
                  nama: _namaController.text,
                  phone: _phoneController.text,
                  alamat: _alamatController.text,
                  metode: _selectedPayment,
                  subtotal: subtotal,
                  ongkir: biayaPengiriman,
                  diskon: _appliedDiscountAmount,
                  total: totalPembayaran,
                  cartItems: widget.cartItems,
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFBC1A6F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Lanjutkan ke Konfirmasi",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
),
        ],
      ),
    );
  }

  Widget _buildInputCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFFBC1A6F)),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool isBold = false, Color color = Colors.black87}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: isBold ? 16 : 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: isBold ? 18 : 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: color),
          ),
        ],
      ),
    );
  }
}