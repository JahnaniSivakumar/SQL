-- CASE

SELECT FirstName, LastName, Age, 
CASE 
	WHEN Age > 30 THEN 'OLD'
	WHEN Age BETWEEN 27 AND 30 THEN 'ADULT'
	ELSE 'YOUNG'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age;

-- CASE RULE ORDER

SELECT FirstName, LastName, Age, 
CASE 
	WHEN Age = 38 THEN 'STANLEY'
	WHEN Age > 30 THEN 'OLD'
	WHEN Age BETWEEN 27 AND 30 THEN 'NOT OLD'
	ELSE 'YOUNG'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age;

-- JOINS AND CASE

SELECT FirstName, LastName, Age, JobTitle, Salary,
CASE 
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05) 
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .00001) 
	ELSE Salary + (Salary * .03) 
END AS SALARY_AFTER_RAISE
FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary 
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;