import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/order.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orders = orderProvider.orders;
    final totalPrice = orderProvider.getTotalPrice();
    final formatter = NumberFormat('#,###', 'en_US');
    String formattedTotalPrice = formatter.format(totalPrice);

    return Column(
      children: [
        Container(
          width: 500,
          height: 866,
          decoration: const BoxDecoration(color: Color(0xFFFFF8E5)),
          child: Stack(
            children: [
              // Back Button
              Positioned(
                left: 34,
                top: 67,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/arrow_back.png"),
                      ),
                    ),
                  ),
                ),
              ),

              // Header Text
              Positioned(
                left: 75,
                top: 68,
                child: const Text(
                  'My Cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              // Jika keranjang kosong
              if (orders.isEmpty)
                Positioned(
                  left: 30,
                  top: 260,
                  child: Column(
                    children: [
                      Container(
                        width: 204,
                        height: 204,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/kopikeranjang.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Oops, your cart’s feeling lonely! Why not\nshow it some love and grab a treat or two?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF979797),
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          height: 1.05,
                        ),
                      ),
                    ],
                  ),
                )
              // Jika ada produk dalam keranjang
              else
                Positioned(
                  left: 30,
                  top: 130,
                  child: Column(
                    children: orders.map((order) {
                      return Container(
                        width: 355,
                        height: 80,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Stack(
                          children: [
                            // Background Box
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 350,
                                height: 75,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),

                            // Product Image
                            Positioned(
                              left: 10,
                              top: 7,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(order.productImage),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),

                            // Product Name
                            Positioned(
                              left: 75,
                              top: 8,
                              child: Text(
                                order.productName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // Product Price
                            Positioned(
                              left: 75,
                              top: 35,
                              child: Text(
                                'Rp ${order.price.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: Color(0xFFC90000),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            // Quantity Controls
                            Positioned(
                              left: 250,
                              top: 20,
                              child: Container(
                                width: 90,
                                height: 34,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        orderProvider.decreaseQuantity(
                                            context, order);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.remove,
                                          size: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${order.quantity}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        orderProvider.increaseQuantity(order);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 16,
                                          color: Colors.black,
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
                    }).toList(),
                  ),
                ),

              // Total Payment Section
              Positioned(
                left: 0,
                top: 800,
                child: Container(
                  width: 415,
                  height: 70,
                  decoration: const BoxDecoration(color: Color(0xFFAC0D0D)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total Payment
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Total Pembayaran',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Rp $formattedTotalPrice',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Pilih Pembayaran Button
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/metode');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Pilih Pembayaran',
                            style: TextStyle(
                              color: Color(0xFFAC0D0D),
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
          ),
        ),
      ],
    );
  }
}
