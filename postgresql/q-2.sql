-- q-2
-- Course : Databases (PostgreSQL & MongoDB) — M.Sc. IT Sem II
-- Author : Darshilkumar Patel

alter table students ADD column phone_number numeric(11) unique;

select * from students;

alter table students rename to university_students ;

alter table university_students drop column email;

select * from university_students;

alter table university_students alter column phone_number set not null;

update university_students set phone_number = 12345678901 where id = 1;
update university_students set phone_number = 12345678902 where id = 2;
update university_students set phone_number = 12345678903 where id = 3;
update university_students set phone_number = 12345678904 where id = 4;
update university_students set phone_number = 12345678905 where id = 5;
update university_students set phone_number = 12345678906 where id = 6;
update university_students set phone_number = 12345678907 where id = 7;
update university_students set phone_number = 12345678908 where id = 8;
update university_students set phone_number = 12345678909 where id = 9;
update university_students set phone_number = 12345678911 where id = 10;
update university_students set phone_number = 12345678912 where id = 11;
update university_students set phone_number = 12345678913 where id = 12;
update university_students set phone_number = 12345678914 where id = 13;
update university_students set phone_number = 12345678915 where id = 14;
update university_students set phone_number = 12345678916 where id = 15;
update university_students set phone_number = 12345678917 where id = 16;
update university_students set phone_number = 12345678918 where id = 17;
update university_students set phone_number = 12345678919 where id = 18;
update university_students set phone_number = 12345678920 where id = 19;
update university_students set phone_number = 12345678921 where id = 20;



select * from university_students;


alter table university_students alter column phone_number set not null;
