use employees;

SELECT first_name, COUNT(*) as frequency
FROM employees
GROUP BY first_name
ORDER BY COUNT(*) DESC
LIMIT 10;

select * from employees where last_name like "z%" limit 10 offset 50;



