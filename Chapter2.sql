--2.1 Get all the unique companies producing Drinking water in alphabetic order.

SELECT DISTINCT MANUFACTURER.COMPANY, PRODUCT.WARE
FROM MANUFACTURER, PRODUCT
WHERE MANUFACTURER.RECIPE_ID=PRODUCT.RECIPE_ID 
AND WARE = 'Drinking water'
ORDER BY COMPANY ASC;


--2.3 Get all the unique wares in alphabetical order that can be produced from wares in Mineral category.

SELECT PRODUCT.WARE FROM PRODUCT
INTERSECT
SELECT CATEGORY.WARE FROM CATEGORY
WHERE CATEGORY.CLASS = 'Mineral'
ORDER BY PRODUCT.WARE ASC


  
--3.1 Get all the unique wares in the alphabetic order with the minimal and maximal prices for each.
  
SELECT WARE, MAX(PRICE), MIN(PRICE)
FROM PRODUCT
GROUP BY WARE
ORDER BY WARE  


--3.2 Show top 3 wares with the most difference between minimal and maximal prices.

SELECT WARE, MAX(PRICE) - MIN(PRICE)     FROM PRODUCT
GROUP BY WARE
ORDER BY MAX(PRICE) - MIN(PRICE) DESC
LIMIT 0, 3


--3.3 Show top 3 companies producing the largest number of different products. 
  
SELECT DISTINCT MANUFACTURER.COMPANY, COUNT(PRODUCT.WARE)   FROM MANUFACTURER, PRODUCT
WHERE MANUFACTURER.RECIPE_ID=PRODUCT.RECIPE_ID 
GROUP BY WARE 
ORDER BY COUNT(PRODUCT.WARE) DESC
LIMIT 0, 3

--3.4 Show the price of the most expensive ware for each category. The result should be ordered by the category

SELECT MAX(PRICE), CATEGORY.CLASS
FROM CATEGORY, PRODUCT
WHERE CATEGORY.WARE = PRODUCT.WARE
GROUP BY CATEGORY.CLASS
ORDER BY CLASS ASC  

--3.6 Get all the companies in alphabetical order that producing at least 2 different wares from the same category
  
SELECT DISTINCT MANUFACTURER.COMPANY, SUM(PRODUCT.AMOUNT), SUM(MATERIAL.AMOUNT)   FROM MANUFACTURER, PRODUCT, MATERIAL
WHERE MANUFACTURER.RECIPE_ID = PRODUCT.RECIPE_ID = MATERIAL.RECIPE_ID
AND PRODUCT.AMOUNT > MATERIAL.AMOUNT
GROUP BY MANUFACTURER.COMPANY 
ORDER BY MANUFACTURER.COMPANY

--4.1 Show the product with the largest average price over the market.
  
SELECT AVG(PRICE) FROM PRODUCT
GROUP BY WARE
ORDER BY AVG(PRICE) DESC 
LIMIT 0, 1   --TOP 1


--4.3 Show the most expensive ware in each category and its price
  
SELECT CLASS, MAX(PRICE)
FROM CATEGORY, PRODUCT
WHERE CATEGORY.WARE = PRODUCT.WARE
GROUP BY CATEGORY.CLASS
