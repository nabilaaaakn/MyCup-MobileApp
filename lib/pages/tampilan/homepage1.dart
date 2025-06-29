// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mycup_flutter/pages/pembayaran/keranjang.dart';
import 'package:mycup_flutter/pages/pembayaran/oder_choco.dart';
import 'package:mycup_flutter/pages/pembayaran/order_Lemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _CodiaPage();
}

class _CodiaPage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfff8fae5),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              width: 500,
              top: -20,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 500,
                    top: -20,
                    height: 150,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          width: 500,
                          top: -20,
                          height: 150,
                          child: Container(
                            width: 500,
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
                          // ignore: avoid_unnecessary_containers
                          child: Container(
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
                        ),
                        Positioned(
                          left: 360,
                          width: 23,
                          top: 90,
                          height: 23,
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
                                        1, // Atur tinggi dialog sesuai kebutuhan
                                    child:
                                        Keranjang(), // Ganti dengan widget halaman lain yang ingin ditampilkan
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              'images/image_2521549.png',
                              width: 23,
                              height: 23,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 5,
              width: 400,
              top: 250,
              height: 510,
              child: Container(
                width: 400, // Mengatur lebar total
                height: 400, // Mengatur tinggi total
                decoration: const BoxDecoration(
                  color: Color(0xfff6f8e3),
                ),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.vertical, // Mengatur scroll ke arah vertikal
                  child: Column(
                    children: [
                      // Row untuk dua item pertama
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Item 1: Ice Chocolate
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
                                          OrderChoco(), // Ganti dengan widget halaman lain yang ingin ditampilkan
                                    );
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/image_2551607.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: const Text(
                                      'Ice Chocolate',
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
                                  const Text(
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
                                ],
                              ),
                            ),
                          ),
                          // Item 2: Lemon Tea
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
                                          OrderLemon(), // Ganti dengan widget halaman lain yang ingin ditampilkan
                                    );
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'images/image_2641650.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
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
                                  const Text(
                                    'Rp 22.000',
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
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      // Row untuk item 3 dan 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Item 3: Matcha Latte
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
                                  margin: const EdgeInsets.only(top: 25),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'images/image_2551600.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  child: const Text(
                                    'Matcha Latte',
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
                                const Text(
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
                              ],
                            ),
                          ),
                          // Item 4: Peach Tea
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
                                  margin: const EdgeInsets.only(top: 25),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'images/image_2641659.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  child: const Text(
                                    'Peach Tea',
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
                                const Text(
                                  'Rp 22.000',
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Row untuk item 5 dan 6
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Item 5: Butterscoth Coffee
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
                                  margin: const EdgeInsets.only(top: 25),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'images/image_2551594.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  child: const Text(
                                    'Butterscoth Coffee',
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
                                const Text(
                                  'Rp 28.000',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 9,
                                    color: Color(0xffc90000),
                                    fontFamily: 'Poppins -Bold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          // Item 6: Americano
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
                                  margin: const EdgeInsets.only(top: 25),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'images/image_2521589.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  child: const Text(
                                    'Americano',
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
                                const Text(
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Row untuk item 7 dan 8
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Item 7: Vanilla Latte
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
                                  margin: const EdgeInsets.only(top: 25),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'images/image_2472204.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  child: const Text(
                                    'Vanilla Latte',
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
                                const Text(
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
                              ],
                            ),
                          ),
                          // Item 8: Brown Sugar Coffee
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
                                  margin: const EdgeInsets.only(top: 25),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'images/image_2472185.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 7),
                                  child: const Text(
                                    'Brown Sugar Coffee',
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
                                const Text(
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
                    left: 49,
                    width: 31,
                    top: 19,
                    height: 50,
                    child: Image.asset(
                      'images/image1_2454841.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 25,
                    top: 25,
                    height: 35,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/nonCoffee');
                      },
                      child: Image.asset(
                        'images/image2_2471645.png',
                        width: 25,
                        height: 35,
                      ),
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
                          color: Color(0xFF76453B),
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
                          color: Color(0xffffffff),
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
                    left: 230,
                    width: 40,
                    top: 26,
                    height: 40,
                    child: Image.asset(
                      'images/History.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Positioned(
                    left: 325,
                    width: 30,
                    top: 25,
                    height: 40,
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
              left: 39,
              top: 130,
              width: 338,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    width: 338,
                    height: 119,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/tigakopi.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 11,
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/MyCupLogo.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 21,
                    child: SizedBox(
                      width: 262,
                      height: 45,
                      child: Text(
                        'What coffee \nwould you today?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0.94,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
