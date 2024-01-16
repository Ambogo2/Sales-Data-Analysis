CREATE DATABASE Projects;

USE projects;

SELECT * FROM Sales;

-- CLEANING
-- 1) Remove unwanted column
ALTER TABLE Sales
DROP COLUMN `Purchase Address`;

-- 2) Check datatypes
DESCRIBE Sales;

-- 3) Convert datatypes
ALTER TABLE Sales
MODIFY COLUMN `Order Date` date;

-- 4) Check for null values
SELECT COUNT(*)
FROM Sales
WHERE `Order ID` IS NULL;

-- 5) Check for duplicates
SELECT `Order ID`, COUNT(`Order ID`)
FROM Sales
GROUP BY `Order ID`
HAVING COUNT(`Order ID`) > 1;


 -- QUESTIONS
 -- 1) What is the total sales generated?
 SELECT SUM(Sales)
 FROM Sales;
 
 -- 2) What is the total Quantity ordered?
 SELECT SUM(`Quantity Ordered`)
 FROM Sales;
 
 -- 3) What is the average Revenue?
 SELECT AVG(Sales)
 FROM Sales;
 
 -- 4) Which product generated the highest sales?
 SELECT Product, SUM(Sales) as Total_Sales
 FROM Sales
 GROUP BY Product
 ORDER BY Total_Sales DESC;
 
 -- 5) What product had the higest quantity ordered?
 SELECT Product, COUNT(`Quantity Ordered`) as Total_ordered
 FROM Sales
 GROUP BY Product
 ORDER BY Total_ordered DESC;

 -- 6) Where do we have the highest orders by city?
SELECT City, COUNT(`Quantity Ordered`) as Total_ordered
 FROM Sales
 GROUP BY City
 ORDER BY Total_ordered DESC;
 
 -- 7) What is the breakdown of Sales by City and products?
SELECT Product, City, SUM(Sales) as Total_Sales
 FROM Sales
 GROUP BY Product, City;
 
 -- 8) What is best month by sales?
SELECT Month, SUM(Sales) as Total_sales
FROM Sales
GROUP BY Month
ORDER BY Month DESC;
 
 