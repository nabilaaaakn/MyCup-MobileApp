<?php
// Koneksi ke Database
$conn = new mysqli("localhost", "root", "", "dbmy_cup");

// Cek koneksi
if ($conn->connect_error) {
    die(json_encode(["success" => false, "error" => "Connection failed: " . $conn->connect_error]));
}

// Ambil data JSON dari Flutter
$data = json_decode(file_get_contents("php://input"), true);

// Validasi input
$email = trim($data['email'] ?? '');

if (empty($email)) {
    echo json_encode(["success" => false, "error" => "Email is required"]);
    exit;
}

// Query untuk memperbarui status login
$stmt = $conn->prepare("UPDATE tbuser SET is_logged_in = 1 WHERE LOWER(Email) = LOWER(?)");
if (!$stmt) {
    echo json_encode(["success" => false, "error" => "Statement preparation failed: " . $conn->error]);
    exit;
}

// Bind parameter dan eksekusi query
$stmt->bind_param("s", $email);
$stmt->execute();

// Cek apakah ada baris yang terpengaruh
if ($stmt->affected_rows > 0) {
    echo json_encode(["success" => true, "message" => "User login status updated successfully"]);
} else {
    echo json_encode(["success" => false, "error" => "Email not found or login status already active"]);
}

// Tutup statement dan koneksi
$stmt->close();
$conn->close();
?>
