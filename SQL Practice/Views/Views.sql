select * from person
--create simple view gives all data
create view vwAllPersons
as 
select * from person

select * from vwAllPersons

insert into vwAllPersons values(10,'Gaurav','CE',900000,22,'male','Gaurav.123@gmail.com')
    
--create a view that have all persons are male
create view vwMalePersons
as 
select id,name,department,salary,age,email from person where gender='male'

select * from vwMalePersons

--create a view that have department wise count
create view vwDepartmentWisePersonsCount
as
select department, count(*) as TotalPerson from person group by department

select * from vwDepartmentWisePersonsCount