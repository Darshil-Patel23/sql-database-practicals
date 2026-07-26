-- RDBMS-II Assignment 3 — Part 3
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

declare
	cursor bill_cursor is select  e.cust_no,e.cust_name,d.prev__read,d.curr_read,d.unit_price from customer_dtl d,customer_mst e where e.cust_no=d.cust_no;
	bill_record bill_cursor%rowtype;
	tot_price number(30);
	unit number(20);
begin
	open bill_cursor;
		dbms_output.put_line('     '||'         '||'-----------------------'||'   '||'    ');
		dbms_output.put_line('     '||'         '||'Electricity Bill Report'||'   '||'    ');
		dbms_output.put_line('     '||'         '||'-----------------------'||'   '||'    ');
		dbms_output.put_line('-------------------------------------------------------------------------------');
		dbms_output.put_line('Customer Number'||'      '||'Cust Name'||'      '||'Previous Reading'||'    '||'Current Reading'||'    '||'Unit'||'   '||'Total Price'||'    '||'Bill');
		dbms_output.put_line('-------------------------------------------------------------------------------');
	loop
		fetch bill_cursor into bill_record;
		unit:=bill_record.curr_read-bill_record.prev__read;
		tot_price:=unit*bill_record.unit_price;
		exit when bill_cursor%notfound;
		dbms_output.put_line(bill_record.cust_no||'  '||bill_record.cust_name||'       '||bill_record.prev__read||'       '||bill_record.curr_read||'       '||unit||' '||tot_price||'    '||tot_price);
	end loop;
	close bill_cursor;
end;
