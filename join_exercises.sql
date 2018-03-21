use employees;


/*Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department. */
select dept_name as "Department Name",
       concat(first_name, " ",last_name) as "Department Manager"
  from departments
  join dept_manager
    on dept_manager.dept_no = departments.dept_no
  join employees
    on employees.emp_no = dept_manager.emp_no
    where dept_manager.to_date like '9999%';;

/*Find the name of all departments currently managed by women.  */
select dept_name as "Department Name",
       concat(first_name, " ",last_name) as "Department Manager",gender
  from departments
  join dept_manager
    on dept_manager.dept_no = departments.dept_no
  join employees
    on employees.emp_no = dept_manager.emp_no
 where gender like "%F%"
 and dept_manager.to_date like '9999%';

/* Find the current titles of employees currently working in the Customer Service department.  */
select titles.title, count(*) as "Count", departments.dept_name
  from employees
  join titles
    on employees.emp_no = titles.emp_no
  join dept_emp
    on dept_emp.emp_no = titles.emp_no
  join departments
    on departments.dept_no = dept_emp.dept_no
 where dept_name = "Customer Service"
   and titles.to_date like '9999%'
 group by title
 order by count(*) asc;

/*  Find the current salary of all current managers.  */
select dept_name as "Department Name",
       concat(first_name, " ",last_name) as "Name"
  from departments
  join dept_manager
    on dept_manager.dept_no = departments.dept_no
  join employees
    on employees.emp_no = dept_manager.emp_no
  join titles
    on titles.emp_no = employees.emp_no
 where title         = "Manager"
 and   titles.to_date like '9999%';

/* Find the names of all current employees, their department name, and their current manager's name.  */
select concat(e.first_name, " ", e.last_name) as "Employee Name",
       dept_name as "Department Name",
                concat(m.first_name," ",m.last_name)             
                as "Manager"
  from employees as e
  join dept_emp 
    on dept_emp.emp_no     = e.emp_no
  join departments
    on departments.dept_no = dept_emp.dept_no
  join dept_manager
    on dept_emp.dept_no = dept_manager.dept_no
  join employees as m
    on m.emp_no = dept_manager.emp_no
 where dept_emp.to_date like "9999%" and dept_manager.to_date like "9999%";

/* ---  BONUSES  ---- */

/*Write a query to get the average salary current managers make by gender   */
select gender, avg(salary)
  from employees
  join salaries
    on salaries.emp_no = employees.emp_no
  join dept_manager
    on dept_manager.emp_no = employees.emp_no
   where salaries.to_date like "9999%"
   and dept_manager.to_date like "9999%"
   group by gender;


/*Write a query to get the avg salary managers historically make by gender  */
select gender, avg(salary)
  from employees
  join salaries
    on salaries.emp_no = employees.emp_no
  join dept_manager
    on dept_manager.emp_no = employees.emp_no
   group by gender;

/* get avg salary for all current employees by gender  */
select gender, avg(salary)
  from employees
  join salaries
    on salaries.emp_no = employees.emp_no
  join dept_emp
    on dept_emp.emp_no = employees.emp_no
   where salaries.to_date like "9999%"
   and dept_emp.to_date like "9999%"
   group by gender;

/*get avg historic salary for all employees by gender */
select gender, avg(salary)
  from employees
  join salaries
    on salaries.emp_no = employees.emp_no
  join dept_emp
    on dept_emp.emp_no = employees.emp_no
   group by gender;
