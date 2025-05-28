-- SESSION C --

USE International_Breweries;

SELECT 
    Country AS Highest_Consumers,
    SUM(Quantity) AS Quantity
FROM Brewery_Analysis
JOIN Drink_Brands USING (Brands)
WHERE Brand_Category = 'Beer'
GROUP BY Country, Brands
ORDER BY SUM(Quantity) DESC
LIMIT 1;

SELECT
    Sales_Rep,
    Brands,
    SUM(Quantity) AS Quantity
FROM brewery_Analysis
WHERE Brands = 'Budweiser'
   AND Country ='Senegal'
GROUP BY Brands, Sales_Rep
ORDER BY SUM(Quantity) DESC
LIMIT 1;

SELECT
    Country,
    SUM(Profit) AS Total_Q4_Profit
FROM Brewery_Analysis
WHERE Months IN ('October', 'November', 'December')
GROUP BY Country
ORDER BY SUM(Profit) DESC
LIMIT 1;