import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycup_flutter/providers/welcome_provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeProvider =
        Provider.of<WelcomeProvider>(context, listen: false);

    // Mulai Countdown ketika halaman dirender
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (welcomeProvider.countdown == 10) {
        welcomeProvider.startCountdown(context);
      }
    });

    var withOpacity = const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(69, 115, 115, 115),
        ),
        child: Stack(
          children: [
            // Background image
            Positioned(
              left: -36,
              width: 485,
              top: 0,
              height: 900,
              child: Image.asset(
                'images/background.png',
                fit: BoxFit.cover,
              ),
            ),

            // Decorative Image 1
            Positioned(
              left: -335,
              width: 755.838,
              top: -290,
              height: 758.358,
              child: Image.asset(
                'images/image2_263.png',
              ),
            ),
            // "Hello!" Text
            Positioned(
              left: 130,
              top: 240,
              child: Text(
                'HELLO!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Poppins-Bold',
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: const Offset(6.0, 4.0),
                      blurRadius: 3.0,
                      color: withOpacity, // Black shadow with opacity
                    ),
                  ],
                ),
              ),
            ),
            // Welcome Text
            Positioned(
              left: 59,
              top: 305,
              child: Text(
                'WELCOME TO\nMY CUP!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 50,
                  color: const Color(0xfff8fae5),
                  fontFamily: 'Poppins-Bold',
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: const Offset(6.0, 4.0),
                      blurRadius: 3.0,
                      color: withOpacity,
                    ),
                  ],
                ),
              ),
            ),
            // Decorative Images
            Positioned(
              left: 36.514,
              width: 146.489,
              top: 810.23,
              height: 39.551,
              child: Image.asset(
                'images/image5_2793189.png',
              ),
            ),
            Positioned(
              left: 100.936,
              width: 120.645,
              top: 810.432,
              height: 51.146,
              child: Image.asset(
                'images/image6_2793191.png',
              ),
            ),
            Positioned(
              left: -90,
              width: 380.605,
              top: 740,
              height: 187.979,
              child: Image.asset(
                'images/bijikopi.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: -47,
              width: 250.52,
              top: 450.239,
              height: 400.139,
              child: Image.asset(
                'images/chocofloat.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 95.762,
              width: 210.168,
              top: 597.522,
              height: 261.941,
              child: Image.asset(
                'images/americano.png',
                fit: BoxFit.fill,
              ),
            ),

            // Countdown Display
            Positioned(
              bottom: 39,
              left: 190,
              right: 0,
              child: Consumer<WelcomeProvider>(
                builder: (context, provider, _) => Text(
                  '${provider.countdown}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ),
            ),

            // Next Button
            Positioned(
              left: MediaQuery.of(context).size.width - 85,
              top: MediaQuery.of(context).size.height - 70,
              child: GestureDetector(
                onTap: () {
                  welcomeProvider.kedalamLogin(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(61, 249, 172, 49),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xfff2f2f2),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'images/next.png',
                          width: 16,
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Logo
            Positioned(
              left: 21,
              width: 45,
              top: 70,
              height: 45,
              child: Image.asset(
                'images/logowelcome.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
