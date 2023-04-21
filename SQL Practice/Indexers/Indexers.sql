select * from person

select * from person where name='Jay'

create clustered index IX_Person_Name on Person(Name asc)

select * into tblPersonNew from Person

select * from tblPersonNew where id = 9

create clustered index IX_NewPerson_ID on tblPersonNew(Id asc)

select * into tblPersonNonClustered from person

create nonclustered index IX_NewPersonNonClustered_ID on tblPersonNonClustered(Id)

select * from person where id = 9