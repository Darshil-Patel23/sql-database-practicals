-- Assignment 09
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

(1)
SQL> SELECT empno, ename, sal FROM emp WHERE sal = (SELECT sal FROM emp WHERE ename = 'Ward');

     EMPNO ENAME             SAL
---------- ---------- ----------
      7521 Ward             1250
      7654 Martin           1250 




(2)SELECT empno, ename, job FROM emp WHERE job = (SELECT job FROM emp WHERE ename = 'Ward');
  
     EMPNO ENAME      JOB
---------- ---------- ----------
      7499 Allen      Salesman
      7521 Ward       Salesman
      7654 Martin     Salesman
      7844 Turner     Salesman
 

(3) SELECT Tdetails FROM treatment WHERE T_id IN (SELECT T_id FROM appointment WHERE d_id IN (SELECT d_id FROM doctor WHERE Dcity = 'Anand'));
   TDETAILS
--------------------------------------------------
Sleep Apnea
Ear Infection
Spine
Root Canal
Tonsil



(4)SELECT Pname FROM patient WHERE Bdate <= (SELECT TO_DATE('01-JAN-1995', 'DD-MON-YYYY') FROM dual) AND P_id IN (SELECT P_id FROM appointment WHERE Status = 'C');
   PNAME
-------------------------
Sachin Pandya
Mayank Shah





(5)SELECT dname FROM doctor WHERE d_id IN (SELECT d_id FROM appointment WHERE P_id IN (SELECT P_id FROM patient WHERE Gender = 'M'));
   
   DNAME
-------------------------
Sonal Patel
Niraj Shah
Neerav Parmar
Mahesh Patel
Dharmendra Patel
Mehul Patel
Mukesh Kotiya
