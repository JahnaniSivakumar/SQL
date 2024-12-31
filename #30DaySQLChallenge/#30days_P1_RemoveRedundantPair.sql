-- Problem - 1: Remove Redundant Pair

/* Problem Statement:
- For pairs of brands in the same year (e.g. apple/samsung/2020 and samsung/apple/2020) 
    - if custom1 = custom3 and custom2 = custom4 : then keep only one pair

- For pairs of brands in the same year 
    - if custom1 != custom3 OR custom2 != custom4 : then keep both pairs

- For brands that do not have pairs in the same year : keep those rows as well
*/

-- Dataset

DROP TABLE IF EXISTS brands;
CREATE TABLE brands 
(
    brand1      VARCHAR(20),
    brand2      VARCHAR(20),
    year        INT,
    custom1     INT,
    custom2     INT,
    custom3     INT,
    custom4     INT
);
INSERT INTO brands VALUES ('apple', 'samsung', 2020, 1, 2, 1, 2);
INSERT INTO brands VALUES ('samsung', 'apple', 2020, 1, 2, 1, 2);
INSERT INTO brands VALUES ('apple', 'samsung', 2021, 1, 2, 5, 3);
INSERT INTO brands VALUES ('samsung', 'apple', 2021, 5, 3, 1, 2);
INSERT INTO brands VALUES ('google', NULL, 2020, 5, 9, NULL, NULL);
INSERT INTO brands VALUES ('oneplus', 'nothing', 2020, 5, 9, 6, 3);

SELECT * FROM brands;

-- Solution

WITH creating_pair_id AS (
			  SELECT *, 
			  CASE WHEN brand1 < brand2 THEN concat(brand1, brand2, year) 
			  ELSE concat(brand2, brand1, year) 
			  END AS pair_id
			  FROM brands),
			
creating_flag AS (
		  SELECT *, ROW_NUMBER() OVER(PARTITION BY pair_id ORDER BY pair_id) AS flag 
		  FROM creating_pair_id)

SELECT *
FROM creating_flag
WHERE flag = 1 or (custom1 <> custom3 and custom2 <> custom4);





