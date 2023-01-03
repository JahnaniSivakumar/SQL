--FIRST SAMPLE QUERY
SELECT 1+6 AS RESULT
GO -- USED FOR BATCH QUERY RUN
SELECT 1*8 AS RESULT
GO
SELECT 1/0 AS RESULT --HERE ONLY THIS QUERY WILL NOT GIVE RESULT AND SAYS ERROR WHEREAS THE OTHER TWO QUERIES PROVIDES RESULT
GO
SELECT 1/1 AS RESULT -- RESULT DISPLAYED

--PRACTICE ACTIVITY NUMBER - 1
--1. What is 4 Plus 9? Please call the column MyAnswer
SELECT 4+9 AS MyAnswer;
--2. What is 15 minus 26? Please call the column Balance
SELECT 15-26 AS Balance;
--3. What is 24 times 4 plus 3? Please call the column Result
SELECT 24*4+3 AS Result;
--4. What is 48 divided by 4? Please call the column Result
SELECT 48/4 AS Result;