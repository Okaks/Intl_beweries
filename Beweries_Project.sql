SELECT *
FROM beweries;

-- SELECT distinct(region)
-- FROM beweries

-- SESSION 1
-- Question 1
SELECT
	countries,
	SUM(profit) last_3Years_Profit
FROM beweries
WHERE years IN ('2019','2018','2017')
GROUP BY countries;

SELECT
	SUM(profit) last_3Years_Profit
FROM beweries;


Question 2
SELECT
	SUM(profit) Anglophone_Profit
FROM beweries
WHERE countries IN ('Nigeria', 'Ghana')

SELECT
	SUM(profit) Francophone_Profit
FROM beweries
WHERE countries IN ('Benin','Senegal' ,'Togo')

SELECT
CASE 
	WHEN countries IN ('Nigeria','Ghana') THEN 'Anglophone'
	WHEN countries IN ('Senegal','Togo','Benin') THEN 'Francophone'
END AS Territory,
SUM(profit) "Total_Profit"
FROM beweries
GROUP BY Territory
ORDER BY "Total_Profit" DESC;


-- Question 3
SELECT
	countries,
	SUM(profit) highest_profit
FROM beweries
WHERE years IN ('2019')
GROUP BY countries
ORDER BY highest_profit DESC
LIMIT 1;

-- Question 4
SELECT
	years,
	SUM(profit) highest_profit
FROM beweries
GROUP BY years
ORDER BY highest_profit DESC
LIMIT 1;

-- Question 5
SELECT
	months,
	SUM(profit) least_profit
FROM beweries
GROUP BY months
ORDER BY least_profit ASC
LIMIT 1;

-- Question 6
SELECT
	months,
	MIN(profit)
FROM beweries
WHERE months IN ('December') AND years IN('2018')
GROUP BY months;

-- Question 7
SELECT
	months,
	SUM(profit)*100/(SELECT SUM (profit)
					FROM beweries
					WHERE years IN ('2019')) AS percentage
FROM beweries
WHERE years IN ('2019')
GROUP by months
ORDER BY percentage DESC;

-- Question 8
SELECT
	brands,
	SUM(profit) highest_brand_profit
FROM beweries
WHERE countries IN ('Senegal')
GROUP BY brands
ORDER BY highest_brand_profit DESC
LIMIT 1;



-- SESSION B
SELECT  * FROM beweries;
-- Question 1
SELECT 
	brands,
	SUM(quantity) Top_Brands
FROM beweries
WHERE years IN ('2019', '2018') AND countries IN ('Senegal','Togo', 'Benin')
GROUP BY brands
ORDER BY Top_Brands DESC
LIMIT 3;

-- Question 2
SELECT
	brands,
	SUM(quantity) Top_Consumer_Brands
FROM beweries
WHERE countries IN ('Ghana')
GROUP BY brands
ORDER BY Top_Consumer_Brands DESC
LIMIT 2;

-- Question 3
SELECT
	brands,
	SUM(quantity) beers_consumed
FROM beweries
WHERE countries IN('Nigeria') AND brands NOT LIKE '%malt%'
GROUP BY brands
ORDER BY beers_consumed;

-- Question 4
SELECT 
	brands,
	SUM(quantity) favorite_malt_brand
FROM beweries 
WHERE brands LIKE ('%malt%') AND countries IN('Nigeria','Ghana') AND years IN('2018','2019')
GROUP BY brands
ORDER BY favorite_malt_brand DESC
LIMIT 1;

-- Question 5
SELECT
	brands,
	SUM(quantity) brands_sold
FROM beweries
WHERE years IN('2019') AND countries IN ('Nigeria')
GROUP BY brands
ORDER BY brands_sold DESC
LIMIT 1;


-- Question 6
SELECT
	brands,
	SUM(quantity) favorite_brand
FROM beweries
WHERE region IN('southsouth') AND countries IN ('Nigeria')
GROUP BY brands
ORDER BY favorite_brand DESC
LIMIT 1;


-- Question 7
SELECT
	brands,
	SUM(quantity) beer_consumption
FROM beweries
WHERE brands NOT LIKE ('%malt%') AND countries IN ('Nigeria')
GROUP BY brands
ORDER BY beer_consumption;

-- Question 8
SELECT
	region,
	SUM(quantity) "Budweiser Consumption"
FROM beweries
WHERE brands IN('budweiser') AND countries IN ('Nigeria')
GROUP BY region
ORDER BY "Budweiser Consumption";

-- Question 9
SELECT
	region,
	SUM(quantity) "Budweiser Consumption"
FROM beweries
WHERE brands IN('budweiser') AND countries IN ('Nigeria') AND years IN('2019')
GROUP BY region
ORDER BY "Budweiser Consumption" DESC;	

-- SECTION C 
-- Question 1
SELECT 
	countries,
	SUM (quantity) highest_consumption
FROM beweries
WHERE brands NOT LIKE '%malt%'
GROUP BY countries
ORDER BY highest_consumption DESC
LIMIT 1;

-- Question 2
SELECT 
	sales_rep,
	SUM(quantity) highest_sales_personell
FROM beweries
WHERE brands IN ('budweiser') AND countries IN ('Senegal')
GROUP BY sales_rep
ORDER BY highest_sales_personell DESC
LIMIT 1;

-- Question 3
SELECT
	countries,
	SUM(profit) fourth_quarter_profit
FROM beweries
WHERE years IN('2019') AND months IN ('October','November','December')
GROUP BY countries
ORDER BY fourth_quarter_profit DESC
LIMIT 1;
