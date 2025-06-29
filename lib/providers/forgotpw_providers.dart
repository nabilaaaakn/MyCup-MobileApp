import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final String validEmail = 'kelompok3@gmail.com';

  // Handle forgot password process
  Future<void> resetPassword(String email, BuildContext context) async {
    if (email != validEmail) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Reset Password Gagal"),
          content: const Text("Email tidak ditemukan"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Reset Password"),
        content:
            const Text("Instruksi reset password telah dikirim ke email Anda."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Go back to Login Page
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
