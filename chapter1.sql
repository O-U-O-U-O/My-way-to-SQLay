--1.1
--SELECT DISTINCT COMPANY RECIPE_ID
--FROM MANUFACTURER 
--ORDER BY COMPANY 

--1.2
--SELECT COUNT(DISTINCT COMPANY)
--FROM MANUFACTURER

--1.3
SELECT DISTINCT WARE
FROM CATEGORY 
WHERE CLASS = 'Food'