<?php
$host = 'test'; // PostgreSQL host name
$dbname = 'test-db'; // Database name
$user = 'test'; // Database user
$password = '12345'; // Database password

// Connect to PostgreSQL
$pdo = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);

// Create a table if it doesn't exist
$pdo->exec("CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL
)");

$username = $_GET["username"];

$stmt = $pdo->prepare("INSERT INTO users (username) VALUES (:username)");
    $stmt->execute(['username' => $username]);

    echo "Username '$username' inserted into the database.";