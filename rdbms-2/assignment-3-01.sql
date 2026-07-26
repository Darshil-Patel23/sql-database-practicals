-- RDBMS-II Assignment 3 — Part 1
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

declare
	cursor e1 is select * from emp10;
	e_rec emp10%rowtype;
begin
	open e1;
	dbms_output.put_line('Empno'||' '||'Ename'||'   '||'Sal'||'   '||'Job'||'      '||'Deptno');
	dbms_output.put_line('----------------------------------------------------------');
	loop
		fetch e1 into e_rec;
		exit when e1%notfound;
		dbms_output.put_line(e_rec.empno||'   '||e_rec.ename||'   '||e_rec.sal||'   '||e_rec.job||'   '||e_rec.deptno);
	end loop;
	close e1;
end;
