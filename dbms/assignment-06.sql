-- DBMS Assignment 06
-- Course : DBMS — B.Sc. CA&IT
-- Author : Darshilkumar Patel

(1)
SET SERVEROUTPUT ON;

DECLARE
    dpt DEPT%ROWTYPE;
BEGIN
    dpt.DEPTNO := &dept_number;
    
    SELECT * INTO dpt FROM DEPT
    WHERE DEPTNO = dpt.DEPTNO;
    
    DBMS_OUTPUT.PUT_LINE('Department Name: ' || dpt.DNAME);
    DBMS_OUTPUT.PUT_LINE('Location: ' || dpt.LOC);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department with number ' || dpt.DEPTNO || ' does not exist.');
END;
/

(2)
DECLARE
    emp_rec EMP%ROWTYPE;
BEGIN
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    INTO emp_rec
    FROM EMP
    WHERE JOB = UPPER('&J');
    
    DBMS_OUTPUT.PUT_LINE('Employee Number: '|| emp_rec.EMPNO ||' '||'Employee Name: '|| emp_rec.ENAME ||' '||'Job: '||emp_rec.JOB ||' '||'Manager: '|| emp_rec.MGR ||' '||'Hire Date: '|| TO_CHAR(emp_rec.HIREDATE, 'DD-MON-YYYY') ||' '||'Salary: '|| emp_rec.SAL ||' '||'Commission: '|| NVL(TO_CHAR(emp_rec.COMM), 'N/A') ||' '||'Department Number: '|| emp_rec.DEPTNO);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Job Is Not Found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too Many Rows');
END;
/
