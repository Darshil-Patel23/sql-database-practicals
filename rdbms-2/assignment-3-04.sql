-- RDBMS-II Assignment 3 — Part 4
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

declare
	cursor cur_emp is select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal,e.comm,e.hiredate from dept d,emp e where d.deptno=e.deptno
        ORDER BY d.deptno, e.empno;
	e_rec cur_emp%rowtype;
        prev_deptno dept.deptno%TYPE;
begin
	open cur_e1;
		dbms_output.put_line('     '||'         '||'------------------------------------'||'   '||'    ');
		dbms_output.put_line('     '||'         '||'Department wise Employee Infromation'||'   '||'    ');
		dbms_output.put_line('     '||'         '||'------------------------------------'||'   '||'    ');
		dbms_output.put_line('Deptno='||e_rec.deptno||'    '||'DName='||e_rec.dname);
		dbms_output.put_line('-------------------------------------------------------------------------------');
		dbms_output.put_line('Empno'||'      '||'EmpNm'||'          '||'Job'||'         '||'Sal'||'        '||'Comm'||'      '||'HireD');
		dbms_output.put_line('-------------------------------------------------------------------------------');
	loop
		fetch cur_e1 into e_rec;
		exit when cur_e1%notfound;
		dbms_output.put_line('Deptno='||e_rec.deptno||'    '||'DName='||e_rec.dname);
		dbms_output.put_line('-------------------------------------------------------------------------------');
		dbms_output.put_line('Empno'||'      '||'EmpNm'||'          '||'Job'||'         '||'Sal'||'        '||'Comm'||'      '||'HireD');
		dbms_output.put_line('-------------------------------------------------------------------------------');
		dbms_output.put_line(e_rec.empno||'       '||e_rec.ename||'       '||e_rec.job||'       '||e_rec.sal||'     '||e_rec.comm||'        '||e_rec.hiredate);
		dbms_output.put_line('-------------------------------------------------------------------------------');

	end loop;
	close cur_e1;
end;


DECLARE
  cursor cur_emp is select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal,e.comm,e.hiredate from dept d,emp e where d.deptno=e.deptno
        ORDER BY d.deptno, e.empno;
	e_rec cur_emp%rowtype;
        prev_deptno dept.deptno%TYPE;

  emp_rec cur_emp%ROWTYPE;
  prev_deptno dept.deptno%TYPE;
BEGIN

  OPEN cur_emp;

  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('            Department wise Employee Information');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');

  LOOP
    FETCH cur_emp INTO emp_rec;
    EXIT WHEN cur_emp%NOTFOUND;

    IF cur_emp%ROWCOUNT = 1 OR emp_rec.deptno != prev_deptno THEN
      DBMS_OUTPUT.PUT_LINE('Department No. : ' || emp_rec.deptno || ' Department Name: ' || emp_rec.dname);
      DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
      DBMS_OUTPUT.PUT_LINE('Employee Number     Employee Name     Job     Salary     Commission     Hiredate');
      DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD(emp_rec.empno, 19)||RPAD(emp_rec.ename, 17)||RPAD(emp_rec.job, 11)||RPAD(NVL(TO_CHAR(emp_rec.sal), ' '), 11)||RPAD(NVL(TO_CHAR(emp_rec.comm), ' '), 14) ||TO_CHAR(emp_rec.hiredate, 'DD-MON-YY'));

    prev_deptno := emp_rec.deptno;
  END LOOP;

  CLOSE cur_emp;
END;
/
