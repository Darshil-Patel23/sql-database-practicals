-- Assignment 04
-- Course : RDBMS-I - B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel
-- (Recreated: assignments 1-2 and 5-10 exist; 3-4 were missing from the archive.)

-- Q1. Display employee name with department name (equi join).
SELECT e.emp_name, d.dept_name
FROM employee e, department d
WHERE e.dept_no = d.dept_no;

-- Q2. Display employees who work in the 'SALES' department.
SELECT e.emp_no, e.emp_name
FROM employee e JOIN department d ON e.dept_no = d.dept_no
WHERE d.dept_name = 'SALES';

-- Q3. Display each department with the number of employees (including empty departments).
SELECT d.dept_name, COUNT(e.emp_no) AS emp_count
FROM department d LEFT JOIN employee e ON d.dept_no = e.dept_no
GROUP BY d.dept_name;

-- Q4. Display employees earning more than their own department's average salary.
SELECT e.emp_no, e.emp_name, e.salary
FROM employee e
WHERE e.salary > (SELECT AVG(salary) FROM employee WHERE dept_no = e.dept_no);

-- Q5. Display the second highest salary.
SELECT MAX(salary) AS second_highest
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);
