# MyCup-MobileApp
Mobile coffee ordering app made with Flutter

# MyCup ☕📱

**MyCup** adalah aplikasi mobile berbasis Flutter & Dart yang dikembangkan sebagai bagian dari project mata kuliah **Mobile Programming**.  
Aplikasi ini dirancang untuk mensimulasikan sistem pemesanan di sebuah **kafe atau coffeeshop**, lengkap dengan fitur menu, keranjang, pemesanan, hingga riwayat transaksi.

---

## 🚧 Status Proyek

⏳ Progress saat ini: **±80%**  
Project masih dalam tahap pengembangan dan belum sepenuhnya fungsional, namun sudah dapat digunakan untuk demonstrasi beberapa fitur utama.

---

## 🛠️ Teknologi yang Digunakan

- **Flutter & Dart** – UI dan logika aplikasi
- **PHP** – Backend sederhana untuk koneksi ke database
- **MySQL** – Database penyimpanan data user dan transaksi
- **Laragon** – Local server untuk menjalankan PHP & MySQL

---

## 🔑 Fitur Utama

- **Home Page**  
  Menampilkan daftar **best seller** dari menu yang tersedia.

- **Order Tab**  
  Daftar lengkap menu:
  - Kopi
  - Non-kopi
  - Makanan ringan / Snack
  - Menu promo

- **Cart (Keranjang)**  
  Menampilkan item yang dipilih sebelum checkout.

- **Checkout & Pembayaran**  
  - Simulasi pembayaran (transfer bank)
  - Riwayat transaksi (manual update setelah 5 detik)

- **Authentication**  
  - Sign Up / Login (terhubung ke database MySQL)
  - Forgot Password
  - Edit Profil

---

## 💾 Koneksi Database

Aplikasi menggunakan MySQL sebagai basis data dan PHP sebagai jembatan koneksi.  
Login & Sign Up sudah terhubung ke database, meskipun proses *read* data lanjutan masih dalam pengembangan.

> File PHP disimpan di folder `www` pada Laragon

---

## Menu yang Sudah Bisa Diuji

- **Brown Sugar**
- **Ice Chocolate**
- **Lemon Tea**

> Semua menu tersebut bisa dipilih, dimasukkan ke keranjang, dan diuji hingga tahap pembayaran.

---

## 🧑‍💻 Cara Menjalankan Project

1. **Siapkan Android Emulator**  
   Contoh: Pixel 8a – API 27

2. **Clone Repository**
   ```bash
   git clone https://github.com/username/MyCup.git
   cd MyCup

3. **Install Dependency**  
   ```bash
   flutter pub get
   

4. **Setup Backend & Database**
   - Install Laragon atau web server lokal lainnya
   - Simpan file PHP ke folder www
   - Import database dari file .sql
   - Ganti IP Address di bagian Sign Up / Login provider sesuai jaringan kamu

5. **Run App**

🙋‍♂️ Pengembang
👤 Willy Jonatan - Programmer

👤 Nabila Khairun Nisa - Programmer

👤 Fadel Setiawan - Programmer

👤 Muhammad Azril Saputra - Designer UI/UX

👤 Hafizhah Dea Az Zahrah - Database

👤 Rara Kholillah - Database
Mahasiswa Sistem Informasi – Universitas Bakrie

📌 Catatan
Project ini masih dalam tahap pengembangan dan akan terus disempurnakan.
Terima kasih atas perhatiannya 🙏
