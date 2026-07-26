-- Project-2
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

CREATE DATABASE attendance_db;
\d atteanda
\c attendance_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    phone_number NUMERIC(11) UNIQUE NOT NULL
);

\d employees

CREATE TABLE attendance (
    record_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    employee_id INT,
    date DATE DEFAULT CURRENT_DATE,
    check_in_time TIME,
    check_out_time TIME,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

\d attendance



INSERT INTO employees (name, department, phone_number) VALUES
('Darshil','IT',11111111101),
('Mehul','HR',11111111102),
('Ayush','Finance',11111111103),
('Aryan','IT',11111111104),
('Ravi','Admin',11111111105),
('Karan','IT',11111111106),
('Jay','HR',11111111107),
('Neel','Finance',11111111108),
('Parth','IT',11111111109),
('Yash','Admin',11111111110),
('Rohan','IT',11111111111),
('Amit','HR',11111111112),
('Rahul','Finance',11111111113),
('Sahil','IT',11111111114),
('Kishan','Admin',11111111115),
('Dev','IT',11111111116),
('Meet','HR',11111111117),
('Harsh','Finance',11111111118),
('Vivek','IT',11111111119),
('Tushar','Admin',11111111120);

SELECT * FROM employees;

INSERT INTO attendance (employee_id, date, check_in_time, check_out_time) VALUES
(1, CURRENT_DATE, '09:00', '18:00'),
(2, CURRENT_DATE, '09:30', '17:30'),
(3, CURRENT_DATE, '10:00', '19:00'),
(4, CURRENT_DATE, '09:15', '18:30'),
(5, CURRENT_DATE, '09:00', '17:00'),
(6, CURRENT_DATE, '08:45', '18:15'),
(7, CURRENT_DATE, '09:20', '17:50'),
(8, CURRENT_DATE, '10:10', '19:10'),
(9, CURRENT_DATE, '09:00', '18:00'),
(10, CURRENT_DATE, '09:30', '17:30'),
(11, CURRENT_DATE, '09:10', '18:10'),
(12, CURRENT_DATE, '09:25', '17:25'),
(13, CURRENT_DATE, '10:00', '19:00'),
(14, CURRENT_DATE, '09:05', '18:05'),
(15, CURRENT_DATE, '09:40', '17:40'),
(16, CURRENT_DATE, '08:50', '18:20'),
(17, CURRENT_DATE, '09:35', '17:35'),
(18, CURRENT_DATE, '10:15', '19:15'),
(19, CURRENT_DATE, '09:00', '18:00'),
(20, CURRENT_DATE, '09:45', '17:45');

SELECT * FROM attendance;




SELECT e.name, a.date, a.check_in_time, a.check_out_time
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE e.employee_id = 1;

SELECT e.name
FROM employees e
LEFT JOIN attendance a
ON e.employee_id = a.employee_id AND a.date = CURRENT_DATE
WHERE a.employee_id IS NULL;

UPDATE attendance
SET check_out_time = '18:30'
WHERE employee_id = 1 AND date = CURRENT_DATE;

SELECT * FROM attendance;

SELECT e.name,
       (check_out_time - check_in_time) AS working_hours
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
WHERE (check_out_time - check_in_time) > INTERVAL '8 hours';

SELECT e.name,
       SUM(check_out_time - check_in_time) AS total_hours
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id
GROUP BY e.name;
