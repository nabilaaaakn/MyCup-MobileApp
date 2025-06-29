// ignore_for_file: avoid_unnecessary_containers, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'dart:math';

String generateTransactionId(int length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}

class BuktiPesanan extends StatefulWidget {
  const BuktiPesanan({super.key});

  @override
  State<StatefulWidget> createState() => _CodiaPage();
}

class _CodiaPage extends State<BuktiPesanan> {
  @override
  Widget build(BuildContext context) {
    String getFormattedDate() {
      return DateFormat('dd MMMM yyyy').format(DateTime.now());
    }

    String getFormattedTime() {
      return DateFormat('hh:mm a').format(DateTime.now());
    }

    return Container(
      color: Colors.white,
      child: Container(
        height: 812,
        decoration: BoxDecoration(
          color: const Color(0xfff8fae5),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              right: 20,
              top: 153,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffefebe9), width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 45, right: 0, bottom: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Thank you!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                color: const Color(0xff3c3c3c),
                                fontFamily: 'Poppins-Bold',
                                fontWeight: FontWeight.bold),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your transaction was successful',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                color: const Color(0xff555555),
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 334,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 0, right: 8, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            top: 4,
                                            right: 0,
                                            bottom: 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ID Transaction',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff3c3c3c),
                                                  fontFamily: 'Poppins-Medium',
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 9999,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(width: 1),
                                            Text(
                                              'D123456789ABC',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff555555),
                                                  fontFamily: 'Poppins-Regular',
                                                  fontWeight:
                                                      FontWeight.normal),
                                              maxLines: 9999,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                'Date',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff3c3c3c),
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 9999,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 41),
                                          Expanded(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                getFormattedDate(),
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff555555),
                                                    fontFamily:
                                                        'Poppins-Regular',
                                                    fontWeight:
                                                        FontWeight.normal),
                                                maxLines: 9999,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 122,
                                            child: Text(
                                              'Time',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff3c3c3c),
                                                  fontFamily: 'Poppins-Medium',
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 9999,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(width: 41),
                                          Expanded(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                getFormattedTime(),
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff555555),
                                                    fontFamily:
                                                        'Poppins-Regular',
                                                    fontWeight:
                                                        FontWeight.normal),
                                                maxLines: 9999,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 335,
                        height: 1,
                        decoration: BoxDecoration(
                          color: const Color(0xffefebe9),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 334,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 0, right: 8, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 122,
                                child: Text(
                                  'Item',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      color: const Color(0xff3c3c3c),
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.bold),
                                  maxLines: 9999,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 227,
                                                        child: Text(
                                                          'Brown Sugar Coffee',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xff3c3c3c),
                                                              fontFamily:
                                                                  'Poppins-Medium',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          maxLines: 9999,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 18,
                                                          child: Text(
                                                            'x1',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize: 14,
                                                                color: const Color(
                                                                    0xff3c3c3c),
                                                                fontFamily:
                                                                    'Poppins-Medium',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                            maxLines: 9999,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    'Cold, Regular, Normal Sugar.',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 12,
                                                        color: const Color(
                                                            0xff555555),
                                                        fontFamily:
                                                            'Poppins-Regular',
                                                        fontWeight:
                                                            FontWeight.normal),
                                                    maxLines: 9999,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 334,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 0, right: 8, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 179,
                                child: Text(
                                  'Payment Summary',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 14,
                                      color: const Color(0xff3c3c3c),
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.bold),
                                  maxLines: 9999,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 79,
                                                        child: Text(
                                                          'Price',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xff555555),
                                                              fontFamily:
                                                                  'Poppins-Regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          maxLines: 9999,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 77,
                                                        child: Text(
                                                          'Rp25.000',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xff555555),
                                                              fontFamily:
                                                                  'Poppins-Regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          maxLines: 9999,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 40,
                                                        child: Text(
                                                          'Total',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xff3c3c3c),
                                                              fontFamily:
                                                                  'Poppins-Medium',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          maxLines: 9999,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width: 138),
                                                      Expanded(
                                                        child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Text(
                                                            'Rp25.000',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize: 14,
                                                                color: const Color(
                                                                    0xff3c3c3c),
                                                                fontFamily:
                                                                    'Poppins-Medium',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            maxLines: 9999,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 18,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 179,
                                      child: Text(
                                        'Payment Method',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 14,
                                            color: const Color(0xff3c3c3c),
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.normal),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 20,
                                        child: Text(
                                          'BCA',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              color: const Color(0xff555555),
                                              fontFamily: 'Poppins-Regular',
                                              fontWeight: FontWeight.normal),
                                          maxLines: 9999,
                                          overflow: TextOverflow.ellipsis,
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
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 18,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 179,
                                      child: Text(
                                        'Taking Pick Up',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 14,
                                            color: const Color(0xff3c3c3c),
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.normal),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 20,
                                        child: Text(
                                          '05.20 PM',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              color: const Color(0xff555555),
                                              fontFamily: 'Poppins-Regular',
                                              fontWeight: FontWeight.normal),
                                          maxLines: 9999,
                                          overflow: TextOverflow.ellipsis,
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 165,
              width: 75,
              top: 115,
              height: 75,
              child: Image.asset(
                'images/image_22807891.png',
                width: 75,
                height: 75,
              ),
            ),
            Positioned(
              left: 130,
              width: 159,
              top: 670,
              height: 48,
              child: Container(
                width: 159,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xff43766c),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, top: 12, right: 24, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Order Again',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                color: const Color(0xfffefefe),
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              width: 60,
              top: 47,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 24,
                    top: 0,
                    height: 24,
                    child: Image.asset(
                      'images/image_22807899.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Positioned(
                    left: 28,
                    width: 39,
                    top: 5,
                    child: Text(
                      'Back',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 13,
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
          ],
        ),
      ),
    );
  }
}
