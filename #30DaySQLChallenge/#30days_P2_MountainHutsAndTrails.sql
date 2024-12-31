-- Problem Statement

/*
A ski resort company is planning to construct a new ski slope using a pre-existing network of 
mountain huts and trails between them. A new slope has to begin at one of the mountain huts, 
have a middle station at another hut connected with the first one by a direct trail,  and end at 
the third mountain hut which is also connected by a direct trail to the second hut. The altitude 
of the three huts chosen for constructing the ski slope has to be strictly decreasing. 
*/


-- Dataset

/*You are given two SQL tables, mountain_huts and trails, with the following structure: */
create table mountain_huts ( 
id integer not null, 
name varchar(40) not null, 
altitude integer not null, 
unique(name), 
unique(id) 
); 
create table trails ( 
hut1 integer not null, 
hut2 integer not null 
); 
insert into mountain_huts values (1, 'Dakonat', 1900); 
insert into mountain_huts values (2, 'Natisa', 2100); 
insert into mountain_huts values (3, 'Gajantut', 1600); 
insert into mountain_huts values (4, 'Rifat', 782); 
insert into mountain_huts values (5, 'Tupur', 1370); 
insert into trails values (1, 3); 
insert into trails values (3, 2); 
insert into trails values (3, 5); 
insert into trails values (4, 5); 
insert into trails values (1, 5);

-- Conditions

/*

Each entry in the table trails represents a direct connection between huts with IDs hut1 and 
hut2. Note that all trails are bidirectional. 
Create a query that finds all triplets(startpt,middlept,endpt) representing the mountain huts 
that may be used for construction of a ski slope. 
Output returned by the query can be ordered in any way.

*/


-- Solution
WITH trail_1 AS (
					SELECT t1.hut1 AS start_hut, m1.name AS start_hut_name,
					m1.altitude AS start_hut_altitude, t1.hut2 AS end_hut
					FROM trails t1
					JOIN mountain_huts m1 ON
					m1.id = t1.hut1),


trail_2 AS(
			SELECT  t2.*, m2.name AS end_hut_name, m2.altitude AS end_hut_altitude,
			CASE WHEN start_hut_altitude > m2.altitude THEN 1 ELSE 0 END AS altitude_flag
			FROM trail_1 t2
			JOIN mountain_huts m2 ON 
			m2.id = t2.end_hut), 

sorted_trail AS(
					SELECT 
					CASE WHEN altitude_flag = 1 THEN start_hut  
						 ELSE end_hut END AS start_hut,
					CASE WHEN altitude_flag = 1 THEN start_hut_name 
						 ELSE end_hut_name END AS start_hut_name,
					CASE WHEN altitude_flag = 1 THEN end_hut  
						 ELSE start_hut END AS end_hut,
					CASE WHEN altitude_flag = 1 THEN end_hut_name 
						 ELSE start_hut_name END AS end_hut_name 
					FROM trail_2)


-- Possible three way trails: 
-- 1 , 3, 5
-- 2, 3, 5
-- 3, 5, 4
-- 1, 5, 4


SELECT s1.start_hut_name, s1.end_hut_name AS middle_hut_name, s2.end_hut_name AS end_hut_name  
FROM sorted_trail s1 
JOIN sorted_trail s2
ON s1.end_hut = s2.start_hut


