 --DISTINCT

 SELECT DISTINCT(Gender) FROM 
 EmployeeDemographics;

 -- GROUP BY
 
 SELECT * FROM EmployeeDemographics;

 SELECT Gender, COUNT(Gender) FROM 
 EmployeeDemographics
 GROUP BY Gender;

 SELECT Gender, COUNT(Gender) FROM 
 EmployeeDemographics
 WHERE Age > 31
 GROUP BY Gender;

 SELECT Gender, Age, COUNT(Gender) FROM 
 EmployeeDemographics
 GROUP BY Gender, Age;

 --ORDER BY
 SELECT Gender, COUNT(Gender) AS Gender_count FROM 
 EmployeeDemographics
 WHERE Age > 31
 GROUP BY Gender
 ORDER BY Gender_count ASC;

 SELECT Gender, COUNT(Gender) AS Gender_count FROM 
 EmployeeDemographics
 WHERE Age > 31
 GROUP BY Gender
 ORDER BY Gender_count DESC;

 SELECT * FROM 
 EmployeeDemographics
 ORDER BY Age;

 SELECT * FROM 
 EmployeeDemographics
 ORDER BY Age DESC;

 SELECT * FROM 
 EmployeeDemographics
 ORDER BY Age, Gender;

 SELECT * FROM 
 EmployeeDemographics
 ORDER BY Age, Gender DESC;

 SELECT * FROM 
 EmployeeDemographics
 ORDER BY Age DESC, Gender DESC;

 SELECT * FROM 
 EmployeeDemographics
 ORDER BY 1,2,3,4 ASC, 5 ASC;

  SELECT * FROM 
 EmployeeDemographics
 ORDER BY 4 DESC, 5 DESC;