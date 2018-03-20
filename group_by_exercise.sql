use employees;

select distinct title from titles;

select distinct last_name
  from employees
 where last_name like "e%"
   and last_name like "%e"
 group by last_name;

select distinct first_name, last_name
  from employees
 where last_name like "%e"
   and last_name like "e%";

select distinct last_name
  from employees
 where last_name like "%q%"
   and not last_name like "%qu%";

select distinct first_name, count(*)
  from employees
 group by first_name
 order by count(*) asc;

select gender, count(*)
  from employees
 where first_name in ('irena','vidya')
    or first_name = 'maya'
 group by gender
 order by count(*) desc;
