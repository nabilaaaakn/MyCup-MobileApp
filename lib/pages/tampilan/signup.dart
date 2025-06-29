import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/signup_provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  final SignupController _controller = SignupController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 420,
        height: 870,
        decoration: BoxDecoration(
          color: Color(0xfff8fae5),
        ),
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              width: 375,
              top: 0,
              height: 200,
              child: Stack(
                children: <Widget>[],
              ),
            ),
            Positioned(
              left: 50,
              width: 380,
              top: 80,
              height: 200,
              child: Stack(
                children: [
                  Text(
                    "Don't have an account?\nCreate now!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 40,
                      fontFamily: 'Inter-ExtraBold',
                      fontWeight: FontWeight.normal,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.0
                        ..color = Colors.black, // Warna garis luar
                    ),
                  ),
                  Text(
                    "Don't have an account?\nCreate now!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 40,
                      color: Color(0xff76453b),
                      fontFamily: 'Inter-ExtraBold',
                      fontWeight: FontWeight.normal,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          color: Color(0xFF000000).withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 45,
              width: 312,
              top: 290,
              height: 480,
              child: _buildForm(),
            ),
            Positioned(
              left: 60,
              width: 280,
              top: 665,
              height: 32,
              child: GestureDetector(
                onTap: () async {
                  await _controller.signup(context);
                },
                child: Container(
                  width: 269,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xff43766c),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 60,
              width: 62,
              top: 720,
              child: GestureDetector(
                onTap: () {
                  _controller.navigateToLogin(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffcd0000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      width: 312,
      height: 470,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        border: Border.all(color: const Color(0x7f000000), width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextField(
              controller: _controller.fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextField(
              controller: _controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextField(
              controller: _controller.phoneController,
              decoration: InputDecoration(
                labelText: 'No. Telephone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextField(
              controller: _controller.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              obscureText: true,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: TextField(
              controller: _controller.confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}
