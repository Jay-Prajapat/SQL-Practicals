select * from Person

select * from Person  order by salary ,name asc

select * from person order by(case salary 
when 500000 then 1
when 600000 then 2
else 100 end)asc,salary desc

select name, salary,gender from person order by 3

select * from person order by email 

select department, STRING_AGG(name, ' , ') as name from person group by department

select gender ,min(Salary) from person  group by gender
select department , max(salary) from person group by department
select top 3 * from person

select email,max(salary) from person group by email having max(salary) > 500000 
select max(salary) from person where salary != (select top 1 Salary from person  order by salary desc )

select APPROX_COUNT_DISTINCT(salary) from person