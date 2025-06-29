// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/final_providers.dart';

// Halaman PagePembayaran
class PagePembayaran extends StatefulWidget {
  final String? selectedBank; // Parameter untuk bank yang dipilih
  final List<Product> products; // List produk yang akan dibayar

  const PagePembayaran({
    super.key,
    this.selectedBank,
    required this.products,
  });

  @override
  _PagePembayaranState createState() => _PagePembayaranState();
}

class _PagePembayaranState extends State<PagePembayaran> {
  Duration _duration =
      const Duration(minutes: 30); // Timer untuk batas waktu pembayaran
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _duration = _duration - const Duration(seconds: 1);
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalPayment = widget.products.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E5), // Background sesuai desain
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8E5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  return ProductItemCard(product: widget.products[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPaymentInfo('Total Payment',
                    'Rp ${totalPayment.toStringAsFixed(0)}', Colors.black),
                _buildPaymentInfo('Time Left', _formatDuration(_duration),
                    const Color(0xFFC90000)),
              ],
            ),
            const SizedBox(height: 16),
            if (widget.selectedBank != null) _buildBankInfo(),
            const SizedBox(height: 16),
            _buildTransferInstructions(),
            const SizedBox(height: 16),
            _buildCancelOrderButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentInfo(String title, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: valueColor,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildBankInfo() {
    return Row(
      children: [
        Image.asset(
          'images/${widget.selectedBank!.toLowerCase()}.png', // Dynamic image
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.selectedBank!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Account Number: 126 0813 8755 6190',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransferInstructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Mbanking Transfer Instructions',
          style: TextStyle(
            color: Color.fromARGB(255, 172, 172, 172),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 8),
        Text(
          '1. Open the m-banking app on your smartphone\n'
          '2. Enter username and password\n'
          '3. Choose the transfer menu\n'
          '4. Enter virtual account number\n'
          '5. Enter the amount to be transferred\n'
          '6. Recheck the transfer information and confirm by entering the PIN\n'
          '7. Transaction completed',
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 172, 172, 172),
            fontFamily: 'Poppins',
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildCancelOrderButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Agar tombol kecil di kanan
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/berhasil'); // Untuk kembali ke halaman sebelumnya
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFF8E5), // Warna abu-abu gelap
            minimumSize: const Size(100, 40), // Ukuran lebih kecil
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: const Text(
            'Test Berhasil',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.red,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const SizedBox(height: 8), // Jarak antara tombol
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Cancel Order"),
                  content:
                      const Text("Are you sure you want to cancel this order?"),
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pop(), // Close dialog
                      child: const Text("No"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      child: const Text("Yes"),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC90000),
            minimumSize: const Size(double.infinity, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Cancel Order',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}

// Reusable ProductItemCard
class ProductItemCard extends StatelessWidget {
  final Product product;

  const ProductItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFF8E5),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(product.productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp ${product.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFC90000),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.quantity}x',
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
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
}
