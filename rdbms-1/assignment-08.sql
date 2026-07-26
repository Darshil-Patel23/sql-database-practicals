-- Assignment 08
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

(1)SELECT d.deptno, d.dname, COUNT(e.empno) AS TotalEmployees FROM dept d, emp e WHERE d.deptno = e.deptno GROUP BY d.deptno, d.dname;
   
    DEPTNO DNAME           TOTALEMPLOYEES
---------- --------------- --------------
        20 Research                     5
        30 Sales                        6
        10 Accounting                   3


(2)SELECT d.dname, SUM(e.sal) AS TotalClerkSalary FROM dept d, emp e WHERE d.deptno = e.deptno AND e.job = 'Clerk' GROUP BY d.dname;
  DNAME           TOTALCLERKSALARY
--------------- ----------------
Research                    1900
Accounting                  1300
Sales                        950

(3)SELECT d.dname, MIN(e.sal) AS MinimumSalesmanSalary FROM dept d, emp e WHERE d.deptno = e.deptno AND e.job = 'Salesman' GROUP BY d.dname HAVING MIN(e.sal) > 4000;
   no rows selected


(4)SELECT SUM(t.Charges) AS TotalAmountReceived FROM treatment t, appointment a, doctor d WHERE a.T_id = t.T_id AND a.d_id = d.d_id AND d.dname = 'Mehul Patel';
  TOTALAMOUNTRECEIVED
-------------------
               1600

(5)SELECT d.dname FROM doctor d, appointment a WHERE d.d_id = a.d_id GROUP BY d.dname HAVING COUNT(DISTINCT a.P_id) >= 2;

   DNAME
-------------------------
Dharmendra Patel
Mehul Patel
Niraj Shah

(6) SELECT d.dname AS DoctorName, COUNT(DISTINCT a.P_id) AS TotalPatientsTreated FROM appointment a, doctor d WHERE a.d_id = d.d_id GROUP BY d.dname;
  
    DOCTORNAME                TOTALPATIENTSTREATED
------------------------- --------------------
Dharmendra Patel                             2
Jinay Shah                                   1
Mahesh Patel                                 1
Mehul Patel                                  3
Mukesh Kotiya                                1
Neerav Parmar                                1
Niraj Shah                                   2
Sonal Patel                                  1
