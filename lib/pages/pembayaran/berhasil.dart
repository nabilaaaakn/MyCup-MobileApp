import 'package:flutter/material.dart';

class OrderBerhasil extends StatelessWidget {
  const OrderBerhasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 860,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF8FAE5)),
          child: Stack(
            children: [
              Positioned(
                left: 97,
                top: 143,
                child: Container(
                  width: 177,
                  height: 177,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.83, vertical: 5.53),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 149.34,
                        height: 165.94,
                        child: Stack(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 62,
                top: 380,
                child: SizedBox(
                  width: 280,
                  height: 50,
                  child: Text(
                    'Ordered',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF181D2D),
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 450,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Kelompok 3,\n your order has been successfully placed.\n\n',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.95,
                        ),
                      ),
                      TextSpan(
                        text:
                            'The order will be ready today\nto 18:10 at the address\nKuningan, South Jakarta\n\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.95,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Submit your personal QR code\nat a coffee shop to receive an order.',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.95,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: 26,
                top: 21,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.only(
                    top: 5.50,
                    left: 3.50,
                    right: 4,
                    bottom: 4.95,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(1.57),
                        child: SizedBox(
                          width: 13.55,
                          height: 16.50,
                          child: Stack(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 115,
                top: 150,
                child: Container(
                  width: 170.45,
                  height: 170.64,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/ZBERHASIL.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 805,
                child: SizedBox(
                  width: 500,
                  height: 84,
                  child: GestureDetector(
                    onTap: () {
                      // Menampilkan BottomSheet dari halaman lain ketika Container diklik
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 500,
                            height: 84,
                            decoration: BoxDecoration(color: Color(0xFFAC0D0D)),
                          ),
                        ),
                        Positioned(
                          left: 167,
                          top: 8,
                          child: SizedBox(
                            width: 60,
                            height: 45,
                            child: Text(
                              'OK',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.67,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
