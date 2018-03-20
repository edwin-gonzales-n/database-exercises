use employees;

select * 
from employees 
where first_name in ('irena','vidya','maya') 
order by first_name;

select * from employees 
where first_name in ('irena','vidya','maya') 
order by first_name asc, last_name asc;

select * from employees 
where first_name in ('irena','vidya','maya') 
order by last_name  asc, first_name asc;

select * from employees 
where last_name like "e%" or last_name like "%e" 
order by emp_no desc;

select * from employees 
where hire_date like "199%-%-%" and birth_date like "%-12-25" 
order by hire_date asc;

select * from employees 
where hire_date like "199%-%-%" and birth_date like "%-12-25" 
order by birth_date,hire_date desc;
