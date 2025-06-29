import 'dart:async';
import 'package:flutter/material.dart';

class WelcomeProvider with ChangeNotifier {
  int _countdown = 10;
  Timer? _timer;

  int get countdown => _countdown;

  /// Start Countdown Timer
  void startCountdown(BuildContext context) {
    _countdown = 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        notifyListeners(); // Update UI
      } else {
        _timer?.cancel();
        kedalamLogin(context);
      }
    });
  }

  /// Stop Countdown Timer
  void stopCountdown() {
    _timer?.cancel();
  }

  /// Navigasi ke Halaman Utama
  void kedalamLogin(BuildContext context) {
    stopCountdown(); // Hentikan timer
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void dispose() {
    stopCountdown();
    super.dispose();
  }
}
