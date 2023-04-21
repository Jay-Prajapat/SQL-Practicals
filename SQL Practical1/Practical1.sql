create table tblProducts
(
	ProductId int identity primary key,
	ProductName varchar(500),
	Categroy varchar(100),
	Price money check (Price > 0)
)

alter table tblProducts add Description varchar(500)

INSERT INTO tblProducts VALUES
('Key Board','Electronic',1000,'Logitech Gen-7 Smoth'),
('Amul Gold','Grocery',32,'Amul Gold Fresh Milk '),
('Remote Car','Toys',600,'A remote car for small kids'),
('Key Board','Electronic',1000,'Logitech Gen-7 Smoth'),
('Key Board','Electronic',1000,'Logitech Gen-7 Smoth'),
('Titan Watch','Fashion',35000,'A TATA Company Watch '),
('Thermo Meter','Helth Care',550,'A Thermo Meter version M23o'),
('Toy Gun','Toys',300,'A toy guns for small kids'),
('Head Phone','Electronic',1250,'Sony Version - 8 Head Phone'),
('Bread','Grocery',40,'Wheet Brown Bread'),
('Limcee','Helth Care',120,'A Vitamin - C Tablet'),
('Wooden toys','Toys',500,'A wooden sticks to make Wooden home'),
('Paracetamol Tablets','Helth Care',50,'Used to treat fever and mild to modrate pain')

SELECT * FROM tblProducts

--Write a Query to List all the products belonging to health category
SELECT * FROM tblProducts WHERE	Categroy = 'Helth Care'

--Write a Query to get total price of all products
SELECT SUM(Price) AS 'Total Price' FROM tblProducts

--Write a query to display product in descending order of price
SELECT * FROM tblProducts ORDER BY Price DESC

--Write a Query to display category wise product count having price greater than  1000
SELECT Categroy,COUNT(Categroy) AS 'Total Products' 
FROM tblProducts 
WHERE Price > 1000
GROUP BY Categroy 















