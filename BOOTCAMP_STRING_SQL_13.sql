-- STRING FUNCTIONS : TRIM , LTRIM, RTRIM, REPLACE, SUBSTRING, UPPER, LOWER

DROP TABLE EmployeeErrors;
CREATE TABLE EmployeeErrors
(
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)


INSERT INTO EmployeeErrors
VALUES
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')
, ('1006', 'JAHnani', 'SIVAKUMAR')


SELECT * FROM
EmployeeErrors;

SELECT * FROM 
SQLTutorial.dbo.EmployeeDemographics;

-- USING TRIM, LTRIM, RTRIM

SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS LEFTIDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS RIGHTIDTRIM
FROM EmployeeErrors


-- USING REPLACE

SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM
EmployeeErrors

-- USING SUBSTRING

SELECT FirstName, SUBSTRING (FirstName,1,3) as NickName
FROM
EmployeeErrors

SELECT err.FirstName, dem.FirstName 
FROM EmployeeErrors err 
JOIN SQLTutorial.dbo.EmployeeDemographics dem
ON err.FirstName = dem.FirstName;

SELECT err.FirstName, SUBSTRING(err.FirstName,1,3) ,dem.FirstName, SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err 
JOIN SQLTutorial.dbo.EmployeeDemographics dem
ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3);

-- USING LOWER, UPPER

SELECT FirstName, LOWER(FirstName)
FROM
EmployeeErrors

SELECT FirstName, UPPER(FirstName)
FROM
EmployeeErrors
