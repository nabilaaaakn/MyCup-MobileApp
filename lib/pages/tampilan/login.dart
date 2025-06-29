// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/login_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Repeat animation to create bubble effect

    // Set up the scale animation untuk zoom
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final loginProvider = context.watch<LoginProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfff8fae5),
        ),
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              width: 375,
              top: 0,
              height: 44,
              child: SizedBox(), // Placeholder for status bar
            ),
            // Welcome Text
            Positioned(
              left: 45,
              top: 145,
              child: Text(
                'WELCOME TO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 45,
                  color: const Color(0xff76453b),
                  fontFamily: 'Poppins-Bold',
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 4.0,
                      color: const Color(0xFF000000).withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
            // Animated "MY CUP!" Text (Bubble Effect)
            Positioned(
              left: 50,
              top: 200,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Stack(
                  children: <Widget>[
                    Text(
                      'MY CUP!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 45,
                        fontFamily: 'Poppins-Bold',
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      'MY CUP!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 45,
                        color: const Color(0xff76453b),
                        fontFamily: 'Poppins-Bold',
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: const Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: const Color(0xFF000000).withOpacity(0.8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Input Fields for Email and Password
            Positioned(
              left: 50,
              width: 312,
              top: 290,
              height: 240,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border:
                      Border.all(color: const Color(0x7f000000), width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Email Input
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    // Password Input
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Sign In Button
            Positioned(
              left: 73,
              width: 266,
              top: 440,
              height: 32,
              child: GestureDetector(
                onTap: () {
                  // Trigger sign-in logic from LoginProvider
                  loginProvider.signIn(
                    emailController.text,
                    passwordController.text,
                    context,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff43766c),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: loginProvider.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        ) // Show loading spinner while signing in
                      : const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                ),
              ),
            ),
            // Forgot Password Link
            Positioned(
              left: 75,
              width: 200,
              top: 490,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgotPassword');
                },
                child: Text(
                  'Forgot password?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff1e1e1e),
                  ),
                ),
              ),
            ),
            // Sign Up Link
            Positioned(
              left: 280,
              width: 62,
              top: 490,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                child: const Text(
                  'Sign Up',
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
}
