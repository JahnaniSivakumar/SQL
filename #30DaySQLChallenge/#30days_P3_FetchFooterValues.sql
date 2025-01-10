-- Problem Statement
/*

Write a sql query to return the footer values from input table, meaning all the last non null values from each field as shown in expected output.
*/

-- Dataset

DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER 
(
	id 			INT PRIMARY KEY,
	car 		VARCHAR(20), 
	length 		INT, 
	width 		INT, 
	height 		INT
);

INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 

SELECT * FROM FOOTER;

-- Solution 1

SELECT * FROM footer

SELECT t.* FROM (
					(SELECT car FROM footer where car is not null order by id desc limit 1) car
					CROSS JOIN
					(SELECT length FROM footer where length is not null order by id desc limit 1) length
					CROSS JOIN
					(SELECT width FROM footer where width is not null order by id desc limit 1) width
					CROSS JOIN
					(SELECT height FROM footer where height is not null order by id desc limit 1) height
					) AS t

-- Solution 2 
with cte as(
				select *, 
				sum(case when length is not null then 1 else 0 end) over(order by  id) as l_flag,
				sum(case when width is not null then 1 else 0 end) over(order by  id) as w_flag,
				sum(case when height is not null then 1 else 0 end) over(order by  id) as h_flag
				from footer
				)

select car, 
first_value(length) over(partition by l_flag order by id) as length,
first_value(width) over(partition by w_flag order by id) as width,
first_value(height) over(partition by h_flag order by id) as height
from cte
order by id desc limit 1;
