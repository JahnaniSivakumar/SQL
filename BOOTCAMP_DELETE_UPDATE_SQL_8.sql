-- UPDATING AND DELETING DATA

SELECT * FROM SQLTutorial.dbo.EmployeeDemographics;

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1012 WHERE FirstName = 'Holly' AND LastName = 'Flax';

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Age = 31, Gender= 'Female' WHERE FirstName = 'Holly' AND LastName = 'Flax';

DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1005;