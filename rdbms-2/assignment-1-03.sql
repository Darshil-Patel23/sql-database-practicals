-- RDBMS-II Assignment 1 — Part 3
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

create table doctor_master
(docid varchar2(3) primary key,
dnm varchar2(15),
case_fee number(3));

insert into doctor_master values('D01','VIRAJ PATEL','300');
insert into doctor_master values('D05','MANSI JOSHI','250');
insert into doctor_master values('D03','ALOK SINHA','400');
insert into doctor_master values('D02','ROSHNI BHATT','500');
insert into doctor_master values('D04','KERAV RAJ','200');

select * from doctor_master;

DOC DNM               CASE_FEE
--- --------------- ----------
D01 VIRAJ PATEL            300
D05 MANSI JOSHI            250
D03 ALOK SINHA             400
D02 ROSHNI BHATT           500
D04 KERAV RAJ              200
