import 'package:flutter/material.dart';

class Product {
  final String productImage; // Product image path
  final String productName; // Product name
  final int quantity; // Quantity of the product
  final double price; // Price of the product

  Product({
    required this.productImage,
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void setProducts(List<Product> products) {
    _products = products;
    notifyListeners();
  }

  double get totalPrice {
    return _products.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
