-- RDBMS-II Assignment 3 — Part 2
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

declare
	cursor e1 is select * from emp10 where job='&input_job';
	e_rec emp10%rowtype;
	tot_sal number(20):=0;
begin
	open e1;
		dbms_output.put_line(' '||' '||' '||'Empployee Information'||' '||' ');
		dbms_output.put_line(' '||' '||' '||'---------------------'||' '||' ');
		
		dbms_output.put_line('EmployeeN'||'  '||'EmployeeNM'||'      '||'Salary'||'       '||'Comm'||'       '||'Hiredate'||'       '||'DeptNo');
		dbms_output.put_line(' '||' '||' '||'-----------------------------------------------------------------------------'||' '||' ');

		loop
		fetch e1 into e_rec;
		
		tot_sal := tot_sal + e_rec.sal;
		exit when e1%notfound;
			dbms_output.put_line(' '||e_rec.empno||'        '||e_rec.ename||'          '||e_rec.sal||'      '||e_rec.comm||'         '||e_rec.hiredate||'       '||e_rec.deptno);
		
		end loop;
		dbms_output.put_line(' '||' '||' '||'-------------------------------------------------------------------------------'||' '||' ');
		dbms_output.put_line('Job: '||e_rec.job);
		dbms_output.put_line('Total Salary: ' || tot_sal);
	close e1;
end;
