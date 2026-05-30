import 'package:flutter/material.dart';

class PembayaranPage extends StatefulWidget {
  // TAMBAHAN: Menerima data dari halaman sebelumnya
  final List<Map<String, dynamic>> cartItems;

  const PembayaranPage({super.key, required this.cartItems});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  String _selectedDelivery = "Express";
  final int _expressPrice = 50000;
  final int _standardPrice = 25000;
  String _selectedPayment = "Transfer Bank";

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      "id": "Transfer Bank",
      "title": "Transfer Bank (BCA/Mandiri)",
      "subtitle": "Dicek otomatis, bebas biaya admin",
      "icon": Icons.account_balance_outlined,
    },
    {
      "id": "E-Wallet",
      "title": "E-Wallet (Dana/OVO/Gopay)",
      "subtitle": "Instan menggunakan QRIS / Aplikasi",
      "icon": Icons.account_balance_wallet_outlined,
    },
    {
      "id": "Kartu Kredit",
      "title": "Kartu Kredit / Debit",
      "subtitle": "Visa, Mastercard, atau JCB",
      "icon": Icons.credit_card_outlined,
    },
    {
      "id": "COD",
      "title": "Bayar di Tempat (COD)",
      "subtitle": "Bayar tunai saat kurir tiba",
      "icon": Icons.payments_outlined,
    },
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _nameError;
  String? _phoneError;
  String? _addressError;

  int _calculateSubtotal() {
    int total = 0;
    for (var item in widget.cartItems) {
      total += (item["price"] as num).toInt();
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

  bool _validateInput() {
    bool isValid = true;

    setState(() {
      _nameError = _nameController.text.trim().isEmpty
          ? 'Nama tidak boleh kosong'
          : null;
      _phoneError = _phoneController.text.trim().isEmpty
          ? 'Nomor telepon tidak boleh kosong'
          : null;
      _addressError = _addressController.text.trim().isEmpty
          ? 'Alamat tidak boleh kosong'
          : null;

      if (_nameError != null || _phoneError != null || _addressError != null) {
        isValid = false;
      }
    });

    return isValid;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int subtotal = _calculateSubtotal();
    int shippingCost = (_selectedDelivery == "Express")
        ? _expressPrice
        : _standardPrice;
    int tax = (subtotal * 0.11).round();
    int totalFinal = subtotal + shippingCost + tax;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFBC1A6F)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Checkout & Pembayaran",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionContainer(
              title: "Alamat Pengiriman",
              icon: Icons.location_on_outlined,
              child: Column(
                children: [
                  _buildInputField(
                    label: "Nama Lengkap",
                    controller: _nameController,
                    errorText: _nameError,
                  ),
                  const SizedBox(height: 12),
                  _buildInputField(
                    label: "Nomor Telepon",
                    controller: _phoneController,
                    errorText: _phoneError,
                  ),
                  const SizedBox(height: 12),
                  _buildInputField(
                    label: "Alamat Lengkap",
                    controller: _addressController,
                    errorText: _addressError,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionContainer(
              title: "Metode Pengiriman",
              icon: Icons.local_shipping_outlined,
              child: Column(
                children: [
                  _buildDeliveryOption(
                    type: "Express",
                    title: "Express Delivery",
                    duration: "Tiba dalam 2-4 Jam",
                    price: _expressPrice,
                  ),
                  const SizedBox(height: 12),
                  _buildDeliveryOption(
                    type: "Standard",
                    title: "Standard Delivery",
                    duration: "Tiba Besok / Same Day",
                    price: _standardPrice,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionContainer(
              title: "Metode Pembayaran",
              icon: Icons.payment_outlined,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  bool isSelected = _selectedPayment == method["id"];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPayment = method["id"];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFFFF5F8)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFBC1A6F)
                              : Colors.black12,
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            method["icon"],
                            color: isSelected
                                ? const Color(0xFFBC1A6F)
                                : Colors.black45,
                            size: 22,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  method["title"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: isSelected
                                        ? const Color(0xFFBC1A6F)
                                        : Colors.black87,
                                  ),
                                ),
                                Text(
                                  method["subtitle"],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: isSelected
                                ? const Color(0xFFBC1A6F)
                                : Colors.black38,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionContainer(
              title: "Ringkasan Pesanan",
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item["imageUrl"],
                                width: 60,
                                height: 60,
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
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    item["subtitle"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    _formatRupiah(item["price"]),
                                    style: const TextStyle(
                                      color: Color(0xFFBC1A6F),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Divider(height: 24, color: Colors.black12),
                  _buildPriceRow("Subtotal", _formatRupiah(subtotal)),
                  const SizedBox(height: 8),
                  _buildPriceRow(
                    "Biaya Pengiriman ($_selectedDelivery)",
                    _formatRupiah(shippingCost),
                  ),
                  const SizedBox(height: 8),
                  _buildPriceRow("Pajak (11%)", _formatRupiah(tax)),
                  const Divider(height: 32, color: Colors.black12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _formatRupiah(totalFinal),
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
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_validateInput()) {
                          _showKonfirmasiPembayaranDialog(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Mohon lengkapi semua data pengiriman.',
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBC1A6F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bayar Sekarang",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "SECURE CHECKOUT POWERED BY FLOWERS.CO",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 9,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showKonfirmasiPembayaranDialog(BuildContext context) {
    String dialogStatus =
        'idle'; // Mengontrol status: 'idle', 'loading', 'success'

    // Mencari objek payment method yang sesuai untuk mengambil title lengkapnya
    final currentMethod = _paymentMethods.firstWhere(
      (element) => element["id"] == _selectedPayment,
      orElse: () => {
        "title": _selectedPayment.isEmpty ? "Transfer Bank" : _selectedPayment,
      },
    );
    String paymentTitleDisplay = currentMethod["title"];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(
            0xFFF3EBF1,
          ), // Penyesuaian background popup
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFCDCE2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.assignment_turned_in_outlined,
                  color: Color(0xFFBC1A6F),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Konfirmasi Pesanan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Apakah data pesanan Anda sudah benar?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),

                // --- KOTAK DETAIL PUTIH (DINAMIS MENGIKUTI PANJANG TEKS) ---
                IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildDetailItem(
                          "Penerima:",
                          _nameController.text.isEmpty
                              ? "-"
                              : _nameController.text,
                        ),
                        const Divider(
                          height: 20,
                          color: Color(0xFFF3EBF1),
                          thickness: 1,
                        ),

                        _buildDetailItem(
                          "No. Telepon:",
                          _phoneController.text.isEmpty
                              ? "-"
                              : _phoneController.text,
                        ),
                        const Divider(
                          height: 20,
                          color: Color(0xFFF3EBF1),
                          thickness: 1,
                        ),

                        _buildDetailItem(
                          "Alamat Pengiriman:",
                          _addressController.text.isEmpty
                              ? "-"
                              : _addressController.text,
                        ),
                        const Divider(
                          height: 20,
                          color: Color(0xFFF3EBF1),
                          thickness: 1,
                        ),

                        const Text(
                          "Metode Pembayaran:",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          paymentTitleDisplay,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBC1A6F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: const EdgeInsets.only(
            right: 16,
            bottom: 20,
            left: 16,
          ),
          actions: [
            TextButton(
              onPressed: dialogStatus != 'idle'
                  ? null
                  : () {
                      Navigator.pop(context);
                    },
              child: const Text(
                "Ubah Data",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(width: 8),

            // --- TOMBOL UTAMA LOADING & SUKSES CENTANG ---
            StatefulBuilder(
              builder: (context, setStateDialog) {
                return ElevatedButton(
                  onPressed: dialogStatus != 'idle'
                      ? null
                      : () async {
                          setStateDialog(() {
                            dialogStatus = 'loading';
                          });

                          // Simulasi loading memproses data selama 2 detik
                          await Future.delayed(
                            const Duration(milliseconds: 2000),
                          );

                          setStateDialog(() {
                            dialogStatus = 'success';
                          });

                          // Jeda sejenak untuk menunjukkan animasi centang sukses (1.5 detik)
                          await Future.delayed(
                            const Duration(milliseconds: 1500),
                          );

                          if (context.mounted) {
                            Navigator.pop(context); // Tutup dialog
                            Navigator.pushNamed(
                              context,
                              '/selesai-pembayaran',
                            ); // Navigasi ke halaman selesai pembayaran
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dialogStatus == 'success'
                        ? Colors.green
                        : const Color(0xFFBC1A6F),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: dialogStatus == 'loading'
                        ? const SizedBox(
                            key: ValueKey('loading'),
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : dialogStatus == 'success'
                        ? const Row(
                            key: ValueKey('success'),
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Sukses",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        : const Text(
                            key: ValueKey('idle'),
                            "Ya, Benar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Widget helper pembantu untuk merapikan baris detail item di kotak putih
  Widget _buildDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Helper Widgets bawaan kamu sebelumnya
  Widget _buildSectionContainer({
    required String title,
    IconData? icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: const Color(0xFFBC1A6F), size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String? errorText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFF9FA),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            errorText: errorText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: errorText != null
                    ? Colors.red.shade200
                    : const Color(0xFFFCDCE2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : const Color(0xFFBC1A6F),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryOption({
    required String type,
    required String title,
    required String duration,
    required int price,
  }) {
    bool isSelected = _selectedDelivery == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDelivery = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF5F8) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFBC1A6F) : Colors.black12,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: isSelected
                        ? const Color(0xFFBC1A6F)
                        : Colors.black87,
                  ),
                ),
                Text(
                  duration,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
            Text(
              _formatRupiah(price),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ],
    );
  }
}
