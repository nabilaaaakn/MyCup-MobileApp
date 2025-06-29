// ignore_for_file: prefer_const_constructors, camel_case_types
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mycup_flutter/pages/pembayaran/order_cheesecake.dart';
import 'package:mycup_flutter/pages/pembayaran/order_frenchfries.dart';

class SnackPage extends StatefulWidget {
  const SnackPage({super.key});

  @override
  State<StatefulWidget> createState() => _CodiaPage();
}

class _CodiaPage extends State<SnackPage> {
  late ScrollController _promoScrollController;
  late Timer _promoScrollTimer;

  @override
  void initState() {
    super.initState();
    _promoScrollController = ScrollController();
    _startPromoAutoScroll();
  }

  void _startPromoAutoScroll() {
    _promoScrollTimer =
        Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_promoScrollController.hasClients) {
        final maxScroll = _promoScrollController.position.maxScrollExtent;
        final currentScroll = _promoScrollController.offset;

        if (currentScroll < maxScroll) {
          _promoScrollController.jumpTo(currentScroll + 2); // Kecepatan scroll
        } else {
          _promoScrollTimer.cancel();
          Future.delayed(const Duration(seconds: 2), () {
            _promoScrollController.jumpTo(0); // Kembali ke awal
            _startPromoAutoScroll(); // Mulai scroll lagi
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _promoScrollTimer.cancel();
    _promoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff6f8e3),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              width: 50,
              top: 361,
              height: 40.5,
              child: Image.asset(
                'images/image_ble.png',
                width: 422,
                height: 40.5,
              ),
            ),
            Positioned(
              left: -45,
              width: 500, // Mengatur lebar total
              top: 400,
              height: 360,
              child: Container(
                width: 800,
                height: 900,
                decoration: const BoxDecoration(
                  color: Color(0xfff6f8e3),
                ),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.vertical, // Mengatur scroll ke arah vertikal
                  child: Container(
                    alignment: Alignment(0, 0.4),
                    child: Column(
                      children: [
                        // Row untuk dua item pertama
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Item 1: Thai Tea
                            Container(
                              width: 141,
                              height: 172,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 30, top: 30),
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 23.8,
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  // Menampilkan BottomSheet dari halaman lain ketika Container diklik
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled:
                                        true, // Agar ukuran dapat disesuaikan
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(
                                              16)), // Sudut melengkung
                                    ),
                                    builder: (context) {
                                      return FractionallySizedBox(
                                        heightFactor:
                                            0.762, // Atur tinggi dialog sesuai kebutuhan
                                        child:
                                            OrderFrench(), // Ganti dengan widget halaman lain yang ingin ditampilkan
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'images/kentang.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      height: 12,
                                      child: const Text(
                                        'French Fries',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 11,
                                          color: Color(0xff000000),
                                          fontFamily: 'Poppins-Bold',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      child: const Text(
                                        'Rp 30.000',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 9,
                                          color: Color(0xffc90000),
                                          fontFamily: 'Poppins-Bold',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Item 2: Cheese cake
                            Container(
                              width: 141,
                              height: 172,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 35),
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 23.8,
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  // Menampilkan BottomSheet dari halaman lain ketika Container diklik
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled:
                                        true, // Agar ukuran dapat disesuaikan
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(
                                              16)), // Sudut melengkung
                                    ),
                                    builder: (context) {
                                      return FractionallySizedBox(
                                        heightFactor:
                                            0.762, // Atur tinggi dialog sesuai kebutuhan
                                        child:
                                            OrderCheese(), // Ganti dengan widget halaman lain yang ingin ditampilkan
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          'images/cheesecake.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      height: 12,
                                      child: const Text(
                                        'Cheese cake',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 11,
                                          color: Color(0xff000000),
                                          fontFamily: 'Poppins-Bold',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      child: const Text(
                                        'Rp 35 .000',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 9,
                                          color: Color(0xffc90000),
                                          fontFamily: 'Poppins-Bold',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Column untuk item-item lainnya
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Item 3: Mix Platter
                            Container(
                              width: 141,
                              height: 172,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 30, top: 30),
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 23.8,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/Mix_platter.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 12,
                                    child: const Text(
                                      'Mix Platter',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 11,
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    child: const Text(
                                      'Rp 30.000',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 9,
                                        color: Color(0xffc90000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Item 4: waffle
                            Container(
                              width: 141,
                              height: 172,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 30),
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 23.8,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/Waffle.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 12,
                                    child: const Text(
                                      'Waffle',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 11,
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    child: const Text(
                                      'Rp 20.000',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 9,
                                        color: Color(0xffc90000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Item 5: Cireng
                            Container(
                              width: 141,
                              height: 172,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 30, top: 30),
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 23.8,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/Cireng.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 12,
                                    child: const Text(
                                      'Cireng',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 11,
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    child: const Text(
                                      'Rp 15.000',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 9,
                                        color: Color(0xffc90000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Item 6: Roti Bakar
                            Container(
                              width: 141,
                              height: 172,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 30),
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0, 0),
                                    blurRadius: 23.8,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/Roti_bakar.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 12,
                                    child: const Text(
                                      'Roti Bakar',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 11,
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    child: const Text(
                                      'Rp 25.000',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 9,
                                        color: Color(0xffc90000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        // Item 9: Mac And Cheese
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(
                              left: 10, right: 185, top: 30),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'images/Mac_and_cheese.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 12,
                                child: const Text(
                                  'Mac And Cheese',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                child: const Text(
                                  'Rp 28.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 9,
                                    color: Color(0xffc90000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                    left: 46,
                    width: 31,
                    top: 19,
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Image.asset(
                        'images/image1_home_.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 25,
                    top: 25,
                    height: 35,
                    child: Image.asset(
                      'images/image2_keranjang.png',
                      width: 25,
                      height: 35,
                    ),
                  ),
                  const Positioned(
                    left: 42,
                    top: 60,
                    child: Text(
                      'Home',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight:
                              FontWeight.bold), // Set fontWeight to bold
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Positioned(
                    left: 127,
                    top: 60,
                    child: Text(
                      'Orders',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color(0xFF76453B),
                          fontWeight:
                              FontWeight.bold), // Set fontWeight to bold
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Positioned(
                    left: 315,
                    top: 60,
                    child: Text(
                      'Profile',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color(0xffffffff),
                          fontWeight:
                              FontWeight.bold), // Set fontWeight to bold
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Positioned(
                    left: 220,
                    top: 60,
                    child: Text(
                      'History',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          color: Color(0xffffffff),
                          fontWeight:
                              FontWeight.bold), // Set fontWeight to bold
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    left: 235,
                    width: 35,
                    top: 26,
                    height: 40,
                    child: Image.asset(
                      'images/History.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Positioned(
                    left: 332,
                    width: 30,
                    top: 24,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context,
                            '/Profile_read'); // Ganti '/halamanTujuan' dengan rute yang sesuai
                      },
                      child: Image.asset(
                        'images/image4_2521518.png',
                        width: 27,
                        height: 27,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              //Latar Belakang
              left: 0,
              width: 900, // Mengatur lebar total
              top: 0,
              height: 400,
              child: Container(
                width: 900,
                height: 700,
                decoration: const BoxDecoration(
                  color: Color(0xfff6f8e3),
                ),
                child: SingleChildScrollView(
                  controller: _promoScrollController,
                  scrollDirection:
                      Axis.horizontal, // Mengatur scroll ke arah horizontal
                  child: Container(
                    alignment: Alignment(0, 0.4),
                    child: Row(
                      children: [
                        // Item 1: Lemon Tea
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10), // Jarak antar item
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'images/image_2641765.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 12,
                                child: const Text(
                                  'Lemon Tea',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'Rp 18.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 9,
                                    color: Color(0xffc90000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 1),
                                child: const Text(
                                  'Rp 22.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    fontSize: 7.5,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Regular',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Item 2: Peach Tea
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'images/image_2641774.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                child: const Text(
                                  'Peach Tea',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Bold ',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'Rp 18.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 9,
                                    color: Color(0xffc90000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 1),
                                child: const Text(
                                  'Rp 22.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    fontSize: 7.5,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Regular',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Item 3 : Iced Chocolate
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'images/image_2641784.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                child: const Text(
                                  'Iced Chocolate',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Bold ',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'Rp 30.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 9,
                                    color: Color(0xffc90000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 1),
                                child: const Text(
                                  'Rp 25.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    fontSize: 7.5,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Regular',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Item 4 : Strawberry Ice Tea
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'images/image_2641794.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                child: const Text(
                                  'Strawberry Ice Tea',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Bold ',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'Rp 25.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 9,
                                    color: Color(0xffc90000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 1),
                                child: const Text(
                                  'Rp 20.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    fontSize: 7.5,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Regular',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Item  5: 'Mac & Cheese'
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'images/image_2641816.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                child: const Text(
                                  'Mac & Cheese',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 11,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Bold ',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: const Text(
                                  'Rp 30.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 9,
                                    color: Color(0xffc90000),
                                    fontFamily: 'Poppins-Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 1),
                                child: const Text(
                                  'Rp 28.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.black,
                                    fontSize: 7.5,
                                    color: Color(0xff000000),
                                    fontFamily: 'Poppins-Regular',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Item  6: Mac & Cheese
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/image_2641816.png',
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                'Mac & Cheese',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 8,
                                  color: Color(0xff000000),
                                  fontFamily: 'Poppins-Bold',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(
                                'Rp 30.000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 6,
                                  color: Color(0xffc90000),
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(
                                'Rp 28.000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 8,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 1,
                                color: const Color(0xff8c8c8c),
                              ),
                            ],
                          ),
                        ),
                        // Item 7: French Fries
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/image_2641827.png',
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                'French Fries',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 8,
                                  color: Color(0xff000000),
                                  fontFamily: 'Poppins-Bold',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(
                                'Rp 30.000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 6,
                                  color: Color(0xff7e7e7e),
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(
                                'Rp 25.000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 8,
                                  color: Color(0xffc90000),
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 1,
                                color: const Color(0xff8c8c8c),
                              ),
                            ],
                          ),
                        ),
                        // Item 8: Waffles
                        Container(
                          width: 141,
                          height: 172,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 23.8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/image_2641838.png',
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                'Waffles',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 8,
                                  color: Color(0xff000000),
                                  fontFamily: 'Poppins-Bold',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(
                                'Rp 20.000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 6,
                                  color: Color(0xff7e7e7e),
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Text(
                                'Rp 25.000',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 8,
                                  color: Color(0xffc90000),
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 1,
                                color: const Color(0xff8c8c8c),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              width: 600,
              top: -20,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 600,
                    top: -20,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          width: 600,
                          top: -20,
                          height: 150,
                          child: Container(
                            width: 600,
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(0, 91, 36, 0),
                                  Color.fromARGB(41, 91, 36, 0),
                                  Color.fromARGB(70, 91, 36, 0),
                                  Color.fromARGB(146, 91, 36, 0),
                                ],
                                stops: [0.0, 0.3, 0.7, 1.0],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 29,
                          top: 100,
                          child: const Text(
                            'Hallo Kelompok 3!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 11,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Poppins-Bold',
                              fontWeight:
                                  FontWeight.bold, // Set fontWeight to bold
                            ),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          left: 360,
                          width: 23,
                          top: 90,
                          height: 23,
                          child: Image.asset(
                            'images/image_2641758.png',
                            width: 23,
                            height: 23,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 29,
              width: 1580,
              top: 108,
              height: 32,
              child: Text(
                "Today's Promo",
                textAlign: TextAlign.left,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Color(0xffcd0000),
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.bold),
                maxLines: 9999,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              left: 13,
              width: 390,
              top: 361,
              height: 39,
              child: Stack(
                children: [
                  // Container dengan box shadow di belakang
                  Container(
                    width: 390,
                    height: 39,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(59, 0, 0, 0),
                          offset: Offset(0, 4),
                          blurRadius: 28.7,
                        ),
                      ],
                    ),
                  ),
                  // Box decoration baru berwarna putih di atas
                  Container(
                    width: 390,
                    height: 39,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 239, 239, 239)
                          .withOpacity(1), // Warna putih dengan opasitas 100%
                      borderRadius: BorderRadius.circular(
                          5000), // Tambahkan border radius jika diinginkan
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: -10,
                          width: 422,
                          top: 0,
                          height: 39,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 4, right: 0, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Coffee button
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/Coffee');
                                  },
                                  child: Container(
                                    width: 83,
                                    height: 32.5,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: const Text(
                                      'Coffee',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                                // Non Coffee button
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(context,
                                        '/nonCoffee'); // Ganti dengan nama rute yang sesuai
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 32.5,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: const Text(
                                      'Non Coffee',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                        color: Color(0xff000000),
                                        fontFamily: 'Poppins-Bold',
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                                // Snack button
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 105,
                                    height: 32.5,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 253, 253, 253),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(19, 0, 0, 0),
                                          offset: Offset(0, 2),
                                          blurRadius: 16,
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: const Text(
                                      'Snack',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 17,
                                        color: Color(0xffb19470),
                                        fontFamily: 'Poppins-Bold',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
