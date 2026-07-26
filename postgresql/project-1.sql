-- Project-1
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

CREATE DATABASE library_db;

\c library_db;


CREATE TABLE students (
    student_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 16),
    phone_number NUMERIC(11) UNIQUE NOT NULL
);
\d students;

CREATE TABLE books (
    book_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    is_available BOOLEAN DEFAULT TRUE
);
\d books

CREATE TABLE borrow_records (
    record_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    student_id INT,
    book_id INT,
    borrow_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    return_date TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
\d borrow_records



INSERT INTO students (name, age, phone_number) VALUES
('Darshil',25,12345678901),
('Mehul',21,12345678902),
('Ayush',22,12345678903),
('Aryan',23,12345678904),
('Ravi',20,12345678905),
('Karan',24,12345678906),
('Jay',26,12345678907),
('Neel',19,12345678908),
('Parth',21,12345678909),
('Yash',22,12345678910),
('Rohan',23,12345678911),
('Amit',20,12345678912),
('Rahul',24,12345678913),
('Sahil',22,12345678914),
('Kishan',25,12345678915),
('Dev',21,12345678916),
('Meet',23,12345678917),
('Harsh',24,12345678918),
('Vivek',22,12345678919),
('Tushar',21,12345678920);

SELECT * FROM students;


INSERT INTO books (title, author) VALUES
('Database Systems','Korth'),
('Operating Systems','Galvin'),
('Computer Networks','Tanenbaum'),
('Data Structures','Sahni'),
('Java Programming','Herbert Schildt'),
('Python Basics','Guido'),
('Web Development','Jon Duckett'),
('AI Fundamentals','Russell'),
('Machine Learning','Tom Mitchell'),
('Cyber Security','William Stallings');

SELECT * FROM books;

INSERT INTO borrow_records (student_id, book_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(1,2),(2,3),(6,1),(7,2),(8,3);

SELECT * FROM borrow_records;

SELECT s.name, b.title
FROM students s
JOIN borrow_records br ON s.student_id = br.student_id
JOIN books b ON b.book_id = br.book_id;

SELECT * FROM books
WHERE is_available = TRUE;

UPDATE books
SET is_available = FALSE
WHERE book_id = 1;

SELECT * FROM books;

SELECT s.name
FROM students s
LEFT JOIN borrow_records br
ON s.student_id = br.student_id
WHERE br.student_id IS NULL;

UPDATE borrow_records
SET return_date = CURRENT_TIMESTAMP
WHERE record_id = 1;
SELECT * FROM borrow_records;

UPDATE books
SET is_available = TRUE
WHERE book_id = 1;


SELECT * FROM borrow_records;
SELECT * FROM books;


SELECT * FROM students
LIMIT 5;

SELECT * FROM students
LIMIT 5 OFFSET 5;

SELECT student_id, COUNT(*) AS total_books
FROM borrow_records
GROUP BY student_id
HAVING COUNT(*) > 1;

SELECT s.name
FROM students s
JOIN borrow_records br ON s.student_id = br.student_id
WHERE br.book_id = 1;
