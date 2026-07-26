-- Exercise-5
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

SELECT * FROM university_students;

SELECT name, age FROM university_students WHERE age > 20;

SELECT * FROM university_students ORDER BY name DESC;

SELECT * FROM university_students LIMIT 2;

SELECT * FROM university_students WHERE name LIKE 'A%';

SELECT DISTINCT age FROM university_students;

SELECT * FROM university_students WHERE phone_number IS NULL;

SELECT name AS student_name FROM university_students;

SELECT name, age + 2 AS updated_age FROM university_students;

SELECT DISTINCT name FROM university_students;

SELECT * FROM university_students LIMIT 5 OFFSET 3;

SELECT * FROM university_students WHERE LENGTH(name) > 5;
