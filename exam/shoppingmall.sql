CREATE DATABASE shoppingmall;

USE shoppingmall;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    image VARCHAR(255)
);

INSERT INTO products (name, price, description, image) VALUES
('Laptop', 1500.00, 'A high-end laptop.', 'laptop.jpg'),
('Smartphone', 800.00, 'Latest smartphone.', 'smartphone.jpg'),
('Headphones', 150.00, 'Noise-cancelling headphones.', 'headphones.jpg');
