<?php
// setup_auth.php
require_once 'config.php';

try {
    // 1. Create Users Table in db1
    $conn->exec("CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        email VARCHAR(100) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL,
        role ENUM('admin', 'student') NOT NULL,
        student_number INT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (student_number) REFERENCES StudentDetails(StudentNumber) ON DELETE SET NULL
    ) ENGINE=InnoDB");

    echo "✅ Users table created in db1.<br>";

    // 2. Create Admin Account
    // Credentials: admin@lss.org / admin123
    $admin_email = 'admin@lss.org';
    $admin_pass = password_hash('admin123', PASSWORD_DEFAULT);
    
    $stmt = $conn->prepare("INSERT IGNORE INTO users (email, password, role) VALUES (?, ?, 'admin')");
    $stmt->execute([$admin_email, $admin_pass]);
    echo "✅ Admin account created (Email: <strong>admin@lss.org</strong> | Pass: <strong>admin123</strong>)<br>";

    // 3. Create Sample Student Accounts (Linking to students from StudentDetails table)
    
    // Student 1: Juan Dela Cruz - Credentials: juan_delacruz@example.edu / student123
    $stmt = $conn->prepare("INSERT IGNORE INTO users (email, password, role, student_number) VALUES (?, ?, 'student', ?)");
    $stmt->execute(['juan_delacruz@example.edu', password_hash('student123', PASSWORD_DEFAULT), 10000001]);
    echo "✅ Student account created: <strong>juan_delacruz@example.edu</strong> / student123<br>";

    // Student 2: Maria Clara Santos - Credentials: maria_santos@example.edu / student123
    $stmt->execute(['maria_santos@example.edu', password_hash('student123', PASSWORD_DEFAULT), 10000002]);
    echo "✅ Student account created: <strong>maria_santos@example.edu</strong> / student123<br>";

    // Student 3: Jose Miguel Reyes - Credentials: jose_reyes@example.edu / student123
    $stmt->execute(['jose_reyes@example.edu', password_hash('student123', PASSWORD_DEFAULT), 10000003]);
    echo "✅ Student account created: <strong>jose_reyes@example.edu</strong> / student123<br>";

    echo "<br>🎉 <strong>Setup Complete!</strong><br>";
    echo "✅ Database: db1<br>";
    echo "✅ Tables: users, StudentDetails<br>";
    echo "✅ Sample accounts created<br><br>";
    echo "You can now:<br>";
    echo "1. Delete this file (setup_auth.php)<br>";
    echo "2. Go to <a href='login.php'><strong>login.php</strong></a> to start using the system<br>";

} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}
?>