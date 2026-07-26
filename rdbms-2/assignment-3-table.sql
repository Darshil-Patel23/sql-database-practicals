-- RDBMS-II Assignment 3 — Part table
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

create table DEPT
(DEPTNO number(2) primary key,
DNAME varchar2(14),
LOC varchar2(13));

insert into DEPT values('10','ACCOUNTING','NEW YORK');
insert into DEPT values('20','RESEARCH','DALLAS');
insert into DEPT values('30','SALES','CHICAGO');
insert into DEPT values('40','OPERATIONS','BOSTON');

create table EMP
(EMPNO number(4) primary key,
ENAME varchar2(10),
JOB varchar2(9),
MGR number(4),
HIREDATE date,
SAL number(7,2),
COMM number(7,2),
DEPTNO number(2) References DEPT(DEPTNO));

insert into EMP values('7369','SMITH','CLERK','7902','17-DEC-80','800',NULL,'20');
insert into EMP values('7499','ALLEN','SALESMAN','7698','20-FEB-81','1600','300','30');
insert into EMP values('7521','WARD','SALESMAN','7698','22-FEB-81','1250','500','30');
insert into EMP values('7566','JONES','MANAGER','7839','02-APR-81','2975',NULL,'20');
insert into EMP values('7654','MARTIN','SALESMAN','7698','28-SEP-81','1250','1400','30');
insert into EMP values('7698','BLAKE','MANAGER','7839','01-MAY-81','2850',NULL,'30');
insert into EMP values('7782','CLARK','MANAGER','7839','09-JUN-81','2450',NULL,'10');
insert into EMP values('7788','SCOTT','ANALYST','7566','09-DEC-82','3000',NULL,'20');
insert into EMP values('7839','KING','PRESIDENT',NULL,'17-NOV-81','5000',NULL,'10');
insert into EMP values('7844','TURNER','SALESMAN','7698','08-SEP-81','1500','0','30');
insert into EMP values('7876','ADAMS','CLERK','7788','12-JAN-83','1100',NULL,'20');
insert into EMP values('7900','JAMES','CLERK','7698','03-DEC-81','950',NULL,'30');
insert into EMP values('7902','FORD','ANALYST','7566','03-DEC-81','3000',NULL,'20');
insert into EMP values('7934','MILLER','CLERK','7782','23-JAN-82','1300',NULL,'10');
