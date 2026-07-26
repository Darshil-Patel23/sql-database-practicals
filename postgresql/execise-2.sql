-- Execise-2
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

CREATE TABLE product (
    product_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) CHECK (price > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_available BOOLEAN DEFAULT TRUE
);


INSERT INTO product (name, price, created_at, is_available) VALUES
('Laptop', 75000.00, CURRENT_TIMESTAMP, true),
('Smartphone', 35000.00, CURRENT_TIMESTAMP, true),
('Tablet', 22000.00, CURRENT_TIMESTAMP, true),
('Wireless Mouse', 1200.00, CURRENT_TIMESTAMP, false),
('Keyboard', 4500.00, CURRENT_TIMESTAMP, false),
('Monitor', 18000.00, CURRENT_TIMESTAMP, true),
('Hard Drive', 6000.00, CURRENT_TIMESTAMP, true),
('Charger', 900.00, CURRENT_TIMESTAMP, true),
('Speaker', 2500.00, CURRENT_TIMESTAMP, true),
('Smartwatch', 15000.00, CURRENT_TIMESTAMP, true),
('Headphones', 3000.00, CURRENT_TIMESTAMP, true),
('Webcam', 2000.00, CURRENT_TIMESTAMP, false),
('Printer', 8500.00, CURRENT_TIMESTAMP, true),
('Router', 3200.00, CURRENT_TIMESTAMP, false),
('Power Bank', 1800.00, CURRENT_TIMESTAMP, true),
('Drone', 55000.00, CURRENT_TIMESTAMP, false),
('VR Headset', 40000.00, CURRENT_TIMESTAMP, true),
('Graphics Card', 65000.00, CURRENT_TIMESTAMP, false),
('SSD', 7200.00, CURRENT_TIMESTAMP, true),
('Smart TV', 48000.00, CURRENT_TIMESTAMP, true);

SELECT * FROM product;

SELECT * FROM product WHERE is_available = TRUE;


UPDATE product SET price = 450.00 WHERE name = 'Charger';

SELECT * FROM product;

DELETE FROM product WHERE product_id = 8;

SELECT * FROM product;
