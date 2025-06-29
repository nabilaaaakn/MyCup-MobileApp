<?php
// Koneksi ke Database
$conn = new mysqli("localhost", "root", "", "dbmy_cup");

// Cek koneksi
if ($conn->connect_error) {
    die(json_encode(["success" => false, "error" => "Connection failed: " . $conn->connect_error]));
}

// Ambil data JSON dari Flutter
$data = json_decode(file_get_contents("php://input"), true);

// Log data yang diterima untuk debugging
error_log("Received data: " . print_r($data, true));

// Validasi Input
$user_id = $data['Id_user'] ?? ''; // Konsisten dengan Flutter
$name = $data['Name'] ?? null;
$phone = $data['Phone_number'] ?? null;
$email = $data['Email'] ?? null;
$password = $data['Password'] ?? null;

if (empty($user_id)) {
    echo json_encode(["success" => false, "error" => "UserID is required"]);
    exit;
}

// Validasi panjang password jika disertakan
if (!empty($password) && strlen($password) < 6) {
    echo json_encode(["success" => false, "error" => "Password must be at least 6 characters"]);
    exit;
}

// Buat query dinamis
$update_fields = [];
$params = [];
$types = "";

if (!empty($name)) {
    $update_fields[] = "Name = ?";
    $params[] = $name;
    $types .= "s";
}
if (!empty($phone)) {
    $update_fields[] = "Phone_number = ?";
    $params[] = $phone;
    $types .= "s";
}
if (!empty($email)) {
    $update_fields[] = "Email = ?";
    $params[] = $email;
    $types .= "s";
}
if (!empty($password)) {
    $update_fields[] = "Password = ?"; // Password langsung disimpan tanpa hashing
    $params[] = $password;
    $types .= "s";
}

// Jika tidak ada field yang diisi
if (empty($update_fields)) {
    error_log("No fields to update for UserID: $user_id");
    echo json_encode(["success" => false, "error" => "No fields to update"]);
    exit;
}

// Tambahkan UserID untuk WHERE clause
$params[] = $user_id;
$types .= "i";

// Siapkan query
$query = "UPDATE tbuser SET " . implode(", ", $update_fields) . " WHERE Id_user = ?";
$stmt = $conn->prepare($query);

// Debug query dan parameter
error_log("Query: $query");
error_log("Params: " . print_r($params, true));

if ($stmt === false) {
    error_log("Prepare failed: " . $conn->error);
    echo json_encode(["success" => false, "error" => "Failed to prepare statement"]);
    exit;
}

// Bind parameter dan eksekusi
$stmt->bind_param($types, ...$params);

if ($stmt->execute()) {
    echo json_encode(["success" => true, "message" => "Profile updated successfully"]);
} else {
    error_log("Update failed: " . $stmt->error);
    echo json_encode(["success" => false, "error" => "Update failed: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
