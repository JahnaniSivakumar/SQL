--Common Table Expression

WITH CTE_EMPLOYEE AS (
SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM
SQLTutorial.dbo.EmployeeDemographics AS DEMO
INNER JOIN SQLTutorial.dbo.EmployeeSalary AS SAL
ON DEMO.EmployeeID = SAL.EmployeeID
) 
SELECT * FROM 
CTE_EMPLOYEE;

WITH CTE_EMPLOYEE AS (
SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM
SQLTutorial.dbo.EmployeeDemographics AS DEMO
INNER JOIN SQLTutorial.dbo.EmployeeSalary AS SAL
ON DEMO.EmployeeID = SAL.EmployeeID
) 
SELECT FirstName, TotalGender FROM 
CTE_EMPLOYEE;