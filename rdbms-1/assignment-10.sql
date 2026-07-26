-- Assignment 10
-- Course : RDBMS-I — B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel

(1)  alter table cust modify(cust_id varchar2(20));

Table altered.

SQL> desc cust;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUST_ID                                            VARCHAR2(20)
 LNAME                                              CHAR(10)
 FNAME                                              CHAR(10)
 AREA                                               VARCHAR2(10)
 PHONE_NO                                           NUMBER(10)

(2) SQL> alter table cust modify(fname,lname varchar2(15));

Table altered.

SQL> desc cust;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUST_ID                                            VARCHAR2(20)
 LNAME                                              VARCHAR2(15)
 FNAME                                              CHAR(10)
 AREA                                               VARCHAR2(10)
 PHONE_NO                                           NUMBER(10)

(3)  alter table cust add(gender char(1));

> desc cust;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUST_ID                                            VARCHAR2(20)
 LNAME                                              VARCHAR2(15)
 FNAME                                              CHAR(10)
 AREA                                               VARCHAR2(10)
 PHONE_NO                                           NUMBER(10)
 GENDER                                             CHAR(1)                    
 
(4) UPDATE movie SET star = 'Akshay Kumar' WHERE mv_no = 1;
   
     select * from movie;

     MV_NO TITLE                     TYPE       STAR                           PRICE
---------- ------------------------- ---------- ------------------------- ----------
         1 Hera Pheri                Comedy     Akshay Kumar                     105
         2 Kuch Kuch Hota hain       Romantic   Kajol                            225
         3 Drashyam                  Suspence   Ajay Devgan                      250
         4 Welcome                   Comedy     Anil Kapoor                      200
         5 Gupt                      Suspence   Bobby Deol                       195
         6 Tere Naam                 Romantic   Salman Khan                      190
         7 Humgama                   Comedy     Akshay Khanna                    135
         8 Ajnabee                   Suspence   Akshay Kumar                     165
         9 No Entry                  Comedy     Anil Kapoor                      220
        10 Singham                   Action     Ajay Devgan                      195

(5) UPDATE cust SET area = 'Surat' WHERE cust_id = 'a01';

   select * from cust;

CUST_ID              LNAME           FNAME      AREA         PHONE_NO G
-------------------- --------------- ---------- ---------- ---------- -
a01                  Patel           Ajay       Surat          381334
a02                  Shah            Anjali     Surat          556037
a03                  Thakkar         Vinay      Baroda         372631
a04                  Joshi           Kamal      Surat          666612
a05                  Pandya          Rohan      Anand
a06                  Patel           Kajal      Baroda         512527
