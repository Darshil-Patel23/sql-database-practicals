-- DBMS Assignment 03
-- Course : DBMS — B.Sc. CA&IT
-- Author : Darshilkumar Patel

(1)
SET SERVEROUTPUT ON;
DECLARE
    CURSOR cur_emp IS
        SELECT * FROM EMP;
    e_rec EMP%ROWTYPE;
BEGIN
    OPEN cur_emp;
    DBMS_OUTPUT.PUT_LINE(RPAD('Empno', 6) || ' ' ||RPAD('Ename', 10) || ' ' ||RPAD('Sal', 7) || ' ' ||RPAD('Job', 9) || ' ' ||RPAD('Deptno', 9));
    DBMS_OUTPUT.PUT_LINE(RPAD('-', 6, '-') || ' ' ||RPAD('-', 10, '-') || ' ' ||RPAD('-', 7, '-') || ' ' ||RPAD('-', 9, '-') || ' ' ||RPAD('-', 9, '-'));
    LOOP
        FETCH cur_emp INTO e_rec;
        EXIT WHEN cur_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(RPAD(e_rec.EMPNO, 6) || ' ' ||RPAD(e_rec.ENAME, 10) || ' ' ||RPAD(TO_CHAR(e_rec.SAL), 7) || ' ' ||RPAD(e_rec.JOB, 9) || ' ' ||RPAD(TO_CHAR(e_rec.DEPTNO), 9));
    END LOOP;
    CLOSE cur_emp;
END;
/

Empno  Ename      Sal     Job       Deptno
------ ---------- ------- --------- ---------
7369   SMITH      800     CLERK     20
7499   ALLEN      1600    SALESMAN  30
7521   WARD       1250    SALESMAN  30
7566   JONES      2975    MANAGER   20
7654   MARTIN     1250    SALESMAN  30
7698   BLAKE      2850    MANAGER   30
7782   CLARK      2450    MANAGER   10
7788   SCOTT      3000    ANALYST   20
7839   KING       5000    PRESIDENT 10
7844   TURNER     1500    SALESMAN  30
7876   ADAMS      1100    CLERK     20   
7900   JAMES      950     CLERK     30
7902   FORD       3000    ANALYST   20
7934   MILLER     1300    CLERK     10

(2)
SET SERVEROUTPUT ON;

DECLARE
    jb EMP.JOB%TYPE;
    CURSOR emp_cursor IS
        SELECT * FROM EMP WHERE JOB = jb;
    emp_record emp_cursor%ROWTYPE;
    tot_sal NUMBER := 0;
BEGIN
    jb :=('&job');
    DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||chr(9)||chr(9)||'Employee Information');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Job : ' || jb);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Employee Number     Employee Name        Salary        Commission        Hiredate          Department Number');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------------');
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(RPAD(emp_record.EMPNO, 20)||RPAD(emp_record.ENAME, 22)||RPAD(TO_CHAR(emp_record.SAL), 15)||RPAD(NVL(TO_CHAR(emp_record.COMM),' '),15)||RPAD(TO_CHAR(emp_record.HIREDATE, 'DD-MON-YY'), 20) ||RPAD(emp_record.DEPTNO, 20));
        tot_sal:= tot_sal + emp_record.SAL + NVL(emp_record.COMM, 0);
    END LOOP;
    CLOSE emp_cursor;
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Salary: ' ||tot_sal);
END;
/
o/p:
Enter value for job: SALESMAN
old   8:     jb :=('&job');
new   8:     jb :=('SALESMAN');
                                        Employee Information
----------------------------------------------------------------------------------------------------------------
Job : SALESMAN
----------------------------------------------------------------------------------------------------------------
Employee Number     Employee Name        Salary        Commission        Hiredate          Department Number
----------------------------------------------------------------------------------------------------------------
7499                ALLEN                 1600           300            20-FEB-81           30
7521                WARD                  1250           500            22-FEB-81           30
7654                MARTIN                1250           1400           28-SEP-81           30
7844                TURNER                1500           0              08-SEP-81           30
----------------------------------------------------------------------------------------------------------------
Total Salary: 7800

PL/SQL procedure successfully completed.



(3)
DECLARE
    CURSOR bill_cursor IS
        SELECT e.CUST_NO,e.CUST_NAME,d.PREV_READ,d.CURR_READ,d.UNIT_PRICE FROM CUSTOMER_DTL d, CUSTOMER_MST e WHERE e.CUST_NO = d.CUST_NO;
    bill_record bill_cursor%ROWTYPE;
    tot_price NUMBER(30);
    unit NUMBER(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||chr(9)||chr(9)||'-----------------------------');
    DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||chr(9)||chr(9)||'   Electricity Bill Report');
    DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||chr(9)||chr(9)||'-----------------------------');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Customer Number    Customer Name    Previous Reading    Current Reading    Consumption    Unit    Total Price    Bill');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------------------');

    FOR bill_record IN bill_cursor LOOP
    
        unit := bill_record.CURR_READ - bill_record.PREV_READ;
        tot_price := unit * bill_record.UNIT_PRICE;

        DBMS_OUTPUT.PUT_LINE(RPAD(bill_record.CUST_NO, 20)||RPAD(bill_record.CUST_NAME, 18)||RPAD(bill_record.PREV_READ, 19)||RPAD(bill_record.CURR_READ, 18)||RPAD(unit, 15)||RPAD(bill_record.UNIT_PRICE,11)||RPAD(tot_price, 14));
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------------------');
END;
/
o/p:
                                        -----------------------------
                                           Electricity Bill Report
                                        -----------------------------
---------------------------------------------------------------------------------------------------------------------
Customer Number    Customer Name    Previous Reading    Current Reading    Consumption    Unit    Total Price    Bill
---------------------------------------------------------------------------------------------------------------------
ANA001              ANUJ PATEL        1200               2500              1300           5.5        7150
VVN001              SURAJ SHAH        275                365               90             5.5        495
ANA002              BINITA THAKKAR    145                570               425            5.5        2338
BAK001              ANIL PATEL        45                 145               100            5.5        550
VVN002              VIJAY RAY         600                680               80             5.5        440
ANA003              ROMA BHATT        2500               2650              150            5.5        825
---------------------------------------------------------------------------------------------------------------------



(4)
DECLARE
  CURSOR cur_emp IS
    SELECT d.deptno, d.dname, e.empno, e.ename, e.job, e.sal, e.comm, e.hiredate
    FROM dept d, emp e
    WHERE d.deptno = e.deptno
    ORDER BY d.deptno, e.empno;

  emp_rec cur_emp%ROWTYPE;
  prev_deptno dept.deptno%TYPE;
BEGIN
  OPEN cur_emp;

  DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||'------------------------------------');
  DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||'Department wise Employee Information');
  DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||'------------------------------------');

  LOOP
    FETCH cur_emp INTO emp_rec;
    EXIT WHEN cur_emp%NOTFOUND;

    IF cur_emp%ROWCOUNT = 1 OR emp_rec.deptno != prev_deptno THEN
      DBMS_OUTPUT.PUT_LINE('Department No. : ' || emp_rec.deptno || ' Department Name: ' || emp_rec.dname);
      DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
      DBMS_OUTPUT.PUT_LINE('Employee Number     Employee Name     Job     Salary     Commission     Hiredate');
      DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------------------');
    END IF;

    DBMS_OUTPUT.PUT_LINE(RPAD(emp_rec.empno, 19)|| RPAD(emp_rec.ename, 17)|| RPAD(emp_rec.job, 11)||RPAD(NVL(TO_CHAR(emp_rec.sal), ' '), 11)|| RPAD(NVL(TO_CHAR(emp_rec.comm), ' '), 14)||TO_CHAR(emp_rec.hiredate, 'DD-MON-YY'));

    prev_deptno := emp_rec.deptno;
  END LOOP;

  CLOSE cur_emp;
END;
/

                        ------------------------------------
                        Department wise Employee Information
                        ------------------------------------
Department No. : 10 Department Name: ACCOUNTING
--------------------------------------------------------------------------------
Employee Number     Employee Name     Job     Salary     Commission     Hiredate
--------------------------------------------------------------------------------
7782               CLARK            MANAGER    2450                     09-JUN-81
7839               KING             PRESIDENT  5000                     17-NOV-81
7934               MILLER           CLERK      1300                     23-JAN-82
Department No. : 20 Department Name: RESEARCH
--------------------------------------------------------------------------------
Employee Number     Employee Name     Job     Salary     Commission     Hiredate
--------------------------------------------------------------------------------
7369               SMITH            CLERK      800                      17-DEC-80
7566               JONES            MANAGER    2975                     02-APR-81
7788               SCOTT            ANALYST    3000                     09-DEC-82
7876               ADAMS            CLERK      1100                     12-JAN-83
7902               FORD             ANALYST    3000                     03-DEC-81
Department No. : 30 Department Name: SALES
--------------------------------------------------------------------------------
Employee Number     Employee Name     Job     Salary     Commission     Hiredate
--------------------------------------------------------------------------------
7499               ALLEN            SALESMAN   1600       300           20-FEB-81
7521               WARD             SALESMAN   1250       500           22-FEB-81
7654               MARTIN           SALESMAN   1250       1400          28-SEP-81
7698               BLAKE            MANAGER    2850                     01-MAY-81
7844               TURNER           SALESMAN   1500       0             08-SEP-81
7900               JAMES            CLERK      950                      03-DEC-81

(5)
DECLARE
  CURSOR cur_d1 IS
    SELECT d.docid, d.dnm, d.case_fee,p.pid, p.pnm, p.cons_fee, p.medi_amt, p.test_fee FROM doctor_master d, patient_detail p WHERE d.docid = p.docid
    ORDER BY d.docid, p.pid;

  d_rec cur_d1%ROWTYPE;
  prev_docid doctor_master.docid%TYPE;
  tot_amt NUMBER(7,2) := 0;
BEGIN
  OPEN cur_d1;

  DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||'------------------------------------------------');
  DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||'          DOCTORWISE PATIENT REPORT');
  DBMS_OUTPUT.PUT_LINE(chr(9)||chr(9)||chr(9)||'------------------------------------------------');

  LOOP
    FETCH cur_d1 INTO d_rec;
    EXIT WHEN cur_d1%NOTFOUND;

    IF cur_d1%ROWCOUNT = 1 OR d_rec.docid != prev_docid THEN
      DBMS_OUTPUT.PUT_LINE('Doctor ID: ' || d_rec.docid || '      Doctor: ' || d_rec.dnm || '      Case fee: ' || d_rec.case_fee);
      DBMS_OUTPUT.PUT_LINE('Patient ID      Patient Name      Consulting fee      Medicine amount      Test fee      Total amount');
      DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------------------------');
    END IF;

    tot_amt := d_rec.cons_fee + d_rec.medi_amt + d_rec.test_fee;

    DBMS_OUTPUT.PUT_LINE(RPAD(d_rec.pid, 16) || RPAD(d_rec.pnm, 20) ||RPAD(d_rec.cons_fee, 20) || RPAD(d_rec.medi_amt, 20) ||RPAD(d_rec.test_fee, 15) || tot_amt);

    prev_docid := d_rec.docid;
  END LOOP;

  CLOSE cur_d1;
END;
/

o/p;


                        ------------------------------------------------
                                  DOCTORWISE PATIENT REPORT
                        ------------------------------------------------
Doctor ID: D01      Doctor: Viraj Patel      Case fee: 300
Patient ID      Patient Name      Consulting fee      Medicine amount      Test fee      Total amount
------------------------------------------------------------------------------------------------------
1               Purav               100                 300                 0              400
Doctor ID: D02      Doctor: Roshni Bhatt      Case fee: 500
Patient ID      Patient Name      Consulting fee      Medicine amount      Test fee      Total amount
------------------------------------------------------------------------------------------------------
2               Sonu                150                 700                 3000           3850
8               Niraj               75                  150                 0              225
Doctor ID: D03      Doctor: Alok Sinha      Case fee: 400
Patient ID      Patient Name      Consulting fee      Medicine amount      Test fee      Total amount
------------------------------------------------------------------------------------------------------
4               Meha                200                 110                 0              310
6               Niraj               150                 800                 1000           1950
7               Sonu                175                 350                 0              525
Doctor ID: D05      Doctor: Mansi Joshi      Case fee: 250
Patient ID      Patient Name      Consulting fee      Medicine amount      Test fee      Total amount
------------------------------------------------------------------------------------------------------
3               Purav               80                  200                 500            780
5               Purav               50                  650                 200            900

PL/SQL procedure successfully completed.
