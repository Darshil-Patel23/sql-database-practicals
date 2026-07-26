-- Assignment 01
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

(1)
create table cust
(cust_id varchar2(5),
lname char(10),
fname char(10),
area varchar2(10),
phone_no number(10));

insert into cust values('a01','Patel','Ajay','Anand',381334);
insert into cust values('a02','Shah','Anjali','Surat',556037);
insert into cust values('a03','Thakkar','Vinay','Baroda',372631);
insert into cust values('a04','Joshi','Kamal','Surat',666612);
insert into cust values('a05','Pandya','Rohan','Anand','');
insert into cust values('a06','Patel','Kajal','Baroda',512527);

create table movie
(mv_no number(5),
Title varchar2(25),
Type varchar2(10),
Star varchar2(25),
Price number(8,2));

insert into movie values(1,'Hera Pheri','Comedy','Paresh Raval',10');
insert into movie values(2,'Kuch Kuch Hota Hain','Romantic','Kajol',225.00);
insert into movie values(3,'Drashyam','Suspence','Ajay Devagan',250);
insert into movie values(4,'Welcome','Comedy','Anil Kapoor',200.00);
insert into movie values(5,'Gupt','Suspence','Bobby Deol',195);
insert into movie values(6,'Tere Naam','Romantic','Salman Khan',190);
insert into movie values(7,'Hungama','Comedy','Akshay Khanna',135);
insert into movie values(8,'Ajnabee','Suspence','Akshay Kumar',165);
insert into movie values(9,'No Entry','Comedy','Anil Kapoor',220);
insert into movie values(10,'Singham','Action','Ajay Devagan',195);
