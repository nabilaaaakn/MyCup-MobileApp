<?php
// Konfigurasi koneksi database
$conn = new mysqli("localhost", "root", "", "dbmy_cup");

// Periksa koneksi
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Koneksi database gagal: " . $conn->connect_error]));
}

// Ambil data dari request body
$data = json_decode(file_get_contents("php://input"), true);
$idUser = $data['Id_user'];
$isLoggedIn = $data['is_logged_in'];

// Validasi input
if (!isset($idUser) || !isset($isLoggedIn)) {
    echo json_encode(["success" => false, "message" => "Parameter tidak lengkap."]);
    exit();
}

// Persiapkan statement SQL untuk update
$stmt = $conn->prepare("UPDATE users SET is_logged_in = ? WHERE Id_user = ?");
if (!$stmt) {
    echo json_encode(["success" => false, "message" => "Gagal mempersiapkan statement SQL."]);
    exit();
}

// Bind parameter dan eksekusi
$stmt->bind_param("ii", $isLoggedIn, $idUser);
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Status is_logged_in berhasil diperbarui."]);
} else {
    echo json_encode(["success" => false, "message" => "Gagal memperbarui status is_logged_in."]);
}

// Tutup statement dan koneksi
$stmt->close();
$conn->close();
?>
