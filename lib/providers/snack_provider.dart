import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  void navigateToNonCoffeePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/snack_page');
    Navigator.pushReplacementNamed(context, '/Profile_read');
    Navigator.pushReplacementNamed(context, '/home');

  }
}
