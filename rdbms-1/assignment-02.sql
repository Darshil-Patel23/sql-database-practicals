-- Assignment 02
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

create table dept
(deptno number(2) Primary Key,
 dname varchar2 (15),
 Loc varchar2 (25));

insert into dept values('10','Accounting','New York');
insert into dept values('20','Research','Dallas');
insert into dept values('30','Sales','Chicago');
insert into dept values('40','Operations','Boston');

create table emp
(empno number(4) Primary Key,
ename varchar2(10),
job varchar2(10),
mgr number(4),
hiredate date,
sal number(7,2),
comm number(7,2),
deptno number(2) References dept(deptno));

insert into emp values('7369','Smith','Clerk','7902','17-DEC-80','800','','20');
insert into emp values('7499','Allen','Salesman','7698','20-FEB-81','1600','300','30');
insert into emp values('7521','Ward','Salesman','7698','22-FEB-81','1250','500','30');
insert into emp values('7566','Jones','Manager','7839','02-APR-81','2975','','20');
insert into emp values('7654','Martin','Salesman','7698','28-SEP-81','1250','1400','30');
insert into emp values('7698','Blake','Manager','7839','01-MAY-81','2850','','30');
insert into emp values('7782','Clark','Manager','7839','09-JUN-81','2450','','10');
insert into emp values('7788','Scott','Analyst','7566','09-DEC-82','3000','','20');
insert into emp values('7839','King','President','','17-NOV-81','5000','','10');
insert into emp values('7844','Turner','Salesman','7698','08-SEP-81','1500','0','30');
insert into emp values('7876','Adams','Clerk','7788','12-JAN-83','1100','','20');
insert into emp values('7900','James','Clerk','7698','03-DEC-81','950','','30');
insert into emp values('7902','Ford','Analyst','7566','03-DEC-81','3000','','20');
insert into emp values('7934','Miller','Clerk','7782','23-JAN-82','1300','','10');


create table doctor
(d_id varchar2(3) primary key check(d_id like 'D%'), 
dname varchar2(25),
Dcity varchar(20) check (Dcity in ('Anand', 'Baroda', 'Nadiad')), 
spec varchar2(20) check (spec in ('ENT', 'Dental', 'Ortho', 'Eye')));


insert into doctor values('D01','Dharmendra Patel','Anand','ENT'); 
insert into doctor values('D02','Jinay Shah','Nadiad','Eye'); 
insert into doctor values('D03','Sonal Patel','Anand','Dental'); 
insert into doctor values('D04','Mehul Patel','Anand','ENT'); 
insert into doctor values('D05','Mahesh Patel','Baroda','Ortho'); 
insert into doctor values('D06','Neerav Parmar','Nadiad','Dental'); 
insert into doctor values('D07','Niraj Shah','Anand','Ortho'); 
insert into doctor values('D08','Mukesh Kotiya','Baroda','Eye');


create table patient
(P_id varchar2(3) primary key check(P_id like 'P%'),
Pname varchar2(25),
Bdate date,
Paddr varchar2(35),
Gender char(6) default 'M' not null check (Gender in ('M','F')));

insert into patient values ('P01','Rupal Patel','12-SEP-98','Anand','F'); 
insert into patient values ('P02','Kalpesh Shah','04-SEP-99','Baroda','M'); 
insert into patient values ('P03','Kavita Joshi','23-OCT-87','Surat','F'); 
insert into patient values ('P04','Sachin Pandya','04-FEB-89','Anand','M'); 
insert into patient values ('P05','Brijesh Patel','15-MAR-95','Nadiad','F'); 
insert into patient values ('P06','Mayank Shah','16-MAY-65','Baroda','M'); 
insert into patient values ('P07','Mitul Soni','27-AUG-96','Anand','M'); 
insert into patient values ('P08','Krunal Pandya','20-JAN-70','Rajkot','M'); 
insert into patient values ('P09','Rinkal Bhatt','14-APR-95','Navsari','M'); 
insert into patient values ('P10','Pratik Solanki','22-JUN-87','Surat','M');

create table treatment
(T_id varchar2(3) primary key check(T_id like 'T%'), 
Tdetails varchar2(50),
Charges number(5) check (Charges>0));

insert into treatment values ('T01', 'Retina', '1200'); 
insert into treatment values ('T02', 'Root Canal', '400');
insert into treatment values ('T03', 'Sleep Apnea', '600');
insert into treatment values ('T04', 'Glaucoma','1500');
insert into treatment values ('T05', 'Tonsil', '200');
insert into treatment values ('T06', 'Knee Replacement', '500');
insert into treatment values ('T07', 'Ear Infection', '400');
insert into treatment values ('T08', 'Spine', '600');
insert into treatment values ('T09', 'Tooth Extraction', '1000');

create table appointment
(A_id number(6) Primary Key,
d_id varchar2(3) References doctor (d_id),
P_id varchar2(3) References patient (P_id),
T_id varchar2(3) References treatment (T_id),
App_date date,
Duration number(4),
Status char(6));

insert into appointment values ('201801','D02','P01','T01','01-DEC-18','20','C'); 
insert into appointment values ('201802','D03','P02','T02','12-OCT-18','35','C'); 
insert into appointment values ('201803','D04','P03','T03','26-DEC-18','30','I'); 
insert into appointment values ('201804','D08','P04','T04','01-JAN-18','25','C'); 
insert into appointment values ('201805','D01','P05','T05','11-SEP-18','40','C'); 
insert into appointment values ('201806','D05','P06','T06','23-SEP-18','25','C'); 
insert into appointment values ('201807','D04','P07','T07','16-JAN-18','55','I'); 
insert into appointment values ('201808','D07','P08','T08','12-NOV-18','40','I'); 
insert into appointment values ('201809','D06','P09','T09','16-NOV-18','35','C'); 
insert into appointment values ('201810','D04','P10','T03','03-JUL-18','30','I'); 
insert into appointment values ('201811','D01','P04','T05','01-DEC-18','50','C'); 
insert into appointment values ('201812','D07','P07','T08','30-OCT-18','25','I');
