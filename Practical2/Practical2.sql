CREATE TABLE tblDepartment
(
	DepartmentId INT PRIMARY KEY,
	DepartmentName VARCHAR(200)
)

CREATE TABLE tblEmployee
(
	EmployeeId INT IDENTITY PRIMARY KEY,
	EmployeeName VARCHAR(80),
	DepartmentId INT,
	Experience INT,
	Salary MONEY CHECK (Salary > 0),
	Foreign key (DepartmentId) References tblDepartment (DepartmentId)
)

INSERT INTO tblDepartment VALUES
(1,'.NET'),
(2,'HR'),
(3,'Management'),
(4,'JAVA')

INSERT INTO tblEmployee VALUES
('Jay',1,5,50000),
('Gaurav',1,7,70000),
('Sweta',2,10,90000),
('Noopur',2,12,1000000),
('Mehul',3,10,900000),
('Jenil',4,3,35000),
('Bhavin',4,2,30000),
('Suman',1,4,40000)

--Write a Query display empId,EmpName and DepartmentName
SELECT E.EmployeeId, E.EmployeeName, D.DepartmentName 
FROM tblDepartment AS D INNER JOIN tblEmployee AS E
ON D.DepartmentId = E.DepartmentId

--Write a Query to display department wise employee count
SELECT D.DepartmentName AS Department, COUNT(*) AS 'Total Employee'
FROM tblDepartment AS D INNER JOIN tblEmployee AS E
ON D.DepartmentId = E.DepartmentId
GROUP BY DepartmentName

--Write a Query to display department wise maximum salary
SELECT D.DepartmentName, MAX(E.Salary) AS 'Maximum Salary'
FROM tblDepartment AS D INNER JOIN tblEmployee AS E
ON D.DepartmentId = E.DepartmentId
GROUP BY D.DepartmentName

--Write a Query to display employee name in the ascending order of department name
SELECT E.EmployeeName
FROM tblDepartment AS D INNER JOIN tblEmployee AS E
ON D.DepartmentId = E.DepartmentId
ORDER BY D.DepartmentName


--Write a Query to display employeeName and grade where grade criteria is as below
--if employee has more than 10 years of experience then grade is expert
--if employee has experience between 7 to 10 years then its grade is advanced
--if employee has experience between 5 to 7 years then its grade is intermediate
--if employee has experience between 2 to 5 year then its grade is beginner
--and for the rest of case display grade as novice
SELECT EmployeeName, Experience,
CASE 
WHEN Experience > 10 THEN 'Expert'
WHEN Experience > 7 THEN 'Advanced'
WHEN Experience > 5 THEN 'Intermediate'
WHEN Experience > 2 THEN 'Beginner'
ELSE 'Novice'
END AS Grade
FROM tblEmployee