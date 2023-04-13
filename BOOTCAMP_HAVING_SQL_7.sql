-- HAVING CLAUSE

SELECT JobTitle, COUNT(JobTitle) FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1 ;

SELECT JobTitle, AVG(Salary) FROM SQLTutorial.dbo.EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary);