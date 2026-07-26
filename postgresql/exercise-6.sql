-- Exercise-6
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

CREATE TABLE orders (
    order_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    student_id INT,
    total_price NUMERIC(10,2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES university_students(id)
);

INSERT INTO orders (student_id, total_price) VALUES
(1, 500),
(2, 700),
(1, 300),
(1, 800),
(4, 200),
(2, 900),
(5, 100),
(6, 600);

SELECT * FROM orders;



SELECT s.name, o.total_price
FROM university_students s
INNER JOIN orders o
ON s.id = o.student_id;

SELECT student_id, COUNT(*) AS total_orders
FROM orders
GROUP BY student_id;

SELECT s.name
FROM university_students s
LEFT JOIN orders o
ON s.id = o.student_id
WHERE o.student_id IS NULL;

SELECT s.name, o.total_price
FROM university_students s
JOIN orders o
ON s.id = o.student_id
WHERE o.total_price > 500;

WITH avg_price AS (
    SELECT student_id, AVG(total_price) AS avg_order
    FROM orders
    GROUP BY student_id
)
SELECT * FROM avg_price;

SELECT id FROM university_students
UNION
SELECT student_id FROM orders;

SELECT id FROM university_students
INTERSECT
SELECT student_id FROM orders;

SELECT id FROM university_students
EXCEPT
SELECT student_id FROM orders;

SELECT * FROM university_students
WHERE age BETWEEN 18 AND 25;

SELECT * FROM university_students
WHERE name LIKE 'A%';

SELECT UPPER(name) FROM university_students;

SELECT name, LENGTH(name) FROM university_students;

SELECT SUBSTRING(name, 1, 3) FROM university_students;

SELECT CURRENT_DATE, CURRENT_TIMESTAMP;

SELECT EXTRACT(YEAR FROM order_date) FROM orders;

SELECT AGE(CURRENT_DATE, order_date) FROM orders;

SELECT CURRENT_DATE + INTERVAL '5 days';
