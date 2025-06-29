import 'package:flutter/material.dart';

import 'history_done.dart';

class HistoryWait extends StatefulWidget {
  const HistoryWait({super.key});

  @override
  State<StatefulWidget> createState() => HistoryWaitPage();
}

class HistoryWaitPage extends State<HistoryWait> {
  String orderStatus = "Waiting for payment";

  @override
  void initState() {
    super.initState();
    // Timer untuk mengubah status setelah 5 detik
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        orderStatus = "Order Is In Process";
      });

      // Timer tambahan untuk pindah ke halaman HistoryDone setelah 5 detik
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HistoryDone()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          color: const Color(0xfff8fae5),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 40,
              top: 102,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Process',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: const Color(0xff5d4037),
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.normal),
                        maxLines: 9999,
                        overflow: TextOverflow.ellipsis,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Done',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: const Color(0xff868686),
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.normal),
                        maxLines: 9999,
                        overflow: TextOverflow.ellipsis,
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
                ],
              ),
            ),
            Positioned(
              left: 0,
              width: 375,
              top: 0,
              height: 44,
              child: Stack(
                children: [
                  Positioned(
                    left: 21,
                    width: 54,
                    top: 7,
                    height: 21,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          width: 54,
                          top: 6,
                          child: Text(
                            '9:41',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: const Color(0xff000000),
                                fontFamily: 'Poppins-LightItalic',
                                fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 30,
              width: 63,
              top: 50,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 24,
                    top: 0,
                    height: 24,
                    child: Image.asset(
                      'images/image_226110041.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Positioned(
                    left: 28,
                    width: 45,
                    top: 5,
                    child: Text(
                      'Back',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          color: const Color(0xff000000),
                          fontFamily: 'Poppins-Regular',
                          fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: -1,
              width: 600,
              top: 760,
              height: 700,
              child: Stack(
                children: [
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
                  Positioned(
                    left: 320,
                    width: 49,
                    top: 26,
                    height: 46,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 30,
                          child: Text(
                            'Profile',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: const Color(0xffffffff),
                                fontFamily: 'Inter-Regular',
                                fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                      ],
                    ),
                  ),
                  Positioned(
                    left: 228,
                    width: 55,
                    top: 22,
                    height: 51,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 35,
                          child: Text(
                            'History',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: const Color(0xffffffff),
                                fontFamily: 'Inter-Regular',
                                fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                      ],
                    ),
                  ),
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
                        Positioned(
                          left: 0,
                          top: 31,
                          child: Text(
                            'Orders',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: const Color(0xffffffff),
                                fontFamily: 'Inter-Regular',
                                fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        Positioned(
                          left: 2,
                          top: 32,
                          child: Text(
                            'Home',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                color: const Color(0xffffffff),
                                fontFamily: 'Inter-Regular',
                                fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              width: 370,
              top: 170,
              height: 110,
              child: Stack(
                children: [
                  Positioned(
                    left: -1,
                    width: 354,
                    top: 0,
                    height: 94,
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
                  Positioned(
                    left: 80,
                    width: 280,
                    top: 6,
                    height: 80,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 10,
                          child: Text(
                            'Brown Sugar Coffee',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                color: const Color(0xff000000),
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.bold),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          left: 191,
                          top: 12,
                          child: Text(
                            'Rp 25.000',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                color: const Color(0xff000000),
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.bold),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 189,
                                child: Text(
                                  'Ice, Regular, Normal Sugar, Normal Ice',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 12,
                                      color: const Color(0xff555555),
                                      fontFamily: 'Poppins-Regular',
                                      fontWeight: FontWeight.normal),
                                  maxLines: 9999,
                                  overflow: TextOverflow.ellipsis,
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
                                      color: const Color(0xff555555),
                                      fontFamily: 'Poppins-Regular',
                                      fontWeight: FontWeight.normal),
                                  maxLines: 9999,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 155,
                          top: 60,
                          child: Text(
                            orderStatus,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 11,
                                color: const Color(0xff000000),
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.bold),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
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
