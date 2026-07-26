-- 1
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

create table product
(Product_id int primary key generated always as identity,
 Name varchar(100) not null,
 Price numeric (10,2) check (price > 0),
 Create_at TIMES DEFAULT current_timestamp,
 Is_available boolean DEFAULT true);
