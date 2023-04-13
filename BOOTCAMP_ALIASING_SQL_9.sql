-- ALIASING

SELECT FirstName AS Fname FROM
SQLTutorial.dbo.EmployeeDemographics;

SELECT FirstName Fname FROM
SQLTutorial.dbo.EmployeeDemographics;

SELECT FirstName + ' ' + LastName AS FullName 
FROM SQLTutorial.dbo.EmployeeDemographics;

SELECT AVG(Age) AS AvgAge
FROM SQLTutorial.dbo.EmployeeDemographics;

SELECT DEMO.EmployeeID
FROM SQLTutorial.dbo.EmployeeDemographics AS DEMO;

SELECT DEMO.EmployeeID, SALARY.Salary
FROM SQLTutorial.dbo.EmployeeDemographics AS DEMO
INNER JOIN SQLTutorial.dbo.EmployeeSalary AS SALARY
ON DEMO.EmployeeID = SALARY.EmployeeID;

SELECT DEMO.EmployeeID, DEMO.FirstName, DEMO.LastName, SAL.JobTitle, WARE.Age
FROM SQLTutorial.dbo.EmployeeDemographics AS DEMO
LEFT JOIN SQLTutorial.dbo.EmployeeSalary AS SAL
ON DEMO.EmployeeID = SAL.EmployeeID
LEFT JOIN SQLTutorial.dbo.WareHouseEmployeeDemographics WARE
ON DEMO.EmployeeID = WARE.EmployeeID;