import 'package:flutter/material.dart';

class HistoryDone extends StatelessWidget {
  const HistoryDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 420,
        height: 900,
        decoration: const BoxDecoration(
          color: Color(0xfff8fae5),
        ),
        child: Stack(
          children: [
            // Header Process & Done
            Positioned(
              left: 40,
              top: 102,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Process',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color(0xff868686),
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                      const SizedBox(height: 13),
                      Container(
                        width: 167.5,
                        height: 1,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffd7ccc8), width: 1),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Done',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color(0xff5d4037),
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                      const SizedBox(height: 13),
                      Container(
                        width: 167.5,
                        height: 1,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff5d4037), width: 3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Status Card
            Positioned(
              left: 35,
              width: 380,
              top: 170,
              height: 110,
              child: Stack(
                children: [
                  // Background Card
                  Positioned(
                    left: -1,
                    width: 354,
                    top: 0,
                    height: 105,
                    child: Container(
                      width: 354,
                      height: 94,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(3, 4),
                              blurRadius: 7.5),
                        ],
                      ),
                    ),
                  ),
                  // Image
                  Positioned(
                    left: 10,
                    width: 60,
                    top: 15,
                    height: 62,
                    child: Image.asset(
                      'images/image_2472185.png',
                      width: 59.048,
                      height: 62,
                    ),
                  ),
                  // Order Details
                  Positioned(
                    left: 80,
                    width: 280,
                    top: 6,
                    height: 80,
                    child: Stack(
                      children: [
                        // Item Name
                        const Positioned(
                          left: 0,
                          top: 10,
                          child: Text(
                            'Brown Sugar Coffee',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              color: Color(0xff000000),
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Item Price
                        const Positioned(
                          left: 191,
                          top: 12,
                          child: Text(
                            'Rp 25.000',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              color: Color(0xff000000),
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Item Description
                        const Positioned(
                          left: 0,
                          top: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 189,
                                child: Text(
                                  'Ice, Regular, Normal Sugar, Normal Ice',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    color: Color(0xff555555),
                                    fontFamily: 'Poppins-Regular',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 73,
                                child: Text(
                                  'x1',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 12,
                                    color: Color(0xff555555),
                                    fontFamily: 'Poppins-Regular',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Success Badge
                        Positioned(
                          left: 195,
                          top: 57,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xffe0f7fa),
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff00796b)),
                            ),
                            child: const Text(
                              "Success",
                              style: TextStyle(
                                color: Color(0xff00796b),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins-Medium',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Navigation Bar
            Positioned(
              left: -1,
              width: 600,
              top: 760,
              height: 700,
              child: Stack(
                children: [
                  // Background
                  Positioned(
                    left: -1,
                    width: 420,
                    top: 0,
                    height: 700,
                    child: Container(
                      width: 420,
                      height: 500,
                      decoration: BoxDecoration(
                        color: const Color(0xff43766c),
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                  ),
                  // Home Button
                  Positioned(
                    left: 42,
                    width: 45,
                    top: 25,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          width: 31,
                          top: 0,
                          height: 31,
                          child: Image.asset(
                            'images/image1_home_.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const Positioned(
                          left: 2,
                          top: 32,
                          child: Text(
                            'Home',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              color: Color(0xffffffff),
                              fontFamily: 'Inter-Regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Orders Button
                  Positioned(
                    left: 135,
                    width: 52,
                    top: 25,
                    height: 47,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 15,
                          width: 22,
                          top: 0,
                          height: 30,
                          child: Image.asset(
                            'images/image2_2471645.png',
                            width: 22,
                            height: 30,
                          ),
                        ),
                        const Positioned(
                          left: 0,
                          top: 31,
                          child: Text(
                            'Orders',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              color: Color(0xffffffff),
                              fontFamily: 'Inter-Regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // History Button
                  Positioned(
                    left: 228,
                    width: 55,
                    top: 25,
                    height: 51,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 5,
                          width: 38,
                          top: 0,
                          height: 38,
                          child: Image.asset(
                            'images/image_226110054.png',
                            width: 38,
                            height: 38,
                          ),
                        ),
                        const Positioned(
                          left: 0,
                          top: 35,
                          child: Text(
                            'History',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              color: Color(0xffffffff),
                              fontFamily: 'Inter-Regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Profile Button
                  Positioned(
                    left: 320,
                    width: 49,
                    top: 25,
                    height: 46,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          width: 27,
                          top: 0,
                          height: 27,
                          child: Image.asset(
                            'images/image4_2521518.png',
                            width: 27,
                            height: 27,
                          ),
                        ),
                        const Positioned(
                          left: 0,
                          top: 30,
                          child: Text(
                            'Profile',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              color: Color(0xffffffff),
                              fontFamily: 'Inter-Regular',
                            ),
                          ),
                        ),
                      ],
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
