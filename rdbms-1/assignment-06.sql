-- Assignment 06
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

1)
SELECT d.deptno, d.dname, COUNT(e.empno) AS TotalEmployees
FROM dept d, emp e
WHERE d.deptno = e.deptno
GROUP BY d.deptno, d.dname;

    DEPTNO DNAME           TOTAL_EMPLOYEES
---------- --------------- ---------------
        20 Research                      5
        30 Sales                         6
        10 Accounting                    3
        40 Operations                    0

2)
SELECT d.deptno,
       d.dname,
       COUNT(e.empno) FILTER (WHERE e.job = 'Salesman') AS total_salesmen,
       COUNT(e.empno) FILTER (WHERE e.job = 'Clerk') AS total_clerks
FROM dept d, emp e
WHERE d.deptno = e.deptno
GROUP BY d.deptno, d.dname
ORDER BY d.deptno;




3)
  SELECT d.deptno, d.dname, MAX(e.sal) AS max_salary
  2  FROM dept d
  3  INNER JOIN emp e ON d.deptno = e.deptno
  4  GROUP BY d.deptno, d.dname;

    DEPTNO DNAME           MAX_SALARY
---------- --------------- ----------
        20 Research              3000
        30 Sales                 2850
        10 Accounting            5000
4)
SQL> SELECT d.deptno, d.dname, AVG(e.sal) as average_salary
  2  FROM dept d
  3  LEFT JOIN emp e ON d.deptno = e.deptno
  4  GROUP BY d.deptno, d.dname;

    DEPTNO DNAME           AVERAGE_SALARY
---------- --------------- --------------
        20 Research                  2175
        30 Sales               1566.66667
        10 Accounting          2916.66667
        40 Operations
5)
SELECT job, SUM(comm) AS total_commission
FROM emp
GROUP BY job;
JOB        TOTAL_COMMISSION
---------- ----------------
Clerk
Manager
Analyst
President
Salesman               2200

6)
SELECT d.deptno, d.dname,
       SUM(CASE WHEN e.job IN ('Clerk', 'Analyst') THEN e.sal ELSE 0 END) AS total_salary
FROM dept d
LEFT JOIN emp e ON d.deptno = e.deptno
GROUP BY d.deptno, d.dname;
  DEPTNO DNAME           TOTAL_SALARY
---------- --------------- ------------
        20 Research                7900
        30 Sales                    950
        10 Accounting              1300
        40 Operations                 0


7)
  SELECT e.ename, d.dname, e.deptno
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE e.sal > 5000;


8)
SELECT e.deptno, e.sal
FROM emp e
WHERE e.deptno IN (
  SELECT deptno
  FROM emp
  GROUP BY deptno
  HAVING COUNT(*) > 2
);

   DEPTNO        SAL
---------- ----------
        30        950
        30       1500
        30       2850
        30       1250
        30       1250
        30       1600
        20       3000
        20       1100
        20       3000
        20       2975
        20        800
        10       1300
        10       5000
        10       2450

9)

 SELECT DEPTNO,SAL
  2  FROM EMP
  3  GROUP BY DEPTNO,SAL
  4  HAVING SUM(SAL) < 2000;

    DEPTNO        SAL
---------- ----------
        20        800
        30        950
        20       1100
        10       1300
        30       1600
        30       1500
 

10)
  SQL> SELECT Paddr, COUNT(P_id) AS total_patients
  2    FROM patient
  3    GROUP BY Paddr;

PADDR                               TOTAL_PATIENTS
----------------------------------- --------------
Anand                                            3
Nadiad                                           1
Baroda                                           2
Navsari                                          1
Surat                                            2
Rajkot                                           1


11)

SELECT spec,COUNT(d_id) AS total_doctors
  2  FROM doctor
  3  GROUP BY spec;

SPEC                 TOTAL_DOCTORS
-------------------- -------------
Ortho                            2
ENT                              2
Eye                              2
Dental                           2

12)

SELECT Paddr,COUNT(P_id) AS total_male_patients
FROM patient
WHERE gender = 'M'
GROUP BY Paddr;

PADDR                               TOTAL_MALE_PATIENTS
----------------------------------- -------------------
Anand                                                 2
Baroda                                                2
Navsari                                               1
Surat                                                 1
Rajkot                                                1

13)

SELECT COUNT(d_id) AS total_eye_doctors
FROM doctor
WHERE spec = 'Eye';

TOTAL_EYE_DOCTORS
-----------------
                2



SELECT deptno, COUNT(*) as total_employ
FROM emp
GROUP BY deptno;



SELECT deptno, job, MAX(sal) as max_salary
FROM emp
GROUP BY deptno, job;
