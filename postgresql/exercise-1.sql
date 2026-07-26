-- Exercise-1
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

CREATE TABLE students (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 16),
    email VARCHAR(255) UNIQUE
);

INSERT INTO students (name, age, email) VALUES
('Darshil',25,'darshil@gmail.com'),
('Mehul',21,'mehul@gmail.com'),
('Romit',22,'romit@gmail.com'),
('Ayush',24,'ayush@gmail.com'),
('Aryan',22,'aryan@gmail.com'),
('Ayush Patel',21,'ayushpatel@gmail.com'),
('Riyaz',20,'riyaz@gmail.com'),
('Devanshu',22,'devanshu@gmail.com'),
('Manav',23,'manav@gmail.com'),
('Keval',22,'keval@gmail.com'),
('Meet M',24,'meetm@gmail.com'),
('Meet Patel',21,'meetpatel@gmail.com'),
('Harshil Jadav',22,'harshil@gmail.com'),
('Vinod',21,'vinod@gmail.com'),
('Harsh',23,'harshp@gmail.com'),
('Karan',22,'karan@gmail.com'),
('Jay',25,'jay@gmail.com'),
('Raghav',26,'raghav@gmail.com'),
('Kushal',22,'kushal@gmail.com'),
('Parth',21,'parth@gmail.com')
RETURNING *;
