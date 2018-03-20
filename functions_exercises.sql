use employees;

select concat(first_name,' ', last_name) 
from employees 
where last_name like "e%" or last_name like "%e" 
order by emp_no desc;

select datediff(curdate(),hire_date),first_name,last_name 
from employees limit 10;
