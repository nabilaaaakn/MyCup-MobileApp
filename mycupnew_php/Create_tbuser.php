<?php
header("Content-Type: application/json");

// Koneksi ke Basis Data
$conn = new mysqli("localhost", "root", "", "dbmy_cup");

// Mengecek Koneksi
if ($conn->connect_error) {
    die(json_encode(["success" => false, "error" => "Database connection failed: " . $conn->connect_error]));
}

// Mengambil Data JSON dari Input
$data = json_decode(file_get_contents("php://input"), true);
if (!$data) {
    echo json_encode(["success" => false, "error" => "Invalid JSON input"]);
    exit;
}

// Validasi Data
if (!isset($data['Name'], $data['Email'], $data['Phone_number'], $data['Password'])) {
    echo json_encode(["success" => false, "error" => "Missing required fields"]);
    exit;
}

// Menyiapkan query
$stmt = $conn->prepare("INSERT INTO tbuser (Name, Email, Phone_number, Password) VALUES (?, ?, ?, ?)");
if (!$stmt) {
    echo json_encode(["success" => false, "error" => "Statement preparation failed: " . $conn->error]);
    exit;
}

// Mengikat parameter
$stmt->bind_param("ssss", $data['Name'], $data['Email'], $data['Phone_number'], $data['Password']);

// Menjalankan query
if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "User successfully added"]);
} else {
    echo json_encode(["success" => false, "error" => "Execution failed: " . $stmt->error]);
}

// Menutup koneksi
$stmt->close();
$conn->close();
?>
