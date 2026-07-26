-- DBMS Assignment 06
-- Course : DBMS — B.Sc. CA&IT
-- Author : Darshilkumar Patel

SQL> SET SERVEROUTPUT ON;
SQL>
SQL> DECLARE
  2      dpt DEPT%ROWTYPE;
  3  BEGIN
  4      dpt.DEPTNO := &dept_number;
  5
  6      SELECT * INTO dpt FROM DEPT
  7      WHERE DEPTNO = dpt.DEPTNO;
  8
  9      DBMS_OUTPUT.PUT_LINE('Department Name: ' || dpt.DNAME);
 10      DBMS_OUTPUT.PUT_LINE('Location: ' || dpt.LOC);
 11  EXCEPTION
 12      WHEN NO_DATA_FOUND THEN
 13          DBMS_OUTPUT.PUT_LINE('Department with number ' || dpt.DEPTNO || ' does not exist.');
 14  END;
 15  /
Enter value for dept_number: 40
old   4:     dpt.DEPTNO := &dept_number;
new   4:     dpt.DEPTNO := 40;
Department Name: OPERATIONS
Location: BOSTON

PL/SQL procedure successfully completed.

SQL>


SQL> DECLARE
  2      emp_rec EMP%ROWTYPE;
  3  BEGIN
  4      SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
  5      INTO emp_rec
  6      FROM EMP
  7      WHERE JOB = UPPER('&J');
  8
  9      DBMS_OUTPUT.PUT_LINE('Employee Number: '|| emp_rec.EMPNO ||' '||'Employee Name: '|| emp_rec.ENAME ||' '||'Job: '||emp_rec.JOB ||' '||'Manager: '|| emp_rec.MGR ||' '||'Hire Date: '|| TO_CHAR(emp_rec.HIREDATE, 'DD-MON-YYYY') ||' '||'Salary: '|| emp_rec.SAL ||' '||'Commission: '|| NVL(TO_CHAR(emp_rec.COMM), 'N/A') ||' '||'Department Number: '|| emp_rec.DEPTNO);
 10  EXCEPTION
 11      WHEN NO_DATA_FOUND THEN
 12          DBMS_OUTPUT.PUT_LINE('Job Is Not Found');
 13      WHEN TOO_MANY_ROWS THEN
 14          DBMS_OUTPUT.PUT_LINE('Too Many Rows');
 15  END;
 16  /
Enter value for j: SALESMAN
old   7:     WHERE JOB = UPPER('&J');
new   7:     WHERE JOB = UPPER('SALESMAN');
Too Many Rows

PL/SQL procedure successfully completed.
