use employees;


/* Find all the employees with the same hire date as employee 101010 using a sub-query.

69 Rows */

SELECT first_name, last_name, birth_date
  FROM employees
 WHERE hire_date IN (
                select hire_date
                  from employees
 where emp_no = 101010
       );

/* Find all the titles held by all employees with the first name Aamod.

314 total titles, 6 unique titles */
select first_name,last_name, title
  from employees
  join titles
    on titles.emp_no = employees.emp_no
 where first_name in (
                select first_name
                  from employees
 where first_name = "aamod"
       );

select distinct title
  from employees
  join titles
    on titles.emp_no = employees.emp_no
 where first_name in (
                select first_name
                  from employees
 where first_name = "aamod"
       );

/*Find all the current department managers that are female. */
select first_name, last_name
  from employees
  join titles
    on titles.emp_no = employees.emp_no
 where first_name in (
                select first_name
                  from employees
 where title  = "manager"
       )
   and gender = "F"
   and titles.to_date like "9999%";

/*Find all the department names that currently have female managers. */

select dept_name,gender
  from departments
  join dept_manager
    on departments.dept_no = dept_manager.dept_no
  join employees
    on employees.emp_no = dept_manager.emp_no
  join titles
    on titles.emp_no = employees.emp_no
 where dept_name in (
                select dept_name
                  from employees
                 where title = "manager" 
   and dept_manager.to_date > curdate()
   and titles.to_date > curdate()
       ) and gender like "%f%";

/*  Find the first and last name of the employee with the highest salary.  */

select first_name, last_name
  from employees
  join salaries
    on salaries.emp_no = employees.emp_no
 where salary in (
                select max(salary)
  from salaries
       );
