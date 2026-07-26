-- RDBMS-II Assignment 1 — Part 2
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

create table customer_dtl
(cust_no varchar2(6) References customer_mst(cust_no),
bill_mon varchar2(3),
prev__read number(5),
curr_read number(5),
unit_price number(5,2) check(unit_price > 0),
due_date date);

insert into customer_dtl values('ANA001','NOV','1200','2500','5.50','26-DEC-20');
insert into customer_dtl values('VVN001','DEC','275','365','5.50','20-JAN-20');
insert into customer_dtl values('ANA002','NOV','145','570','5.50','26-DEC-20');
insert into customer_dtl values('BAK001','DEC','45','145','5.50','20-JAN-20');
insert into customer_dtl values('VVN002','DEC','600','680','5.50','20-JAN-20');
insert into customer_dtl values('ANA003','NOV','2500','2850','5.50','26-DEC-20');

select * from customer_dtl;

CUST_N BIL PREV__READ  CURR_READ UNIT_PRICE DUE_DATE
------ --- ---------- ---------- ---------- ---------
ANA001 NOV       1200       2500        5.5 26-DEC-20
VVN001 DEC        275        365        5.5 20-JAN-20
ANA002 NOV        145        570        5.5 26-DEC-20
BAK001 DEC         45        145        5.5 20-JAN-20
VVN002 DEC        600        680        5.5 20-JAN-20
ANA003 NOV       2500       2850        5.5 26-DEC-20
