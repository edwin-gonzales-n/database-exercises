use employees;

SELECT first_name, COUNT(*) as frequency
FROM employees
GROUP BY first_name
ORDER BY COUNT(*) DESC
LIMIT 10;
select * from employees where last_name like "z%" limit 10 offset 50;

select distinct last_name 
from employees  
order by last_name 
desc limit 10;

select * from employees 
where hire_date like "199%-%-%" and birth_date like "%-12-25" 
order by birth_date,hire_date 
desc limit 5;

select * from employees 
where hire_date like "199%-%-%" and birth_date like "%-12-25" 
order by birth_date,hire_date desc limit 5 offset 45;


