
-- Not Equal to
SELECT * FROM EmployeeDemographics
WHERE FirstName <> 'JAHNANI';

--Greater than
SELECT * FROM EmployeeDemographics
WHERE Age > 30;

-- Less than or equal to
SELECT * FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male';

-- Last name starts with 'S'
SELECT * FROM EmployeeDemographics
WHERE LastName LIKE 'S%';

-- Last name contains 'S' anywhere
SELECT * FROM EmployeeDemographics
WHERE LastName LIKE '%S%';

-- Last name starts with 'S' and contains 'O' anywhere [order matters]
SELECT * FROM EmployeeDemographics
WHERE LastName LIKE 'S%O%';

-- NULL  NOT NULL
SELECT * FROM EmployeeDemographics
WHERE FirstName IS NOT NULL;

-- IN
SELECT * FROM EmployeeDemographics
WHERE FirstName IN ('JAHNANI', 'Toby', 'Stanley');

