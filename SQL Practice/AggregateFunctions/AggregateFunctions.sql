select * from person

select count(gender) from person where gender='male'

select sum(salary) as TotalSum from person where gender='female'

select Avg(salary) as FemaleAvgSalary from person where gender='female'

select approx_count_distinct(email) from person
select count (distinct department) from person
select APPROX_COUNT_DISTINCT(department) from person

select PERCENTILE_CONT(salary)  within group ( order by department) from person 

--count(*) with group by returns the number of row in each group,including null value.
select email,count(*) from person group by email

select email,count(email) from person group by email

--count with distinct returns the number of unique, nonnull value
select count(distinct email) as emails from person

select count(all email) from person where gender= 'male'

--find number of people in each department.
select department, count(*) from person group by department

select department,count(*) from person group by department order by count(*)desc

--find number of people in each department having count < 3
select department,count(*) from person group by department having count(*) < 3

select department, CHECKSUM(email) as checksum_for_department from person group by department

select *, CHECKSUM(email) as checksum_value from person

select  CHECKSUM_AGG(distinct department) from person 

select getdate()
select GETUTCDATE()
select CURRENT_TIMESTAMP

