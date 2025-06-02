--2.1 Get all the unique companies producing Drinking water in alphabetic order.

SELECT DISTINCT MANUFACTURER.COMPANY, PRODUCT.WARE
FROM MANUFACTURER, PRODUCT
WHERE MANUFACTURER.RECIPE_ID=PRODUCT.RECIPE_ID 
AND WARE = 'Drinking water'
ORDER BY COMPANY ASC;


--2.3 Get all the unique wares in alphabetical order that can be produced from wares in Mineral category.

SELECT DISTINCT PRODUCT.WARE FROM PRODUCT
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
