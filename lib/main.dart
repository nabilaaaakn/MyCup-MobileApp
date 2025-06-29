import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/tampilan/Profile_read.dart';
import 'pages/tampilan/forgotpw.dart';
import 'pages/tampilan/homepage1.dart';
import 'pages/tampilan/noncoffepage.dart';
import 'pages/tampilan/snack_page.dart';
import 'pages/tampilan/welcome.dart';
import 'pages/tampilan/login.dart';
import 'pages/tampilan/signup.dart';
import 'pages/tampilan/Profile_edit.dart';
import 'providers/Profile_edit_provider.dart';
import 'providers/forgotpw_providers.dart';
import 'providers/welcome_provider.dart';
import 'providers/login_provider.dart';
import 'providers/snack_provider.dart';
import 'providers/noncoffe_provider.dart';
import 'pages/tampilan/Coffee_page.dart';
import 'pages/tampilan/history_wait.dart';

// Import halaman
import 'package:mycup_flutter/pages/pembayaran/metodepembyaran.dart';
import 'package:mycup_flutter/pages/pembayaran/berhasil.dart';
import 'package:mycup_flutter/pages/pembayaran/final.dart';
import 'package:mycup_flutter/pages/pembayaran/keranjang.dart';

import 'package:mycup_flutter/providers/final_providers.dart';
import 'package:mycup_flutter/providers/order.dart';
import 'providers/metode_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WelcomeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: const WelcomePage(),
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const HomePage(),
          '/signup': (context) => const Signup(),
          '/nonCoffee': (context) => const nonCoffeePage(),
          '/Profile_read': (context) => const Profileread(),
          '/Profile_edit': (context) => const ProfileEdit(),
          '/snack_page': (context) => const SnackPage(),
          '/Coffee': (context) => const CoffeePage(),
          '/forgotPassword': (context) => const ForgotPasswordPage(),
          '/keranjang': (context) => Keranjang(),
          '/metode': (context) => MetodePembayaran(),
          '/pembayaran': (context) => _buildPembayaranPage(context),
          '/berhasil': (context) => OrderBerhasil(),
          '/history_wait': (context) => const HistoryWait(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Page not found'),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Fungsi untuk membangun halaman pembayaran
  Widget _buildPembayaranPage(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);

    if (orderProvider.orders.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pembayaran'),
          backgroundColor: const Color(0xFFAC0D0D),
        ),
        body: const Center(
          child: Text(
            'Tidak ada item dalam keranjang',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    final products = orderProvider.orders
        .map((order) => Product(
              productImage: order.productImage,
              productName: order.productName,
              quantity: order.quantity,
              price: order.price,
            ))
        .toList();

    return PagePembayaran(
      selectedBank: paymentProvider.selectedBank,
      products: products,
    );
  }
}
