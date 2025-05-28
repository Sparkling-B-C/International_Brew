USE International_Breweries;
-- SESSION A PROFIT ANALYSIS --

SELECT 
    SUM(Profit) AS Profits, 
    t.Country, 
    t.Territory
FROM Brewery_Analysis ba
JOIN Territories t
USING (Country)
GROUP BY t.Country, t.Territory;

SELECT 
     SUM(Profit) AS Total_Profit,
     t.Territory
FROM Brewery_Analysis ba
JOIN Territories t
USING (Country)
GROUP BY t.Territory;

SELECT 
    SUM(Profit) AS Highest_Profit_2019,
    Country,
    Years
FROM Brewery_Analysis
WHERE Years = '2019'
GROUP BY Country
ORDER BY SUM(Profit) DESC
LIMIT 1;

SELECT 
    MAX(Profit) AS Max_Profit_December2018,
    Months,
    Years
FROM Brewery_Analysis
WHERE Months = 'December' AND Years = '2018';

SELECT
  Months,
  SUM(Profit) AS Profit_2019,
  ROUND(
  (SUM(Profit)/(SELECT SUM(Profit)
  FROM Brewery_Analysis
  WHERE Years = '2019')) * 100,
  2) AS Profit_Percentage_2019
FROM Brewery_Analysis
WHERE Years = '2019'
GROUP BY Months;

SELECT
    SUM(Profit) AS Highest_Brand_Senegal,
    Brands,
    Country
FROM Brewery_Analysis
WHERE Country = 'Senegal'
GROUP BY Brands, Country
ORDER BY SUM(Profit) DESC
LIMIT 1;

    
    
