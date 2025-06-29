import 'package:flutter/material.dart';
import 'package:mycup_flutter/pages/pembayaran/metodepembyaran.dart';
import 'package:mycup_flutter/pages/pembayaran/yakin.dart';

class totalpembayaran extends StatelessWidget {
  const totalpembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 500,
          height: 112.5,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 500,
                  height: 115,
                  decoration: BoxDecoration(color: Color(0xFFAC0D0D)),
                ),
              ),
              Positioned(
                left: 14,
                top: 0,
                child: SizedBox(
                  width: 100,
                  height: 71.79,
                  child: Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 4,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.2, 0.5), // Posisi di tengah bawah
                child: GestureDetector(
                  onTap: () {
                    // Tampilkan BottomSheet saat widget diklik
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Agar ukuran dapat disesuaikan
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16)), // Sudut melengkung
                      ),
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor:
                              0.2727, // Tinggi BottomSheet 50% dari layar
                          child:
                              OrderNow(), // Ganti dengan widget halaman berikutnya
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 395,
                    height: 46,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Order Now',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF979797),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            height: 1.67,
                                            letterSpacing: 0.10,
                                          ),
                                        ),
                                      ],
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
                ),
              ),
              Positioned(
                left: 14,
                top: 14.33,
                child: SizedBox(
                  width: 100,
                  height: 71.79,
                  child: Text(
                    'Rp 18.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 2.50,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15, // Posisikan di atas box dekorasi merah
                right: 20, // Posisikan di pojok kanan atas
                child: GestureDetector(
                  onTap: () {
                    // Menutup halaman saat ini dan kembali ke halaman sebelumnya

                    // Menampilkan BottomSheet
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Agar ukuran dapat disesuaikan
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16)), // Sudut melengkung
                      ),
                      builder: (context) {
                        return FractionallySizedBox(
                          heightFactor:
                              0.27, // Atur tinggi dialog menjadi 27% dari layar
                          child:
                              MetodePembayaran(), // Gunakan widget Anda di sini
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFAC0D0D), // Warna latar belakang putih
                      borderRadius:
                          BorderRadius.circular(5), // Radius sudut kotak
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10), // Jarak di dalam kotak
                    child: Row(
                      children: [
                        // Titik pertama
                        CircleAvatar(
                          radius: 2, // Ukuran titik
                          backgroundColor: const Color.fromARGB(
                              255, 255, 255, 255), // Warna titik
                        ),
                        SizedBox(width: 5), // Jarak antar titik
                        // Titik kedua
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: const Color.fromARGB(
                              255, 255, 255, 255), // Warna titik
                        ),
                        SizedBox(width: 5),
                        // Titik ketiga
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: const Color.fromARGB(
                              255, 255, 255, 255), // Warna titik
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
