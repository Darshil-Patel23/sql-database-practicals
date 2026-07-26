-- DBMS Assignment 04
-- Course : DBMS — B.Sc. CA&IT
-- Author : Darshilkumar Patel

1. Create a function to calculate simple interest. 

create or replace function fun1(p in number ,r in number,n in number)
	return number is si number;
	begin
	si:=(p*r*n)/100;
	return si;
	end;
	/



declare
    si number;
begin
     si:=fun1(12000,12,5);
     dbms_output.put_line('simpale insterest is '||si);
end;
/


2.create or replace function fun2(dno in number,dnm out varchar2)
return varchar2
is
begin
	select dname into dnm from dept where deptno=dno;
        return dnm;
end;
/

declare
       dno number(2);
       dnm varchar2(14);
begin
     dno:='&dno';
     dnm:=fun2(dno,dnm);
     dbms_output.put_line('department name is '||(dnm));
end;
/

3.Create a function to accept employee salary and department number and calculate
bonus.
Rules to calculate bonus:
If Department number=10 then Bonus=5% of salary
If Department number=20 then Bonus=10% of salary
If Department number=30 then Bonus=15% of salary
Else Bonus=20% of salary 


create or replace function fun3 (sal in number,dnn in number)
	return number
	is
	bonus number(10);
	begin

	if dnn=10 then
		bonus:=(sal*5)/100;
	elsif dnn=20 then
		bonus:=(sal*10)/100;
	elsif dnn=30 then
		bonus:=(sal*15)/100;
	else
		bonus:=(sal*20)/100;
	end if;
	
return bonus;
end;
/

declare 

sal number(10):=&sal;
dept_no number(10):=&dept_no;

begin dbms_output.put_line('bonus is '||fun3(sal,dept_no));
end;
/
