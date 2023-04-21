select * from person
create procedure spDisplayWelcome
as
begin
 print 'Welcome to procedure in SQL Server'
end

execute spDisplayWelcome

--create a procedure that get all persons
create procedure spGetPersons
as
begin
	select * from person
end

execute spGetPersons

--create a procedure that add two numbers
alter procedure spAddTwoNumbers(@no1 int,@no2 int)
as 
begin
	declare @Result int
	set @Result = @no1 + @no2
	print 'Result is ' + cast(@Result as varchar)
end
go

execute spAddTwoNumbers 10,20

--create procedure that give persons by department and gender
create procedure spGetEmployeesByGenderAndDepartment
	@department varchar(20),
	@Gender varchar(20)
as
begin
	select Name, Salary,Age,Email 
	from person 
	where Department=@department and Gender = @gender
end
go

execute spGetEmployeesByGenderAndDepartment 'CE','male'

--use of output parameter
create procedure spGetResult
	@no1 int,
	@no2 int,
	@Result int output
as
begin
	set @Result = @no1 + @no2
end

declare @Result int
execute spGetResult 10,20,@Result out
print @Result

--create procedure that give the count of gender
create procedure spGetGenderCount
	@Gender varchar(20),
	@PersonCount int output
as
begin
	select @PersonCount = count(*)
	from person 
	where Gender = @Gender
end
go

declare @PersonCount int
execute spGetGenderCount 'female',@PersonCount out
print @PersonCount

create procedure spGetTotalPeople
as
begin
	return (select count(id) from person)
end

declare @TotalPerson int
execute @TotalPerson = spGetTotalPeople
print @TotalPerson

