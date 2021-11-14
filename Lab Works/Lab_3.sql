-> just making the table
=> create table employess(
	employee_id char(10),
	first_name varchar(20),
	last_name varchar(20),
	email varchar(60),
	phone_number char(14),
	hire_date date,
	job_id int,
	salary int,
	commission_pct decimal(5,3),
	manager_id char(10),
	department_id int
);



1. Find the first_name, last_name, email, phone_number, hire_date and department_id of all the employees with the latest hire_date in each department. 
=> SELECT first_name, last_name, email, phone_number, hire_date, department_id 
   FROM employess
   WHERE (department_id, hire_date) IN (SELECT department_id, MAX(hire_date) FROM employess
   GROUP BY department_id);

2. Find the first_name, last_name, email, phone_number, hire_date and department_id of all the employees with the oldest  hire_date in each department. 
=> SELECT first_name, last_name, email, phone_number, hire_date, department_id 
   FROM employess
   WHERE (department_id, hire_date) IN (SELECT department_id, MIN(hire_date) FROM employess
   GROUP BY department_id);

3. Find the first_name, last_name, employee_id, phone_number, salary and department_id of all the employees with the lowest salary in each department. 
=> SELECT first_name, last_name, employee_id, phone_number, salary, department_id
   FROM employess
   WHERE (department_id, salary) IN (SELECT department_id, MIN(salary) FROM employess
   GROUP BY department_id);  

4. Find the first_name, last_name, employee_id, commission_pct and department_id of all the employees in department XYZABC (department_id = 7) who have a lower commission_pct than all of the employees of department ABCXYZ(department_id = 5). 
=> SELECT first_name, last_name, employee_id, commission_pct, department_id FROM employess
   WHERE department_id=7 AND commission_pct < ALL (SELECT commission_pct FROM employess
   WHERE department_id=5); 