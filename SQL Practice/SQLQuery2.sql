create database Employee
create table Person(Id int primary key,Name varchar(40),Department varchar(40), Salary int, age int, Gender varchar(10))
insert into Employees values(1,'Jay','CE',500000,22,'male')
insert into Employees values(2,'Dev','IT',600000,20,'male')
insert into Employees values(3,'Suman','CE',700000,21,'male')
insert into Employees values(4,'Dinkal','EC',350000,23,'female')
insert into Employees values(5,'rina','IT',650000,26,'female')
insert into Employees values (6,'Rohan','EC',500000,23,'male','rohan236@gmail.com')
insert into Employees values(7,'Jay Prajapati','CE',500000,22,'male','jay12@gmail.com')
alter table Person Add Email varchar(40)
insert into Person values(8,'Simran','CE',265000,24,'female','Simran@gmail.com')
select * from employees
select * from Person
drop table employees
truncate table employees

alter table employees add Email varchar(50)
alter table employees alter column Email varchar(40)
alter table employees drop column Email

insert into Person select * from Employees
create table MalePerson(Id int primary key,Name varchar(40),Department varchar(40),Salary int,Age int,Email varchar(40))

insert into MalePerson select Id,Name,Department,Salary,Age,Email from Person where Gender = 'male'

select * from MalePerson

update Employees set Name = 'Dev' where Name = 'Jay Prajapati'

delete from employees where Name='Dev'

insert into Employees values(2,'Dev','IT',600000,20,'male','dev2@gmail.com')
insert into Employees values(7,'Dev','EC',560000,23,'male','dev565@gmail.com')

select distinct department from employees
select count(distinct department) from employees

create table tblGender
(
Id int NOT NULL primary key,
Gender varchar(50) not null
)

alter table tblPerson add constraint tblPerson_GenderID_FK
foreign key (GenderID) references tblGender (Id)

revoke select on Employees to JAY;
select * from person

select id,name,salary from person where department ='ce' or department= 'it'
select id,name,salary from person where department in ('ce','it')
select id,name,salary from person where gender = 'male' and department in ('ce','it')
select id,name,salary from person where gender = 'male' and department = 'ce' or department = 'it'

select id,name,salary,department from person where name like '%y'

select count (distinct age ) as distinct_age from person

select distinct  department, name from person where gender = 'male' or salary > 500000

select * from Person  order by salary ,name asc 

select * from person order by(case salary 
when 500000 then 1
when 600000 then 2
else 100 end)asc,salary desc

select name, salary,gender from person order by 3
