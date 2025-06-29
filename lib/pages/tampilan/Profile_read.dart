import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycup_flutter/providers/Profile_read_provider.dart'; // Sesuaikan dengan path file provider Anda

class Profileread extends StatelessWidget {
  const Profileread({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: Scaffold(
        body: const Profil1(),
      ),
    );
  }
}

class Profil1 extends StatelessWidget {
  const Profil1({super.key});

  // Fungsi untuk membuat widget Positioned
  Widget _buildPositioned({
    required double left,
    required double top,
    required Widget child,
  }) {
    return Positioned(left: left, top: top, child: child);
  }

  // Fungsi untuk membuat widget Text
  Widget _buildText({
    required String text,
    required TextStyle style,
    TextAlign textAlign = TextAlign.center,
  }) {
    return Text(text, style: style, textAlign: textAlign);
  }

  // Fungsi untuk membuat lingkaran avatar
  Widget _buildAvatar(String name) {
    return CircleAvatar(
      radius: 61,
      backgroundColor: Colors.blueGrey[200],
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '',
        style: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    // Gunakan data dari UserModel
    final user = profileProvider.user;
    final name = user?.name ?? 'Loading Name...';
    final email = user?.email ?? 'Loading Email...';
    final phoneNumber = user?.phoneNumber ?? 'Loading Phone...';
    final password = user?.password ?? '********';

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF8FAE5)),
      child: Stack(
        children: [
          // Judul: My Profile
          _buildPositioned(
            left: 37,
            top: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                  _buildText(
                    text: 'My Profile',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins-bold',
                      fontWeight: FontWeight.w700,
                      height: 0.83,
                      letterSpacing: -0.24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tombol Log Out dengan ikon keluar
          _buildPositioned(
            left: 37,
            top: 780,
            child: Row(
              children: [
                const Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Color(0xFFCD0000),
                ),
                _buildText(
                  text: 'Log Out',
                  style: const TextStyle(
                    color: Color(0xFFCD0000),
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1,
                    letterSpacing: -0.24,
                  ),
                ),
              ],
            ),
          ),
          // Lingkaran Avatar dengan huruf pertama dari nama
          _buildPositioned(
            left: 37,
            top: 110,
            child: _buildAvatar(name),
          ),
          // Gambar Nama (dari Provider)
          _buildPositioned(
            left: 175,
            top: 126,
            child: _buildText(
              text: name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 1.25,
                letterSpacing: -0.24,
              ),
            ),
          ),
          // Gambar Email (dari Provider)
          _buildPositioned(
            left: 175,
            top: 145,
            child: _buildText(
              text: email,
              style: const TextStyle(
                color: Color(0xFF979797),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                height: 1.67,
                letterSpacing: -0.24,
              ),
            ),
          ),
          // Tombol Delete Account
          _buildPositioned(
            left: 175,
            top: 180,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Container(
                width: 155,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xFFCD0000),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Delete Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Tombol Edit Profile
          Positioned(
            left: 194,
            width: 21,
            top: 48,
            height: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Profile_edit');
              },
              child: Transform.rotate(
                angle: 18.4, // Rotasi dalam radian
                child: Image.asset(
                  'images/pencil_8450814.png',
                  width: 35,
                  height: 35,
                ),
              ),
            ),
          ),
          // Label Input: Name
          _buildPositioned(
            left: 37,
            top: 271,
            child: _buildText(
              text: 'Name',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
          // TextField untuk Name
          _buildPositioned(
            left: 37,
            top: 295,
            child: Container(
              width: 330,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFD1D5DB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: name,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 11,
                  ),
                ),
              ),
            ),
          ),
          // Label Input: Email
          _buildPositioned(
            left: 37,
            top: 360,
            child: _buildText(
              text: 'Email',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
          // TextField untuk Email
          _buildPositioned(
            left: 37,
            top: 385,
            child: Container(
              width: 330,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFD1D5DB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: email,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 11,
                  ),
                ),
              ),
            ),
          ),
          // Label Input: Phone
          _buildPositioned(
            left: 37,
            top: 446,
            child: _buildText(
              text: 'Phone Numbers',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
          // TextField untuk Phone
          _buildPositioned(
            left: 37,
            top: 470,
            child: Container(
              width: 330,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFD1D5DB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: phoneNumber,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 11,
                  ),
                ),
              ),
            ),
          ),
          // Label Input: Password
          _buildPositioned(
            left: 37,
            top: 533,
            child: _buildText(
              text: 'Password',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
          // TextField untuk Password
          _buildPositioned(
            left: 37,
            top: 556,
            child: Container(
              width: 330,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFD1D5DB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: password,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 11,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
