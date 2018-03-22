/*============================G===== RELATIONSHIP DRILLS
-- concat the max salaries of the first two employees
-- get current manager name of Sales department (use subqueries)
-- get all senior engineers in customer service department
-- get all first and last names of current Sales department employees
-- get the name of the employee with the highest salary
================================= RELATIONSHIP BONUSES
-- what is the most common birthday in the company? least common?
-- what is the average salary of managers by department?
-- how many employees currently work in each department?
-- what is the average salary for each department?
-- what was the average salary in the 80s? By department?
-- how many times (on average) do employees switch titles?
-- how many times (on average) do employees get a raise?
-- what is the highest paying job title historically for women and men? For women only? For men only?
-- does the older halve of current employees make more or less than the younger halve?
-- list the oldest current employees by title in each department
-- list the 5 historically lowest paid managers
-- EXTRA HARD BONUS --
-- what employees were hired during the year Nevermind was released and after?
(you will need to use the codeup_test_db and employees db)
*/

-- concat the max salaries of the first two employees
select concat(first_name, " ", last_name," ", salary) as "First,
       Last Name, and Max Salary"
  from salaries
  join employees
    on employees.emp_no = salaries.emp_no
 where salary in(
                select max(salary)
                  from salaries
 where emp_no = 10001
       ) limit 2;

-- get current manager name of Sales department (use subqueries)
select concat(first_name, " ", last_name) as "Current Manager",
       dept_name
  from employees
  join dept_manager
    on employees.emp_no = dept_manager.emp_no
  join departments
    on departments.dept_no = dept_manager.dept_no
 where dept_name in (
                select dept_name
                  from departments
                 where dept_name like "%sales%"
   and dept_manager.to_date like "9999%"
       );

-- get all senior engineers in customer service department
select concat(first_name, " ", last_name) as "Senior Engineers",
       dept_name, title
  from employees
  join titles
    on titles.emp_no = employees.emp_no
  join dept_emp
    on dept_emp.emp_no = titles.emp_no
  join departments
    on departments.dept_no = dept_emp.dept_no
 where dept_name in (
                select dept_name
                  from departments
                 where dept_name like "%customer%"
   and dept_emp.to_date like "9999%"
       ) and title in(
                select title
                  from titles
                where  title like "%senior engineer%"
        );


-- get all first and last names of current Sales department employees

select concat(first_name, " ", last_name) as "Current Employees",
       dept_name, title
  from employees
  join titles
    on titles.emp_no = employees.emp_no
  join dept_emp
    on dept_emp.emp_no = titles.emp_no
  join departments
    on departments.dept_no = dept_emp.dept_no
 where dept_name in (
                select dept_name
                  from departments
                 where dept_name like "%sales%"
   and dept_emp.to_date like "9999%"
       );

-- get the name of the employee with the highest salary

select concat(first_name, " ", last_name) as "Current Employees",
       dept_name, salary
  from employees
  join dept_emp
    on dept_emp.emp_no = employees.emp_no
  join departments
    on departments.dept_no = dept_emp.dept_no
  join salaries
    on salaries.emp_no = employees.emp_no
 where dept_name in (
                select dept_name
                  from departments
                 where dept_name like "%sales%"
   and salaries.to_date like "9999%"
       ) and salary in(
                select max(salary)
                  from salaries);


-- what is the most common birthday in the company? least common

SELECT first_name, birth_date, CURDATE(),
       TIMESTAMPDIFF(YEAR,birth_date,CURDATE()) AS age
  FROM employees
 order by age asc;

-- to find the most common one:

select distinct birth_date, count(*) from employees group by birth_date order by count(*) asc;
-- answer is 1952-03-08 which repeats 95 times.

select distinct birth_date, count(*) from employees group by birth_date order by count(*) desc;
-- answer is 1952-02-01 which repeats 6 times.

