import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/final_providers.dart';

class PaymentProvider with ChangeNotifier {
  String? _selectedBank;
  List<Product> _selectedProducts = [];

  /// Getters
  String? get selectedBank => _selectedBank;
  List<Product> get selectedProducts => _selectedProducts;

  /// Set the selected bank
  void selectBank(String bankName) {
    if (_selectedBank == bankName) {
      _selectedBank = null; // Deselect if same bank is selected again
    } else {
      _selectedBank = bankName; // Select new bank
    }
    notifyListeners();
  }

  /// Save selected products for payment
  void saveDataPayment(List<Product> products) {
    _selectedProducts = products; // Save the selected products
    notifyListeners(); // Notify listeners about the update
  }

  /// Clear selected bank and products (if needed, e.g., on cancellation)
  void clearPaymentData() {
    _selectedBank = null;
    _selectedProducts = [];
    notifyListeners();
  }
}
