SELECT * FROM SQLTutorial.dbo.EmployeeDemographics;
SELECT * FROM SQLTutorial.dbo.EmployeeSalary;

-- INNER JOIN

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics INNER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- FULL OUTER JOIN

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- LEFT OUTER JOIN 

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- RIGHT OUTER JOIN

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Reference in Joins

SELECT demo.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics demo INNER JOIN SQLTutorial.dbo.EmployeeSalary salary
ON demo.EmployeeID = salary.EmployeeID;

-- ORDER BY SALARY DESC

SELECT demo.EmployeeID, FirstName, LastName, Salary
FROM SQLTutorial.dbo.EmployeeDemographics demo INNER JOIN SQLTutorial.dbo.EmployeeSalary salary
ON demo.EmployeeID = salary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC;

-- AVG SALARY OF SALESMAN

SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics demo INNER JOIN SQLTutorial.dbo.EmployeeSalary salary
ON demo.EmployeeID = salary.EmployeeID
WHERE JobTitle = 'Salesman' 
GROUP BY JobTitle;


