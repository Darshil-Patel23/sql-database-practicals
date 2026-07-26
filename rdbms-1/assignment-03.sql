-- Assignment 03
-- Course : RDBMS-I - B.Sc. CA&IT Sem III
-- Author : Darshilkumar Patel
-- (Recreated: assignments 1-2 and 5-10 exist; 3-4 were missing from the archive.)

-- Q1. Display employees earning more than the average salary.
SELECT emp_no, emp_name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);

-- Q2. Display department wise total, maximum, minimum and average salary.
SELECT dept_no,
       SUM(salary) AS total_salary,
       MAX(salary) AS max_salary,
       MIN(salary) AS min_salary,
       AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_no;

-- Q3. Display departments having more than 3 employees.
SELECT dept_no, COUNT(*) AS emp_count
FROM employee
GROUP BY dept_no
HAVING COUNT(*) > 3;

-- Q4. Display employees whose name starts with 'A'.
SELECT emp_no, emp_name
FROM employee
WHERE emp_name LIKE 'A%';

-- Q5. Display employees who joined between 01-Jan-2020 and 31-Dec-2021.
SELECT emp_no, emp_name, join_date
FROM employee
WHERE join_date BETWEEN DATE '2020-01-01' AND DATE '2021-12-31';
