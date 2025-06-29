// ignore_for_file: unused_element, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycup_flutter/models/signup_model.dart';

class LoginProvider extends ChangeNotifier {
  final String _baseUrl = 'http://192.168.100.5/new_php/'; // URL backend
  List<UserModel> _users = [];
  bool isLoading = false;

  List<UserModel> get users => _users;

  get userName => null;

  // Mendapatkan data pengguna dari database
  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Read_login.php'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        _users = data.map((map) => UserModel.fromJson(map)).toList();
        notifyListeners();
      } else {
        log('Error fetching users: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching users: $e');
    }
  }

  // Logika Sign In yang hanya mengambil data dari database tanpa validasi
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    isLoading = true;
    notifyListeners(); // Memberitahukan listener untuk memperbarui UI (menampilkan loading)

    await fetchUsers(); // Mengambil data pengguna dari server

    // Menampilkan data pengguna yang ada setelah fetch
    log('Data pengguna: $_users');

    // Lanjutkan ke halaman utama setelah mengambil data pengguna
    Navigator.pushReplacementNamed(context, '/home');

    isLoading = false;
    notifyListeners(); // Memberitahukan listener untuk memperbarui UI (menyembunyikan loading)
  }

  // Menampilkan dialog error jika diperlukan
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Gagal"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
