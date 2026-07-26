-- Execise-3
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

ALTER TABLE students ADD COLUMN phone_number NUMERIC(11) UNIQUE;

SELECT * FROM students;

ALTER TABLE students RENAME TO university_students;

university-# \dt

ALTER TABLE university_students DROP COLUMN email;

SELECT * FROM university_students;

(4)
-- Step 1: Update NULL values
UPDATE university_students SET phone_number = 10000000000 + id WHERE phone_number IS NULL;

SELECT * FROM university_students;

-- Step 2: Apply NOT NULL constraint;
ALTER TABLE university_students ALTER COLUMN phone_number SET NOT NULL;

ALTER TABLE university_students ALTER COLUMN phone_number SET NOT NULL;
