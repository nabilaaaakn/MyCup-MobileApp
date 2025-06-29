<?php
// Atur Header agar hasil selalu dalam format JSON
header("Content-Type: application/json");

// Koneksi ke Database
$conn = new mysqli("localhost", "root", "", "dbmy_cup");

// Log jika terjadi error koneksi
if ($conn->connect_error) {
    error_log("Connection failed: " . $conn->connect_error);
    echo json_encode([
        "success" => false,
        "error" => "Connection failed: " . $conn->connect_error
    ]);
    exit;
}

// Query untuk mengambil kolom yang diperlukan
$query = "SELECT Name, Email, Phone_number, Password FROM tbuser";
$result = $conn->query($query);

// Cek jika query gagal
if ($result === false) {
    error_log("Failed to execute query: " . $conn->error);
    echo json_encode([
        "success" => false,
        "error" => "Failed to execute query: " . $conn->error
    ]);
    exit;
}

// Cek apakah data ditemukan
if ($result->num_rows > 0) {
    $users = [];
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
    echo json_encode([
        "success" => true,
        "message" => "All profiles retrieved successfully",
        "data" => $users
    ]);
    error_log("All profiles retrieved: " . json_encode($users));
} else {
    echo json_encode([
        "success" => false,
        "error" => "No users found"
    ]);
    error_log("No users found in the database");
}

// Tutup koneksi
$conn->close();
?>
