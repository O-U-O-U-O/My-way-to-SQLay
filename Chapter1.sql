--1.1
SELECT DISTINCT COMPANY 
FROM MANUFACTURER 
ORDER BY COMPANY 

--1.2
SELECT COUNT(DISTINCT COMPANY)
FROM MANUFACTURER

--1.3
SELECT DISTINCT WARE
FROM CATEGORY 
WHERE CLASS = 'Food'

--1.4
SELECT DISTINCT COMPANY FROM MANUFACTURER 
WHERE COMPANY LIKE 'A%' OR COMPANY LIKE 'B%'
ORDER BY COMPANY  

--1.5 Get all the unique final products (i.e. the wares that are not in use as a material anywhere)
  
SELECT DISTINCT WARE
FROM PRODUCT
WHERE WARE NOT IN (SELECT WARE FROM MATERIAL)

--1.6 Get all the unique wares that could not be produced
  
SELECT DISTINCT WARE FROM CATEGORY
WHERE WARE NOT IN (SELECT WARE FROM PRODUCT)    

--1.7 Get all the unique wares that both materials and products
  
SELECT DISTINCT WARE FROM MATERIAL
WHERE WARE IN (SELECT WARE FROM PRODUCT)    

--1.8. Get the minimal and maximal prices of Paper
  
SELECT MIN(PRICE), MAX(PRICE)    
FROM PRODUCT 

--1.9 Get the average price and variance price of Meat, both rounded to one decimal point.
  
SELECT ROUND(AVG(PRICE))
FROM PRODUCT
WHERE WARE = 'Meat'

