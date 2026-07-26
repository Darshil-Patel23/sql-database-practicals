-- DBMS Assignment 05
-- Course : DBMS — B.Sc. CA&IT
-- Author : Darshilkumar Patel

1. Write a procedure to accept two numbers and return summation and subtraction of
two numbers. 

create or replace procedure p2(n1 in number,n2 in number,sum out number,sub out number)
is 
begin
	sum:=n1+n2;
	sub:=n1-n2;
	end;
/

declare 
r number(10);
sm number(10);
sb number(10);
n1 number(10):=&n1;
n2 number(10):=&n2;
begin
p2(n1,n2,sm,sb);
dbms_output.put_line('Summation is '||sm);
dbms_output.put_line('Substraction is '||sb);
end;
/



2. Write a procedure to accept marks of 3 subjects and return total and percentage. 

create or replace procedure p1(m1 in number,m2 in number,m3 in number,total out number,per out number)

is
begin
total:=m1+m2+m3;
per := total/3;
end;
/

declare

m1 number(4);
m2 number(4);
m3 number(4);
total number(5);
per number(5,2);

begin

m1:= &m1;
m2:= &m2;
m3:= &m3;

p1(m1,m2,m3,total,per);
dbms_output.put_line('total is '||total);
dbms_output.put_line('percentage is '||per);
end;
/




3. Write a procedure to accept employee number. Return employee name and job of
the employee. 

create or replace procedure p3(eno in number,enm out varchar2,jb out varchar2)

is begin

select ENAME,JOB into enm,jb from EMP where EMPNO=eno;

end;
/

declare
EMPNO number(7);
ENAME varchar(10);
JOB varchar(10);

begin
EMPNO:=&eno;
p3(EMPNO,ENAME,JOB);
dbms_output.put_line('Employee Name is '||ENAME);
dbms_output.put_line('Employee Job is '||JOB);
end;
/
