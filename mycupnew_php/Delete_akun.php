<?php
// Koneksi ke Database
$conn = new mysqli("localhost", "root", "", "dbmy_cup");

// Cek koneksi
if ($conn->connect_error) {
    die(json_encode(["success" => false, "error" => "Connection failed: " . $conn->connect_error]));
}

// Ambil data JSON dari Flutter
$data = json_decode(file_get_contents("php://input"), true);

// Validasi Input
$user_id = $data['UserID'] ?? '';

if (empty($user_id)) {
    echo json_encode(["success" => false, "error" => "UserID is required"]);
    exit;
}

// Query untuk menghapus akun berdasarkan UserID
$stmt = $conn->prepare("DELETE FROM tbuser WHERE UserID = ?");
if (!$stmt) {
    echo json_encode(["success" => false, "error" => "Statement preparation failed: " . $conn->error]);
    exit;
}

$stmt->bind_param("i", $user_id);

if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        echo json_encode(["success" => true, "message" => "Account deleted successfully"]);
    } else {
        echo json_encode(["success" => false, "error" => "Account not found"]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Deletion failed: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
