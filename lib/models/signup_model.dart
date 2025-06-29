class UserModel {
  final int idUser; // ID unik pengguna
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final bool isLoggedIn;

  UserModel({
    required this.idUser,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.isLoggedIn,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['Id_user'] as int, // Pastikan tipe data sesuai
      name: json['Name'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['Phone_number'] ?? '',
      password: json['Password'] ?? '',
      isLoggedIn: (json['is_logged_in'] ?? 0) == 1, // Konversi ke boolean
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id_user': idUser,
      'Name': name,
      'Email': email,
      'Phone_number': phoneNumber,
      'Password': password,
      'is_logged_in': isLoggedIn ? 1 : 0, // Konversi ke integer
    };
  }
}
