-> just making the table
=> create table employees(
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
   FROM employees
   WHERE (department_id, hire_date) IN (SELECT department_id, MAX(hire_date) FROM employees
   GROUP BY department_id);

2. Find the first_name, last_name, email, phone_number, hire_date and department_id of all the employees with the oldest  hire_date in each department. 
=> SELECT first_name, last_name, email, phone_number, hire_date, department_id 
   FROM employees
   WHERE (department_id, hire_date) IN (SELECT department_id, MIN(hire_date) FROM employees
   GROUP BY department_id);

3. Find the first_name, last_name, employee_id, phone_number, salary and department_id of all the employees with the lowest salary in each department. 
=> SELECT first_name, last_name, employee_id, phone_number, salary, department_id
   FROM employees
   WHERE (department_id, salary) IN (SELECT department_id, MIN(salary) FROM employees
   GROUP BY department_id);  

4. Find the first_name, last_name, employee_id, commission_pct and department_id of all the employees in department XYZABC (department_id = 7) who have a lower commission_pct than all of the employees of department ABCXYZ(department_id = 5). 
=> SELECT first_name, last_name, employee_id, commission_pct, department_id FROM employees
   WHERE department_id=7 AND commission_pct < ALL (SELECT commission_pct FROM employees
   WHERE department_id=5);

5. Find the Total number of employees in each department. 
=> SELECT COUNT(*), department_id FROM employees GROUP BY department_id;

6. Find the first_name, last_name, employee_id, email, salary and department_id of all the employees who joined before 2020.
=> SELECT first_name, last_name, employee_id, email, salary, department_id FROM employees
   WHERE YEAR(hire_date)<2020;

7. Find the first_name, last_name, employee_id, email, salary and department_id of the employee who has the highest salary working under the manager with id= abcd998773. 
=> SELECT first_name, last_name, employee_id, email, salary, department_id FROM employees
   WHERE (salary) in (SELECT MAX(salary) FROM employess WHERE manager_id='abcd998773'); 

8. Find the department_id for which does not have any employee under it with a salary more than 30,000.
=> SELECT DISTINCT department_id FROM employees
   E1 WHERE NOT EXISTS
   (SELECT * FROM employees E2 WHERE E2.department_id=E1.department_id AND E2.salary>30000);

9. For each of the departments, find the department_id, job_id and commission_pct with commission_pct less than at least one other job_id in the department.
=> SELECT E1.department_id, E1.job_id, E1.commission_pct FROM employees
   E1 WHERE EXISTS (SELECT * FROM employees E2 WHERE
   E2.department_id=E1.department_id AND E2.job_id<>E1.job_id AND E2.commission_pct>E1.commission_pct)
   GROUP BY department_id;

10. Find the first_name, last_name, employee_id, email, salary, department_id and commission_pct of the employee who has the lowest commission_pct under each manager
=> SELECT first_name, last_name, employee_id, email, salary, department_id, commission_pct FROM employees
   WHERE(commission_pct) IN (SELECT MIN(commission_pct) FROM employees GROUP BY manager_id);

11. Count the number of employees where the employee is a manager
=> SELECT count(*) From employees WHERE employee_id IN (SELECT manager_id FROM employees);

12. For each of the departments, find the department_id, job_id and salary with salary less than at least one other job_id in the department
=> SELECT E1.department_id, E1.job_id, E1.salary FROM employees
   E1 WHERE EXISTS
   (SELECT * FROM employees E2 WHERE E2.manager_id=E1.manager_id AND E2.job_id<>E2.job_id AND E2.salary>E1.salary)
   GROUP BY department_id; 

13. Find the manager_id for who have at least one employee under them with a salary greater than 1500
=> SELECT DISTINCT manager_id FROM employees
   E1 WHERE EXISTS
   (SELECT * from employees E2 WHERE E2.manager_id=E1.manager_id AND E2.salary>1500);

14. Find the manager_id for who have at least one employee under them with a commission_pct less than 15.25
=> SELECT DISTINCT manager_id from employees
   E1 WHERE EXISTS
   (Select * FROM employees E2 WHERE E2.manager_id=E1.manager_id AND E2.commission_pct<15.25);

15. Find the manager_id for who does not have any employee under them with a salary less than 3500
=> SELECT DISTINCT manager_id FROM employees
   E1 WHERE NOT EXISTS
   (SELECT * FROM employees E2 WHERE E2.manager_id=E1.manager_id AND E2.salary<3500); 