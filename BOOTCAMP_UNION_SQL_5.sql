SELECT * FROM SQLTutorial.dbo.EmployeeDemographics;
SELECT * FROM SQLTutorial.dbo.EmployeeSalary;

--JOINS

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics 
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

--Table 3 Query:
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 3 Insert:
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

-- JOINS

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics 
FULL OUTER JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID; 

-- UNION WITHOUT DUPLICATES

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics
UNION
SELECT * FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;

-- UNION ALL INCLUDES DUPLICATE RECORDS

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT * FROM SQLTutorial.dbo.WareHouseEmployeeDemographics 
ORDER BY EmployeeID;

-- UNION WHEN BOTH TABLE FIELDS ARE DIFFERENT BUT HOLD SAME DATATYPES
SELECT EmployeeID, FirstName, Age FROM SQLTutorial.dbo.EmployeeDemographics
UNION 
SELECT EmployeeID, JobTitle, Salary FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID;
