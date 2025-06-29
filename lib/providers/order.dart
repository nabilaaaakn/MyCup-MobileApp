import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'order_model.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    final existingOrderIndex =
        _orders.indexWhere((o) => o.productId == order.productId);
    if (existingOrderIndex >= 0) {
      _orders[existingOrderIndex].quantity++;
    } else {
      _orders.add(order);
    }
    notifyListeners();
  }

  void increaseQuantity(Order order) {
    final index = _orders.indexOf(order);
    if (index >= 0) {
      _orders[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(BuildContext context, Order order) {
    final index = _orders.indexOf(order);
    if (index >= 0) {
      if (_orders[index].quantity > 1) {
        _orders[index].quantity--;

        notifyListeners();
      } else {
        _showConfirmationDialog(context, order);
      }
    }
  }

  void _showConfirmationDialog(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Remove Item"),
          content:
              Text("Are you sure you want to remove this item from your cart?"),
          actions: [
            TextButton(
              onPressed: () {
                _orders.remove(order);
                Navigator.of(context).pop();
                notifyListeners();
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }

  Future<void> savePaymentData() async {
    final prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> paymentData = _orders.map((order) {
      return {
        'productImage': order.productImage,
        'productName': order.productName,
        'price': order.price,
        'quantity': order.quantity,
        'size': order.size,
        'sugarLevel': order.sugarLevel,
        'temperature': order.temperature,
      };
    }).toList();

    String jsonData = jsonEncode(paymentData);
    await prefs.setString('paymentData', jsonData);
  }

  Future<List<Map<String, dynamic>>> loadPaymentData() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('paymentData');
    if (jsonData != null) {
      List<dynamic> decodedData = jsonDecode(jsonData);
      return List<Map<String, dynamic>>.from(decodedData);
    }
    return [];
  }

  double getTotalPrice() {
    double total = 0.00;
    for (var order in _orders) {
      total += order.price * order.quantity; // Calculate total price directly
    }
    return total;
  }
}
