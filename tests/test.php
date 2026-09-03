<?php

echo "Running HungryHeaven automated tests...\n";

$tests = [
    "Homepage exists" => "index.php",
    "Database connection exists" => "includes/db_connection.php",
    "Dockerfile exists" => "Dockerfile",
    "Docker Compose file exists" => "docker-compose.yml"
];

$failed = false;

foreach ($tests as $name => $file) {
    if (file_exists($file)) {
        echo "PASS: $name\n";
    } else {
        echo "FAIL: $name\n";
        $failed = true;
    }
}

if ($failed) {
    exit(1);
}

echo "All automated tests passed!\n";
exit(0);

?>