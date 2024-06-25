-- CREATE THE TABLE FOR BUSINESSES
CREATE TABLE businesse(
	business VARCHAR(100) PRIMARY KEY,
	year_founded INTEGER,
	category VARCHAR(100),
	country_code VARCHAR(100)
);

CREATE TABLE category (
	category_code VARCHAR(100) PRIMARY KEY,
	category VARCHAR(100)
);

CREATE TABLE countries(
	country_code VARCHAR(100) PRIMARY KEY,
	country CHAR(100),
	continent VARCHAR(100)
);


-- OLDEST AND NEWEST FOUNDED BUSINESS 
SELECT  MAX(year_founded), MIN(year_founded)
FROM businesse;

-- How many businesses were founded before 1000?
SELECT COUNT(*)
FROM businesse 
WHERE year_founded < 1000;

--Which businesses were founded before 1000
SELECT business
FROM businesse
WHERE year_founded <1000;

-- THE OLDEST BUSINESS AND WHAT THEY DO 
SELECT business, year_founded, country, category
FROM businesse as b
join countries AS C 
ON c.country_code = b.country_code
WHERE year_founded < 1000;


--Counting the categories 
SELECT c.category, count(business) no_cat
FROM category AS c
JOIN businesse AS b
ON b.category = c.category_code
GROUP BY c.category
ORDER BY COUNT(business) DESC;


-- Oldest business by continent 
WITH TRY AS	
(SELECT continent, min(year_founded) as v
FROM businesse AS b
JOIN countries as c
ON c.country_code = b.country_code
GROUP BY continent)
	
	
SELECT continent, v, business
FROM TRY 
JOIN businesse 
on TRY.v = businesse.year_founded;


-- Counting categories by continent
SELECT COUNT(*), continent
FROM businesse AS b 
JOIN countries AS c
ON c.country_code = b.country_code
GROUP BY continent;


select * from category, ;