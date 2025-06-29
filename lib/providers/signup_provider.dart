import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycup_flutter/models/signup_model.dart';

class UserProvider extends ChangeNotifier {
  final String _baseUrl = 'http://192.168.100.5/new_php/';

  // Menambah pengguna ke database
  Future<void> createUser(
      String name, String email, String phoneNumber, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/Create_tbuser.php'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'Name': name,
          'Email': email,
          'Phone_number': phoneNumber,
          'Password': password,
        }),
      );
      log('Response createUser: ${response.body}');
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['success'] == true) {
          log('User added successfully: ${responseBody['data']}');
        } else {
          log('Error adding user: ${responseBody['message']}');
        }
      } else {
        log('Error adding user: ${response.statusCode}');
      }
    } catch (e) {
      log('Error adding user: $e');
    }
  }
}

class SignupController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final UserProvider _userProvider = UserProvider();

  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void navigateToLogin(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> signup(BuildContext context) async {
    final name = fullNameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = phoneController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // Validasi panjang password
    if (password.length < 6) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Password must be at least 6 characters')),
        );
      }
      return;
    }

    // Validasi kesesuaian password dan confirm password
    if (password != confirmPassword) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Password and Confirm Password do not match')),
        );
      }
      return;
    }

    try {
      await _userProvider.createUser(name, email, phoneNumber, password);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup successful!')),
        );
        navigateToLogin(context);
      }
    } catch (e) {
      log('Error during signup: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup failed. Please try again.')),
        );
      }
    }
  }
}
