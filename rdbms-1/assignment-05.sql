-- Assignment 05
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

1)
> select empno,ename,sal,to_char(hiredate,'DDTH-MON,YYYY') hiredate from emp;
>
    EMPNO ENAME             SAL HIREDATE
---------- ---------- ---------- -------------
      7369 Smith             800 17TH-DEC,1980
      7499 Allen            1600 20TH-FEB,1981
      7521 Ward             1250 22ND-FEB,1981
      7566 Jones            2975 02ND-APR,1981
      7654 Martin           1250 28TH-SEP,1981
      7698 Blake            2850 01ST-MAY,1981
      7782 Clark            2450 09TH-JUN,1981
      7788 Scott            3000 09TH-DEC,1982
      7839 King             5000 17TH-NOV,1981
      7844 Turner           1500 08TH-SEP,1981
      7876 Adams            1100 12TH-JAN,1983
      7900 James             950 03RD-DEC,1981
      7902 Ford             3000 03RD-DEC,1981
      7934 Miller           1300 23RD-JAN,1982

2)
SQL> select empno,ename,job,sal,to_char(hiredate,'ddspth month,yy') hiredate from emp;

    EMPNO ENAME      JOB               SAL HIREDATE
---------- ---------- ---------- ---------- ---------------------------
      7369 Smith      Clerk             800 seventeenth december ,80
      7499 Allen      Salesman         1600 twentieth february ,81
      7521 Ward       Salesman         1250 twenty-second february ,81
      7566 Jones      Manager          2975 second april    ,81
      7654 Martin     Salesman         1250 twenty-eighth september,81
      7698 Blake      Manager          2850 first may      ,81
      7782 Clark      Manager          2450 ninth june     ,81
      7788 Scott      Analyst          3000 ninth december ,82
      7839 King       President        5000 seventeenth november ,81
      7844 Turner     Salesman         1500 eighth september,81
      7876 Adams      Clerk            1100 twelfth january  ,83
      7900 James      Clerk             950 third december ,81
      7902 Ford       Analyst          3000 third december ,81
      7934 Miller     Clerk            1300 twenty-third january  ,82

3)
SQL> select empno,ename,job,sal from emp where to_char(hiredate,'month')='september';

     EMPNO ENAME      JOB               SAL
---------- ---------- ---------- ----------
      7654 Martin     Salesman         1250
      7844 Turner     Salesman         1500

4)
SQL> select empno,ename,comm from emp where to_char(hiredate,'DY')='MON';

     EMPNO ENAME            COMM
---------- ---------- ----------
      7654 Martin           1400

5)SQL> select sysdate +15 from dual;

SYSDATE+1
---------
21-SEP-23

6)
SQL> select * from emp where months_between (sysdate,'17-Dec-81')/12>20;

     EMPNO ENAME      JOB               MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- ---------- ---------- --------- ---------- ---------- ----------
      7369 Smith      Clerk            7902 17-DEC-80        800                    20
      7499 Allen      Salesman         7698 20-FEB-81       1600        300         30
      7521 Ward       Salesman         7698 22-FEB-81       1250        500         30
      7566 Jones      Manager          7839 02-APR-81       2975                    20
      7654 Martin     Salesman         7698 28-SEP-81       1250       1400         30
      7698 Blake      Manager          7839 01-MAY-81       2850                    30
      7782 Clark      Manager          7839 09-JUN-81       2450                    10
      7788 Scott      Analyst          7566 09-DEC-82       3000                    20
      7839 King       President             17-NOV-81       5000                    10
      7844 Turner     Salesman         7698 08-SEP-81       1500          0         30
      7876 Adams      Clerk            7788 12-JAN-83       1100                    20
      7900 James      Clerk            7698 03-DEC-81        950                    30
      7902 Ford       Analyst          7566 03-DEC-81       3000                    20
      7934 Miller     Clerk            7782 23-JAN-82       1300                    10
