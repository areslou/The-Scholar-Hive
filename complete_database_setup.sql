-- ==========================================
-- COMPLETE DATABASE SETUP FOR LSS SYSTEM
-- Run this entire file in phpMyAdmin SQL tab
-- ==========================================

-- ==========================================
-- 1. DATABASE & TABLE SETUP
-- ==========================================
DROP DATABASE IF EXISTS DB1;
DROP DATABASE IF EXISTS DB2;

CREATE DATABASE DB1;
CREATE DATABASE DB2;

-- Setup DB2
USE DB2;
CREATE TABLE IF NOT EXISTS Table1 (
    SampleID INT PRIMARY KEY,
    SampleData VARCHAR(50)
) ENGINE=InnoDB;

-- Setup DB1
USE DB1;
CREATE TABLE IF NOT EXISTS StudentDetails (
    StudentNumber INT PRIMARY KEY,
    LastName      VARCHAR(50),
    FirstName     VARCHAR(50),
    MiddleName    VARCHAR(50),
    DegreeProgram VARCHAR(50),
    Email         VARCHAR(100),
    Scholarship   VARCHAR(150),
    Status        VARCHAR(20),
    ContactNumber VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student') NOT NULL,
    student_number INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_number) REFERENCES StudentDetails(StudentNumber) ON DELETE SET NULL
) ENGINE=InnoDB;

-- ==========================================
-- 2. SAMPLE DATA (fictional people, safe to share)
-- Replace with your own data locally. Never commit real student records.
-- ==========================================
INSERT INTO StudentDetails (StudentNumber, LastName, FirstName, MiddleName, DegreeProgram, Email, Scholarship, Status, ContactNumber) VALUES
(10000001, 'DELA CRUZ', 'Juan', 'P.', 'BS CpE', 'juan_delacruz@example.edu', 'DOST-SEI Merit Scholarship', 'ACTIVE', '0900 000 0001'),
(10000002, 'SANTOS', 'Maria Clara', 'R.', 'BS-PSYC', 'maria_santos@example.edu', 'St. La Salle Financial Assistance Grant', 'ACTIVE', '0900 000 0002'),
(10000003, 'REYES', 'Jose Miguel', 'A.', 'BSA', 'jose_reyes@example.edu', 'Archer Achiever Scholarship', 'ACTIVE', '0900 000 0003'),
(10000004, 'GARCIA', 'Ana Patricia', 'L.', 'BS-STAT', 'ana_garcia@example.edu', 'Vaugirard Scholarship Program', 'ACTIVE', '0900 000 0004'),
(10000005, 'MENDOZA', 'Carlo', 'D.', 'BS-CHY', 'carlo_mendoza@example.edu', 'Brother President Scholarship Program', 'ACTIVE', '0900 000 0005'),
(10000006, 'TORRES', 'Bea Nicole', 'S.', 'BS-APC', 'bea_torres@example.edu', 'STAR Scholarship', 'ACTIVE', '0900 000 0006'),
(10000007, 'RAMOS', 'Paolo', 'J.', 'BSE-ENG', 'paolo_ramos@example.edu', 'DOST-SEI Merit Scholarship', 'ON LEAVE', '0900 000 0007'),
(10000008, 'CRUZ', 'Isabel', 'M.', 'BS IE', 'isabel_cruz@example.edu', 'St. La Salle Financial Assistance Grant', 'ACTIVE', '0900 000 0008'),
(10000009, 'AQUINO', 'Miguel Luis', 'T.', 'BS BIOMED', 'miguel_aquino@example.edu', 'Archer Achiever Scholarship', 'ACTIVE', '0900 000 0009'),
(10000010, 'VILLANUEVA', 'Katrina', 'F.', 'BS CpE', 'katrina_villanueva@example.edu', 'Vaugirard Scholarship Program & DOST-SEI Merit Scholarship', 'ACTIVE', '0900 000 0010'),
(10000011, 'FERNANDEZ', 'Rafael', 'B.', 'BSMS ME', 'rafael_fernandez@example.edu', 'STAR Scholarship', 'ACTIVE', '0900 000 0011'),
(10000012, 'LOPEZ', 'Camille', 'E.', 'BS-PSYC', 'camille_lopez@example.edu', 'Brother President Scholarship Program', 'ACTIVE', '0900 000 0012');

-- ==========================================
-- 3. USERS
-- Run setup_auth.php after this file to create login accounts with real password hashes.
-- Default Admin:   admin@lss.org / admin123
-- Default Student: juan_delacruz@example.edu / student123
-- ==========================================
