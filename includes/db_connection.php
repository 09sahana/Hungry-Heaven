<?php

$db_host = getenv('DB_HOST') ?: 'localhost';
$db_user = getenv('DB_USER') ?: 'root';
$db_password = getenv('DB_PASSWORD') ?: '';
$db_name = getenv('DB_NAME') ?: 'hungry_heaven';

$conn = mysqli_connect(
    $db_host,
    $db_user,
    $db_password,
    $db_name
);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>