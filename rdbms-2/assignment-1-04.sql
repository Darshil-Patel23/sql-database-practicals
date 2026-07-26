-- RDBMS-II Assignment 1 — Part 4
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

create table patient_detail
(pid number(2) primary key,
pnm varchar2(20),
docid varchar2(3) References doctor_master(docid),
cons_fee number(3),
medi_amt number(3),
test_fee number(4));

insert into patient_detail values('1','PURAV','D01','100','300','0');
insert into patient_detail values('2','SONU','D02','150','700','3000');
insert into patient_detail values('5','PURAV','D05','80','200','500');
insert into patient_detail values('4','NEHA','D03','200','110','0');
insert into patient_detail values('6','PURAV','D05','50','650','200');
insert into patient_detail values('3','NIRAJ','D03','150','800','1000');
insert into patient_detail values('7','SONU','D03','175','350','0');
insert into patient_detail values('8','NIRAJ','D02','75','150','0');
