// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mycup_flutter/providers/Profile_edit_provider.dart';
import 'package:provider/provider.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ProfileEditForm(),
    );
  }
}

class ProfileEditForm extends StatefulWidget {
  const ProfileEditForm({super.key});

  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _buildPositioned({
    required double left,
    required double top,
    required Widget child,
  }) {
    return Positioned(left: left, top: top, child: child);
  }

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
      radius: 75,
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

  // Fungsi untuk membuat tombol save dengan padding dan ujung runcing
  Widget _buildSaveButton({
    required String text,
    required Color color,
    required BorderRadius borderRadius,
    required double width,
    required double height,
    required EdgeInsetsGeometry padding,
  }) {
    return Padding(
      padding: padding, // Tambahkan padding di sekitar tombol
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: () async {
            // Ambil instance ProfileProvider
            final profileProvider =
                Provider.of<ProfileProvider>(context, listen: false);

            // Tampilkan pop-up berdasarkan hasil saveProfile
            final success = await profileProvider.saveProfile();

            if (success) {
              // Tampilkan pop-up berhasil
              _showPopup();
            } else {
              // Tampilkan pop-up gagal
              _showPopup();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius, // Bentuk tombol runcing
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }

  void _showPopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFCD0000),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Pusatkan ke tengah
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Pusatkan ke horizontal
                children: [
                  // Lingkaran dengan jarak yang dapat diatur
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center, // Ikon centang di tengah
                      child: Padding(
                        padding: const EdgeInsets.all(
                            0), // Jarak ikon centang dari lingkaran
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 50, // Ukuran ikon lebih besar
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Jarak antara lingkaran dan teks
                  // Pesan teks
                  const Text(
                    "Your personal info’s all set—updated and looking sharp!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF8FAE5)),
      child: Stack(
        children: [
          // Lingkaran Avatar dengan huruf pertama dari nama
          _buildPositioned(
            left: 135,
            top: 110,
            child: _buildAvatar('zriel Ramadhan'),
          ),
          // Header dengan judul dan tombol kembali
          _buildPositioned(
            left: 37,
            top: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Profile_read');
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                  _buildText(
                    text: 'Edit Profile',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Input Fields
          _buildPositioned(
            left: 37,
            top: 300,
            child: _buildInputField('Name', _nameController),
          ),
          _buildPositioned(
            left: 37,
            top: 385,
            child: _buildInputField('Email', _emailController),
          ),
          _buildPositioned(
            left: 37,
            top: 470,
            child: _buildInputField('Phone Numbers', _phoneController),
          ),
          _buildPositioned(
            left: 37,
            top: 556,
            child: _buildInputField('Password', _passwordController,
                obscure: true),
          ),
          // Save Button dengan padding dan ujung runcing
          _buildPositioned(
            left: 115,
            top: 700,
            child: _buildSaveButton(
              text: 'Save', // Teks tombol
              color: const Color(0xFFCD0000),
              borderRadius: BorderRadius.zero, // Ujung tombol runcing
              width: 140, // Lebar tombol
              height: 35, // Tinggi tombol
              padding:
                  const EdgeInsets.symmetric(horizontal: 20), // Padding tombol
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: 330,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFD1D5DB),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your $label',
              contentPadding: const EdgeInsets.symmetric(horizontal: 13),
            ),
          ),
        ),
      ],
    );
  }
}
