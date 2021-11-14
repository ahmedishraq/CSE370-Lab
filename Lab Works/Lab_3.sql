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
=> SELECT first_name, last_name, email, phone_number, hire_date, department_id FROM employess ORDER BY hire_date; 