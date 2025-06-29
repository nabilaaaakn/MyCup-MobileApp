import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycup_flutter/providers/forgotpw_providers.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider = context.watch<ForgotPasswordProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff43766c),
        title: const Text('Forgot Password'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xfff8fae5),
        ),
        child: Stack(
          children: [
            // Reset Password Box
            Positioned(
              left: 45,
              top: 180,
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border.all(color: const Color(0xffd9d9d9), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email Field
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff1e1e1e),
                        fontFamily: 'Inter-Regular',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Cancel Button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff303030),
                              fontFamily: 'Inter-Regular',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Reset Password Button
                        ElevatedButton(
                          onPressed: () {
                            forgotPasswordProvider.resetPassword(
                              emailController.text,
                              context,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff43766c),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xfff5f5f5),
                              fontFamily: 'Inter-Regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Terms and Conditions Text
            Positioned(
              left: 60,
              top: 720,
              width: 303,
              child: const Text(
                'By continuing you are indicating that you agree to the Terms and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xd10f0f0f),
                  fontFamily: 'Poppins-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
