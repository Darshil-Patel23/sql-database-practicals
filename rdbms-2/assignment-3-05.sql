-- RDBMS-II Assignment 3 — Part 5
-- Course : RDBMS-II — B.Sc. CA&IT Sem IV
-- Author : Darshilkumar Patel

declare
	cursor cur_d1 is select d.docid,d.dnm,d.case_fee,p.pid,p.pnm,p.cons_fee,p.medi_amit,p.test_fee from doctor_master d,patient_detail p where d.docid=p.docid and d.docid='&input_docid' and d.dnm='&input_dnm' and d.case_fee='&input_casefee';
	e_rec cur_d1%rowtype;
	tot_amt number(20);
begin
	open cur_d1;
		dbms_output.put_line('     '||'         '||'------------------------------------'||'   '||'    ');
		dbms_output.put_line('     '||'         '||'Doctor Wise Patient Report'||'   '||'    ');
		dbms_output.put_line('     '||'         '||'------------------------------------'||'   '||'    ');
		dbms_output.put_line('Docid='||e_rec.docid||'    '||'DName='||e_rec.dnm||'    '||'Case_Fee='||e_rec.case_fee);
		dbms_output.put_line('Pid'||'      '||'Pnm'||'          '||'ConsFee'||'         '||'MediAmt'||'        '||'TestFee'||'      '||'TotAmt');
		dbms_output.put_line('-------------------------------------------------------------------------------');
	loop
		fetch cur_d1 into e_rec;
		tot_amt:=e_rec.cons_fee+e_rec.medi_amit+e_rec.test_fee;
		exit when cur_d1%notfound;
		dbms_output.put_line(e_rec.pid||'        '||e_rec.pnm||'       '||e_rec.cons_fee||'                '||e_rec.medi_amit||'               '||e_rec.test_fee||'       '||tot_amt);
	end loop;
	close cur_d1;
end;

change the record name to d_rec and cursor name to cur_d1 and total amount = tot_amt
