-- Assignment 06 (Theta Join Style)
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

SELECT d.deptno, d.dname, COUNT(e.empno) AS total_employees
FROM dept d, emp e
WHERE d.deptno = e.deptno
GROUP BY d.deptno, d.dname;


2)SELECT d.deptno,
       d.dname,
       COUNT(CASE WHEN e.job = 'Salesman' THEN 1 END) AS total_salesmen,
       COUNT(CASE WHEN e.job = 'Clerk' THEN 1 END) AS total_clerks
FROM dept d, emp e
WHERE d.deptno = e.deptno
GROUP BY d.deptno, d.dname
ORDER BY d.deptno;

3)
