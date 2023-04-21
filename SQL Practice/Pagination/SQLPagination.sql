create table tblProducts
(
	Id int primary key ,
	Name varchar(50),
	Description varchar(50),
	Price int
)

alter table tblProducts alter column Id int not null

declare @start int
set @start = 1

declare @Name varchar(50)
declare @Description varchar(50)

while(@start <= 100)
begin
	set @Name = 'Product - ' + Cast(@start as varchar(10))
	set @Description = 'Product Description - ' + cast(@start as varchar(10))
	insert into tblProducts (Name,Description,Price) values(@Name,@Description,@start*10)
	set @start = @start + 1
end

truncate table tblProducts

select * from tblProducts

alter table tblProducts 
add Id int identity primary key   

select * from tblProducts
order by id
offset 50 rows
fetch next 20 rows only

create procedure spGetRowsByPageNumberAndPageSize
@PageNumber int,
@PageSize int
as 
begin
	select * from tblProducts
	order by id
	offset (@PageNumber - 1) * @PageSize rows
	fetch next @PageSize  rows only
end

execute spGetRowsByPageNumberAndPageSize 1,10