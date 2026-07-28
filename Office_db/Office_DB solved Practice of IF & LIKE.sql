create database office_db;
use office_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date) VALUES
(1, 'John', 'Doe', 'Engineering', 75000, '2015-03-01'),
(2, 'Jane', 'Smith', 'Marketing', 60000, '2018-07-15'),
(3, 'Sam', 'Brown', 'Engineering', 80000, '2012-11-20'),
(4, 'Sue', 'Black', 'HR', 65000, '2019-05-23'),
(5, 'Mike', 'Green', 'Marketing', 72000, '2020-02-11'),
(6, 'Ann', 'White', 'HR', 68000, '2017-10-30'),
(7, 'Rob', 'Grey', 'Engineering', 78000, '2014-01-09'),
(8, 'Eve', 'Gold', 'Marketing', 59000, '2021-03-17'),
(9, 'Tom', 'Blue', 'HR', 67000, '2016-08-22'),
(10, 'Zoe', 'Red', 'Engineering', 82000, '2013-09-25');

/*1. Given the employees table, determine which employees are eligible for a bonus. 
Employees in the 'Engineering' department are eligible if their salary is above $75,000, 
and employees in other departments are eligible if their salary is above $65,000. 
Create a column named bonus_eligibility that states 'Eligible' or 'Not Eligible'.*/

select first_name,last_name,employee_id, case 
	  when department= "Engineering" and salary > 75000 then "Eligible"
      when department <> "Engineering" and salary > 65000 then "Eligible"
      else "Not Eligible"
      end as Bonus_eligibility
      from employees;
     
/*2.Categorize employees based on their hire date. If an employee was hired before January 1, 2015, label them as 'Veteran'. 
If hired between January 1, 2015, and January 1, 2019, label them as 'Experienced'. 
If hired after January 1, 2019, label them as 'Newcomer'. Use a column named hire_category.*/
     
  select employee_id,first_name,last_name,hire_date, case 
	  when hire_date< "2015-01-01" then "Veteran"
      when hire_date between "2015-01-01" and "2019-01-01"  then "Experienced"
      else "Newcomer"
      end as hire_category
      from employees;   
      
/*3.Calculate the average salary of each department. Classify each department as 'High Paying' if the average salary is above $70,000, 
otherwise classify it as 'Standard Paying'. Use a column named paying_status.*/
select avg(salary), department, case 
	  when avg(salary)> 70000 then "High Paying"
      else "Standard Paying"
      end as paying_status
      from employees
      group by department ; 
      
-- 4. Find all employees whose last names do not start with 'S' or end with 'n'.
select last_name
from employees
where last_name not like "%S" or last_name not like "%n";

-- 5. Find employees who were hired after 2016, and whose first names start with 'A' or 'E'.
select first_name,last_name ,hire_date
from employees
where hire_date > "2016-01-01" and (first_name like "A%" or first_name like "E%");