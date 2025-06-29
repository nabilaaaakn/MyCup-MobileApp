import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/metode_provider.dart';
import 'package:provider/provider.dart';
import 'package:mycup_flutter/providers/final_providers.dart';
import 'package:mycup_flutter/providers/order.dart';
import 'package:mycup_flutter/pages/pembayaran/final.dart';

class MetodePembayaran extends StatefulWidget {
  const MetodePembayaran({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MetodePembayaranState createState() => _MetodePembayaranState();
}

class _MetodePembayaranState extends State<MetodePembayaran> {
  bool _isExpanded = false;

  /// Toggle dropdown visibility
  void _toggleExpand() {
    if (mounted) {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    }
  }

  /// Build item for bank selection
  Widget _buildBankItem(String bankName, String imagePath) {
    return GestureDetector(
      onTap: () {
        final paymentProvider =
            Provider.of<PaymentProvider>(context, listen: false);
        paymentProvider.selectBank(bankName);
        if (mounted) {
          setState(() {
            _isExpanded = false; // Close dropdown after selection
          });
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$bankName dipilih')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Text(
              bankName,
              style: const TextStyle(
                color: Color(0xFF3C3C3C),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context);
    final selectedBank = paymentProvider.selectedBank;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E5),
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
        backgroundColor: const Color(0xFFFFF8E5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for bank selection
            GestureDetector(
              onTap: _toggleExpand,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF979797)),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFF8FAE5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "images/transferbank.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Transfer Bank',
                              style: TextStyle(
                                color: Color(0xFF3C3C3C),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (selectedBank != null)
                              Text(
                                selectedBank,
                                style: const TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 12,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: const Color(0xFF3C3C3C),
                    ),
                  ],
                ),
              ),
            ),
            if (_isExpanded)
              Column(
                children: [
                  _buildBankItem('Bank BCA', "images/bankbca.png"),
                  _buildBankItem('Bank Mandiri', "images/bankmandiri.png"),
                  _buildBankItem('Bank BNI', "images/bankbni.png"),
                  _buildBankItem('Bank BRI', "images/bankbri.png"),
                ],
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (orderProvider.orders.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Keranjang kosong')),
                  );
                  return;
                }

                if (selectedBank == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pilih metode pembayaran')),
                  );
                  return;
                }

                final products = orderProvider.orders
                    .map(
                      (order) => Product(
                        productImage: order.productImage,
                        productName: order.productName,
                        quantity: order.quantity,
                        price: order.price,
                      ),
                    )
                    .toList();

                paymentProvider.saveDataPayment(products);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PagePembayaran(
                      selectedBank: selectedBank,
                      products: products,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAC0D0D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Lanjutkan Pembayaran',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
