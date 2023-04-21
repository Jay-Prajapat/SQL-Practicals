select * from person

select name, email, department from person where age between 21 and 24

select name, Department + ', ' + ', ' + gender + ', ' + email as Info from person
value
--replacing null  with ISNULL function
select id,name,ISNULL(email,'No email') as Email, gender from person
--replacing null value with case and when
select id,name,
	case
		when email is null then 'no email' else email
	end
		as Email
	from person

select id,name,coalesce(email,'no email') as Email from person

update person set email = 'no email' where email IS NULL

create table Orders (
	OrderID int primary key not null,
	CustomerID int not null,
	EmployeeID int not null,
	OrderDate date not null,
	ShipperID int not null
);

select * from customers
select * from Orders
--inner join
select Orders.OrderID, customers.CustomerName, Orders.OrderDate from Orders inner join customers on Orders.CustomerID = customers.customerid;
--left join
select orders.orderid, customers.customername,Orders.OrderDate from customers left join orders on Orders.CustomerID=customers.customerid
--right join
select Orders.OrderID, customers.customername,Orders.OrderID from orders right join customers on Orders.CustomerID = customers.customerid;
--full join
select orders.orderid,customers.customername,orders.orderid from customers full join orders on orders.customerid = customers.customerid

select A.customername as CustomerName1,B.customername as CustomerName2, a.city  
from customers A,customers B 
where A.customerid <> B.customerid
and A.city = B.city
order by A.city

select * from Customers cross join Order	

select * from person where id in (select id from person where salary > 500000)

update person set id = 9 where name = 'Simran'

select * into tblPersonTemp from person
alter table tblPersonTemp Add primary key (Id)

--scaller function
alter function CalculateSalary1()
returns table 
as 

 return  (select * from person)

select * from CalculateSalary1()
--scaler function that return actual salary of people.
create function ActualSalary(@X int)
returns int
as 
begin 
	return @X-10000
end

select name,department, dbo.ActualSalary(salary) as ActualSalary from person

alter function FN_GetSpecificSalary()
returns table 
as 
return (select * from person where salary > 500000)


select * from  dbo.FN_GetSpecificSalary() 

--function that get person data by department.
create function FN_GetPersonByDept(@dept varchar(50))
returns table
as 
return (select * from person where department = @dept)

select * from dbo.FN_GetPersonByDept('CE')

--cross apply and outer apply
create function fn_FindOrdersByCustomerID(@customer_id int)
returns table
as
return (select * from orders where CustomerID = @customer_id)

select c.customerid,c.customername,o.employeeid,o.orderdate 
from customers c 
cross apply fn_FindOrdersByCustomerID(c.customerid) o

select c.customerid,c.customername,o.employeeid,o.orderdate 
from customers c 
outer apply fn_FindOrdersByCustomerID(c.customerid) o