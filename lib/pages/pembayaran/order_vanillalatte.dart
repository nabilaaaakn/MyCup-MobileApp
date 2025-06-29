import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/order.dart';
import 'package:mycup_flutter/providers/order_model.dart';
import 'package:provider/provider.dart';

class OrderVanilla extends StatefulWidget {
  const OrderVanilla({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrderVanilla createState() => _OrderVanilla();
}

class _OrderVanilla extends State<OrderVanilla> {
  bool isCHovered = false;
  bool isHHovered = false;
  bool isMSelected = false;
  bool isLSelected = false;
  bool isSSelected = true;
  bool isHSelected = false;
  bool isCSelected = true;
  bool isNSelected = true;
  bool isLessSelected = false;
  bool isVanillaSelected = true;

  void _onCHover(bool isHovered) {
    setState(() {
      isCHovered = isHovered;
    });
  }

  void _onHHover(bool isHovered) {
    setState(() {
      isHHovered = isHovered;
    });
  }

  void _onPriceSelect() {
    setState(() {
      // Toggle price selection
    });
  }

  void _onNSelect() {
    setState(() {
      isNSelected = !isNSelected;
      isLessSelected = false;
    });
  }

  void _onLessSelect() {
    setState(() {
      isLessSelected = !isLessSelected;
      isNSelected = false;
    });
  }

  void _onHSelect() {
    setState(() {
      isHSelected = !isHSelected;
      isCSelected = false;
    });
  }

  void _onCSelect() {
    setState(() {
      isCSelected = !isCSelected;
      isHSelected = false;
    });
  }

  void _onMSelect() {
    setState(() {
      isMSelected = !isMSelected;
      isLSelected = false;
      isSSelected = false;
    });
  }

  void _onLSelect() {
    setState(() {
      isLSelected = !isLSelected;
      isMSelected = false;
      isSSelected = false;
    });
  }

  void _onSSelect() {
    setState(() {
      isSSelected = !isSSelected;
      isMSelected = false;
      isLSelected = false;
    });
  }

  void _onVanillaSelect() {
    setState(() {
      isVanillaSelected = !isVanillaSelected;
    });
  }

  void _saveOrder() {
    final order = Order(
      productImage: 'images/Vanila_late.png',
      price: 25000,
      productName: 'Vanilla Latte',
      temperature: isCSelected ? 'Cold' : 'Hot',
      size: isSSelected
          ? 'S'
          : isMSelected
              ? 'M'
              : 'L',
      sugarLevel: isNSelected
          ? 'Normal'
          : isLessSelected
              ? 'Less Sugar'
              : 'None',
      productId: '8',
    );

    Provider.of<OrderProvider>(context, listen: false).addOrder(order);
    Navigator.pushNamed(context, '/keranjang');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 660,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF8FAE5)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 560,
                child: Container(
                  width: 500,
                  height: 97,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0x00979797), Color(0xFF313131)],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 600,
                child: Container(
                  width: 500,
                  height: 60,
                  decoration: BoxDecoration(color: Color(0xFF76453B)),
                ),
              ),
              Positioned(
                left: 187,
                top: 72,
                child: SizedBox(
                  width: 200,
                  child: Text(
                    'Vanilla\nLatte',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.04,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 187,
                top: 153,
                child: GestureDetector(
                  onTap: _onPriceSelect,
                  child: SizedBox(
                    width: 100,
                    child: Text(
                      'Rp 28.000',
                      style: TextStyle(
                        color: Color(0xFFAC0C0C),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.79,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 187,
                top: 130,
                child: SizedBox(
                  width: 172,
                  child: Text(
                    'terbuat dari espresso, susu, dan sirup vanilla.',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 175,
                top: 20,
                width: 50,
                height: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFAC0D0D),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
              Positioned(
                left: 187,
                top: 125,
                child: Container(
                  width: 172,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 84,
                top: 318,
                child: SizedBox(
                  width: 36,
                  child: Text(
                    'Cold',
                    style: TextStyle(
                      color: Color(0xFF2F2D2C),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.79,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 255,
                left: 40,
                child: SizedBox(
                  width: 340,
                  height: 100,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MouseRegion(
                        onEnter: (_) => _onCHover(true),
                        onExit: (_) => _onCHover(false),
                        child: GestureDetector(
                          onTap: _onCSelect,
                          child: Container(
                            width: 165,
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 58, vertical: 37),
                            decoration: BoxDecoration(
                              color: isCSelected
                                  ? Color(0xFF76453B)
                                  : Color(0xFFF8FAE5),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF76453B)),
                              boxShadow: [
                                BoxShadow(
                                  // ignore: deprecated_member_use
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(4, 4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.6),
                                  offset: Offset(-4, -4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Cold',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isCSelected
                                      ? Colors.white
                                      : Color(0xFF76453B),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.79,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      MouseRegion(
                        onEnter: (_) => _onHHover(true),
                        onExit: (_) => _onHHover(false),
                        child: GestureDetector(
                          onTap: _onHSelect,
                          child: Container(
                            width: 165,
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 58, vertical: 37),
                            decoration: BoxDecoration(
                              color: isHSelected
                                  ? Color(0xFF76453B)
                                  : Color(0xFFF8FAE5),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF76453B)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(4, 4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.6),
                                  offset: Offset(-4, -4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Hot',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isHSelected
                                      ? Colors.white
                                      : Color(0xFF76453B),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.79,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 373,
                width: 10000,
                height: 500,
                child: SizedBox(
                  width: 500,
                  height: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                          color: Color(0xFF2E2D2C),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 325,
                        height: 39,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              width: 105,
                              child: GestureDetector(
                                onTap: _onSSelect,
                                child: Container(
                                  width: 105,
                                  height: 39,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48, vertical: 7),
                                  decoration: BoxDecoration(
                                    color: isSSelected
                                        ? Color(0xFF76453B)
                                        : Color(0xFFF8FAE5),
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Color(0xFF76453B)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(4, 4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.6),
                                        offset: Offset(-4, -4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'S',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isSSelected
                                            ? Colors.white
                                            : Color(0xFF76453B),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 110,
                              top: 0,
                              width: 105,
                              height: 39,
                              child: GestureDetector(
                                onTap: _onMSelect,
                                child: Container(
                                  width: 105,
                                  height: 39,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48, vertical: 7),
                                  decoration: BoxDecoration(
                                    color: isMSelected
                                        ? Color(0xFF76453B)
                                        : Color(0xFFF8FAE5),
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Color(0xFF76453B)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(4, 4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.6),
                                        offset: Offset(-4, -4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'M',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isMSelected
                                            ? Colors.white
                                            : Color(0xFF76453B),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 220,
                              top: 0,
                              child: GestureDetector(
                                onTap: _onLSelect,
                                child: Container(
                                  width: 105,
                                  height: 39,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 48, vertical: 7),
                                  decoration: BoxDecoration(
                                    color: isLSelected
                                        ? Color(0xFF76453B)
                                        : Color(0xFFF8FAE5),
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Color(0xFF76453B)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(4, 4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.6),
                                        offset: Offset(-4, -4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'L',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isLSelected
                                            ? Colors.white
                                            : Color(0xFF76453B),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
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
              ),
              Positioned(
                left: 40,
                top: 450,
                child: SizedBox(
                  width: 350,
                  height: 500,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sugar Level',
                        style: TextStyle(
                          color: Color(0xFF2E2D2C),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              width: 165,
                              height: 100,
                              child: GestureDetector(
                                onTap: _onNSelect,
                                child: Container(
                                  width: 130,
                                  height: 100,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 7),
                                  decoration: BoxDecoration(
                                    color: isNSelected
                                        ? Color(0xFF76453B)
                                        : Color(0xFFF8FAE5),
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Color(0xFF76453B)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(4, 4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.6),
                                        offset: Offset(-4, -4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Normal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isNSelected
                                            ? Colors.white
                                            : Color(0xFF76453B),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 175,
                              top: 0,
                              width: 165,
                              height: 100,
                              child: GestureDetector(
                                onTap: _onLessSelect,
                                child: Container(
                                  width: 165,
                                  height: 100,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: isLessSelected
                                        ? Color(0xFF76453B)
                                        : Color(0xFFF8FAE5),
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Color(0xFF76453B)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(4, 4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.6),
                                        offset: Offset(-4, -4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Less Sugar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isLessSelected
                                            ? Colors.white
                                            : Color(0xFF76453B),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
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
              ),
              Positioned(
                left: 30,
                top: 72,
                child: SizedBox(
                  width: 155,
                  height: 154,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: _onVanillaSelect,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/Vanila_late.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 608,
                child: GestureDetector(
                  onTap: _saveOrder,
                  child: Container(
                    width: 350,
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
                              color: Color(0xFFAC0C0C),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Center(
                              child: Text(
                                '+ Cart',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.43,
                                  letterSpacing: 0.10,
                                ),
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
