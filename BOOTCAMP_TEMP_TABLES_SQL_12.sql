--Temp Tables

CREATE TABLE #temp_employee(
EmployeeID int,
JobTitle varchar(100),
Salary int);

SELECT * FROM #temp_employee;

INSERT INTO #temp_employee VALUES
('1001', 'HR', '45000')

SELECT * FROM #temp_employee;

INSERT INTO #temp_employee 
SELECT * FROM SQLTutorial.dbo.EmployeeSalary;

SELECT * FROM #temp_employee;

DROP TABLE IF EXISTS #temp_employee2

CREATE TABLE #temp_employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_employee2
SELECT JobTitle, COUNT(JobTitle) , AVG(Age), AVG(Salary)
FROM SQLTutorial.dbo.EmployeeSalary sal 
INNER JOIN SQLTutorial.dbo.EmployeeDemographics demo
ON sal.EmployeeID = demo.EmployeeID
GROUP BY JobTitle;

SELECT * FROM #temp_employee2;