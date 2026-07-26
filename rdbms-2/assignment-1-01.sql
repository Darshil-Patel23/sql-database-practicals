-- RDBMS-II Assignment 1 — Part 1
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

create table customer_mst
(cust_no varchar2(6)primary key check(cust_no like 'ANA%' or cust_no like 'VVN%' or cust_no like 'BAK%'),
cust_name varchar2(20) not null,
address varchar2(20),
city varchar2(10) check(city='ANAND' or city='V V NAGAR' or city='BAKROL'));

insert into customer_mst values('ANA001','ANUJ PATEL','PATEL STREET','ANAND');
insert into customer_mst values('VVN001','SURAJ SHAH','NANA BAZAR','V V NAGAR');
insert into customer_mst values('ANA002','BINITA THAKKAR','LAKSH APT','ANAND');
insert into customer_mst values('BAK001','ANIL PATEL','SUNRISE SOCIETY','BAKROL');
insert into customer_mst values('VVN002','VIJAY RAY','MOTA BAZAR','V V NAGAR');
insert into customer_mst values('ANA003','ROMA BHATT','TOEN HALL ROAD','ANAND');


select * from customer_mst;

CUST_N CUST_NAME            ADDRESS              CITY
------ -------------------- -------------------- ----------
ANA001 ANUJ PATEL           PATEL STREET         ANAND
VVN001 SURAJ SHAH           NANA BAZAR           V V NAGAR
ANA002 BINITA THAKKAR       LAKSH APT            ANAND
BAK001 ANIL PATEL           SUNRISE SOCIETY      BAKROL
VVN002 VIJAY RAY            MOTA BAZAR           V V NAGAR
ANA003 ROMA BHATT           TOEN HALL ROAD       ANAND
