-- SUBQUERIES in SELECT, WHERE and FROM clauses


SELECT * 
FROM SQLTutorial.dbo.EmployeeSalary;

-- Subquery in SELECT 

SELECT EmployeeID, JobTitle, 
(SELECT AVG(Salary) FROM SQLTutorial.dbo.EmployeeSalary) AS AVG_SALARY
FROM SQLTutorial.dbo.EmployeeSalary

-- Using PARTITION BY

SELECT EmployeeID, JobTitle, 
AVG(Salary) OVER() AS AVG_SALARY
FROM SQLTutorial.dbo.EmployeeSalary

-- GROUP BY doesn't work

SELECT EmployeeID, Salary, 
AVG(Salary) AS AVG_SALARY
FROM SQLTutorial.dbo.EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1, 2;

-- Subquery in FROM Statement

SELECT A.EmployeeID,  AVG_SALARY
FROM (SELECT EmployeeID, JobTitle, 
	AVG(Salary) OVER() AS AVG_SALARY
	FROM SQLTutorial.dbo.EmployeeSalary) A

SELECT A.*
FROM (SELECT EmployeeID, JobTitle, 
	AVG(Salary) OVER() AS AVG_SALARY
	FROM SQLTutorial.dbo.EmployeeSalary) A

-- Subquery in WHERE Statement

SELECT EmployeeID,JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeSalary
WHERE EmployeeID IN 
(SELECT EmployeeID FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age > 30)
