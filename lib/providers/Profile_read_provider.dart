import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycup_flutter/models/signup_model.dart'; // Pastikan path model sudah sesuai

class ProfileProvider with ChangeNotifier {
  final String _baseUrl = 'http://192.168.16.13/new_php/'; // URL backend Anda

  // Objek UserModel untuk menyimpan data pengguna
  UserModel? _user;

  // Getter untuk UserModel
  UserModel? get user => _user;

  // Status loading untuk UI
  bool isLoading = false;
  String? errorMessage; // Variabel untuk menyimpan pesan error

  // Fungsi untuk mengambil data profil pengguna dari database
  Future<void> fetchProfile(String email) async {
    isLoading = true; // Mulai loading
    errorMessage = null; // Reset error message
    notifyListeners();

    try {
      // Kirim permintaan POST ke backend
      final response = await http.post(
        Uri.parse('$_baseUrl/Read_Profile.php'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}), // Kirim email sebagai parameter
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['success']) {
          // Parsing data ke UserModel
          _user = UserModel.fromJson(data['data']);
        } else {
          errorMessage = data['error']; // Tangani error dari server
        }
      } else {
        errorMessage = 'Failed to load profile data: ${response.statusCode}';
      }
    } catch (error) {
      errorMessage = 'Error fetching profile: $error';
    }

    isLoading = false; // Selesai loading
    notifyListeners();
  }

  // Fungsi untuk mengambil detail profil secara spesifik
  String get name => _user?.name ?? 'Loading Name...';
  String get email => _user?.email ?? 'Loading Email...';
  String get phoneNumber => _user?.phoneNumber ?? 'Loading Phone...';
  String get password =>
      _user?.password ?? '********'; // Jangan tampilkan password asli
}
