-- Excercise-4
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

INSERT INTO university_students (name, age, phone_number) VALUES 
('Darshan', 18, 12345678910),
('Priyanshu', 19, 12345678922),
('Preet', 20, 12345678923)
RETURNING *;

UPDATE university_students SET age = 29 WHERE id = 1 RETURNING *;

DELETE FROM university_students WHERE id = 3 RETURNING *;

INSERT INTO university_students (name, age, phone_number) VALUES 
('Amit', 22, 12345678931),
('Rahul', 23, 12345678932),
('Neel', 21, 12345678933)
RETURNING *;

DELETE FROM university_students WHERE age < 18 RETURNING *;
