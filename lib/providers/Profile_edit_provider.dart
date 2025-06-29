import 'dart:convert';
import 'dart:developer'; // Untuk log
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycup_flutter/models/signup_model.dart';

class ProfileProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Base URL API
  final String _baseUrl = "http://192.168.100.6/new_php/";

  Future<bool> updateUser(UserModel user) async {
    try {
      final url = Uri.parse('$_baseUrl/Update_profile.php'); // Gunakan base URL
      log('Sending request to: $url'); // Log URL

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody['success'] == true) {
          log('User updated successfully: ${responseBody['message']}');
          notifyListeners();
          return true;
        } else {
          log('Server error: ${responseBody['error']}');
        }
      } else {
        log('HTTP error: ${response.statusCode}');
      }
      return false;
    } catch (e) {
      log('Exception during updateUser: $e');
      return false;
    }
  }

  Future<bool> saveProfile() async {
    try {
      final user = UserModel(
        idUser: 1, // Contoh ID pengguna, sesuaikan sesuai kebutuhan
        name: nameController.text.trim(), // Trim untuk menghapus spasi ekstra
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        password: passwordController.text.trim(),
        isLoggedIn: true, // Contoh nilai
      );

      log('Saving profile for user: ${user.toJson()}'); // Log data yang dikirim

      final success = await updateUser(user);

      if (success) {
        log('Profile saved successfully.');
      } else {
        log('Failed to save profile.');
      }

      return success;
    } catch (e) {
      log('Exception during saveProfile: $e');
      return false;
    }
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
