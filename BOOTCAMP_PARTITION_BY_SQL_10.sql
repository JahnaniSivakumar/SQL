-- PARTITION  BY

SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM
SQLTutorial.dbo.EmployeeDemographics AS DEMO
INNER JOIN SQLTutorial.dbo.EmployeeSalary AS SAL
ON DEMO.EmployeeID = SAL.EmployeeID;