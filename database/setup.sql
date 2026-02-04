-- Create Database
CREATE DATABASE IF NOT EXISTS user_management_db;
USE user_management_db;

-- Create User Table
CREATE TABLE IF NOT EXISTS user (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample data
INSERT INTO user (username, email, password) VALUES 
('admin', 'admin@example.com', 'admin123'),
('user1', 'user1@example.com', 'password123'),
('user2', 'user2@example.com', 'password456');
