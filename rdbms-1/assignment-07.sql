-- Assignment 07
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

(1) select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and d.dname='Accounting';

ENAME      DNAME
---------- ---------------
Clark      Accounting
King       Accounting
Miller     Accounting

(2) select d.deptno,e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and sal>2000;


    DEPTNO ENAME      DNAME
---------- ---------- ---------------
        20 Jones      Research
        30 Blake      Sales
        10 Clark      Accounting
        20 Scott      Research
        10 King       Accounting
        20 Ford       Research

(3)select e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and e.ename LIKE('A%');

ENAME      DNAME
---------- ---------------
Allen      Sales
Adams      Research

(4)select e.ename,d.dname,e.sal from emp e,dept d where e.deptno=d.deptno and e.job in('Clerk','Salesman');

ENAME      DNAME                  SAL
---------- --------------- ----------
Smith      Research               800
Allen      Sales                 1600
Ward       Sales                 1250
Martin     Sales                 1250
Turner     Sales                 1500
Adams      Research              1100
James      Sales                  950
Miller     Accounting            1300

(5)select d.dname,e.ename,d.deptno from emp e,dept d where e.deptno=d.deptno and e.Hiredate<('01-SEP-81');
DNAME           ENAME          DEPTNO
--------------- ---------- ----------
Research        Smith              20
Sales           Allen              30
Sales           Ward               30
Research        Jones              20
Sales           Blake              30
Accounting      Clark              10

(6) select tdetails,charges from treatment;

TDETAILS                                              CHARGES
-------------------------------------------------- ----------
Retina                                                   1200
Root Canal                                                400
Sleep Apnea                                               600
Glaucoma                                                 1500
Tonsil                                                    200
Knee Replacement                                          500
Ear Infection                                             400
Spine                                                     600
Tooth Extraction                                         1000

(7)select p.Pname,a.App_date from patient p,appointment a where p.P_id=a.P_id;
PNAME                     APP_DATE
------------------------- ---------
Rupal Patel               01-DEC-18
Kalpesh Shah              12-OCT-18
Kavita Joshi              26-DEC-18
Sachin Pandya             01-JAN-18
Brijesh Patel             11-SEP-18
Mayank Shah               23-SEP-18
Mitul Soni                16-JAN-18
Krunal Pandya             12-NOV-18
Rinkal Bhatt              16-NOV-18
Pratik Solanki            03-JUL-18
Sachin Pandya             01-DEC-18
Mitul Soni                30-OCT-18

(8) select d.dname,d.spec,a.App_date from doctor d,appointment a where a.d_id=d.d_id;
DNAME                     SPEC                 APP_DATE
------------------------- -------------------- ---------
Jinay Shah                Eye                  01-DEC-18
Sonal Patel               Dental               12-OCT-18
Mehul Patel               ENT                  26-DEC-18
Mukesh Kotiya             Eye                  01-JAN-18
Dharmendra Patel          ENT                  11-SEP-18
Mahesh Patel              Ortho                23-SEP-18
Mehul Patel               ENT                  16-JAN-18
Niraj Shah                Ortho                12-NOV-18
Neerav Parmar             Dental               16-NOV-18
Mehul Patel               ENT                  03-JUL-18
Dharmendra Patel          ENT                  01-DEC-18
Niraj Shah                Ortho                30-OCT-18

(9) select tdetails,charges from treatment where charges>500;
TDETAILS                                              CHARGES
-------------------------------------------------- ----------
Retina                                                   1200
Sleep Apnea                                               600
Glaucoma                                                 1500
Spine                                                     600
Tooth Extraction                                         1000

(10) select p.Pname,a.App_date from patient p,appointment a where to_char(a.App_date,'MON')='DEC' and p.P_id=a.P_id;

PNAME                     APP_DATE
------------------------- ---------
Rupal Patel               01-DEC-18
Kavita Joshi              26-DEC-18
Sachin Pandya             01-DEC-18


(11) select d.dname,p.Pname,t.Tdetails,t.Charges from doctor d,patient p,appointment a,treatment t where d.d_id=a.d_id and p.P_id=a.P_id and t.T_id=a.T_id;

DNAME                     PNAME                     TDETAILS                                              CHARGES
------------------------- ------------------------- -------------------------------------------------- ----------
Jinay Shah                Rupal Patel               Retina                                                   1200
Sonal Patel               Kalpesh Shah              Root Canal                                                400
Mehul Patel               Kavita Joshi              Sleep Apnea                                               600
Mukesh Kotiya             Sachin Pandya             Glaucoma                                                 1500
Dharmendra Patel          Brijesh Patel             Tonsil                                                    200
Mahesh Patel              Mayank Shah               Knee Replacement                                          500
Mehul Patel               Mitul Soni                Ear Infection                                             400
Niraj Shah                Krunal Pandya             Spine                                                     600
Neerav Parmar             Rinkal Bhatt              Tooth Extraction                                         1000
Mehul Patel               Pratik Solanki            Sleep Apnea                                               600
Dharmendra Patel          Sachin Pandya             Tonsil                                                    200 
Niraj Shah                Mitul Soni                Spine                                                     600

(12) select a.a_id,a.App_date,p.Pname,d.dname,t.Tdetails from appointment a,treatment t,patient p,doctor d where a.d_id=d.d_id and a.P_id=p.P_id and a.T_id=t.T_id and d.dname = 'Dharmendra Patel';

      A_ID APP_DATE  PNAME                     DNAME                     TDETAILS
---------- --------- ------------------------- ------------------------- --------------------------------------------------
    201805 11-SEP-18 Brijesh Patel             Dharmendra Patel          Tonsil
    201811 01-DEC-18 Sachin Pandya             Dharmendra Patel          Tonsil
(12A) select a.a_id,a.d_id,a.App_date,a.Duration,a.Status,d.dname,p.P_id,p.Pname,p.Bdate,p.Paddr,p.Gender,t.T_id,t.Tdetails,t.Charges from appointment a,treatment t,patient p,doctor d where a.d_id=d.d_id and a.P_id=p.P_id and a.T_id=t.T_id and d.dname = 'Dharmendra Patel';

      A_ID D_I APP_DATE    DURATION STATUS DNAME                     P_I PNAME                     BDATE     PADDR                               GENDER T_I TDETAILS                                              CHARGES
---------- --- --------- ---------- ------ ------------------------- --- ------------------------- --------- ----------------------------------- ------ --- -------------------------------------------------- ----------
    201805 D01 11-SEP-18         40 C      Dharmendra Patel          P05 Brijesh Patel             15-MAR-95 Nadiad                              F      T05 Tonsil                                                    200
    201811 D01 01-DEC-18         50 C      Dharmendra Patel          P04 Sachin Pandya             04-FEB-89 Anand                               M      T05 Tonsil                                                    200 

(13) select p.Pname from patient p,doctor d,appointment a where p.P_id=a.P_id and a.d_id=d.d_id and d.dname='Mehul Patel'; 
PNAME
-------------------------
Kavita Joshi
Mitul Soni
Pratik Solanki

(14) select p.Pname from patient p,appointment a where p.p_id=a.p_id and a.status='I';

PNAME
-------------------------
Kavita Joshi
Mitul Soni
Krunal Pandya
Pratik Solanki
Mitul Soni

(15)  select p.Pname,Months_between(sysdate,bdate)/12 from patient p,appointment a where gender='M' and p.p_id=a.p_id and a.status='I';

PNAME                     MONTHS_BETWEEN(SYSDATE,BDATE)/12
------------------------- --------------------------------
Mitul Soni                                      27.0833333
Krunal Pandya                                   53.6874876
Pratik Solanki                                  36.2654446
Mitul Soni                                      27.0833333

(16)  Select ename from emp where job = 'Manager';

ENAME
----------
Jones
Blake
Clark
