USE International_Breweries;

SELECT 
    ba.Brands,
    SUM(Quantity) AS Quantity,
    t.Territory
FROM Brewery_Analysis ba
JOIN Territories t
USING (Country)
WHERE Territory = 'Francophone'
    AND Years IN ('2018','2019')
GROUP BY Territory, Brands
ORDER BY Brands DESC
LIMIT 3;

SELECT 
    Brands AS Choice_Brands,
    SUM(Quantity) AS Quantity_Ghana
FROM Brewery_Analysis
WHERE Country = 'Ghana'
GROUP BY Brands
ORDER BY SUM(Quantity) DESC
LIMIT 2;

SELECT
    Brands AS Beer,
    SUM(Cost) AS Cost,
    SUM(Profit) AS Profit,
    SUM(Quantity) AS Quantity,
    Years
FROM Brewery_Analysis
WHERE Country = 'Nigeria'
    AND Brands IN ('Trophy', 'Budweiser', 'Castle lite', 'Eagle Lager', 'Hero')
GROUP BY Brands, Years
ORDER BY Years, Brands;

SELECT 
    ba.Brands,
    SUM(Quantity) AS Quantity,
    ba.Years
FROM Brewery_Analysis ba
JOIN Territories t
USING (Country)
WHERE Territory = 'Anglophone'
    AND Years IN ('2018', '2019')
    AND Brands IN ('Beta Malt', 'Grand Malt')
GROUP BY Brands, Years
ORDER BY SUM(Quantity) DESC;

SELECT
    Brands AS Best_Seller,
    SUM(Quantity) AS Quantity
FROM Brewery_Analysis
WHERE Country = 'Nigeria'
    AND Years = '2019'
GROUP BY Brands
ORDER BY SUM(Quantity) DESC
LIMIT 1;

SELECT
    Brands AS Best_Seller_South,
    SUM(Quantity) AS Quantity
FROM Brewery_Analysis
WHERE Country = 'Nigeria'
    AND Region = 'Southsouth'
GROUP BY Brands
ORDER BY SUM(Quantity) DESC
LIMIT 1;

SELECT 
    Brands AS Beers,
    SUM(Quantity) AS Quantity
FROM Brewery_Analysis
WHERE Country = 'Nigeria'
    AND Brands IN ('Trophy', 'Budweiser', 'Castle lite', 'Eagle Lager', 'Hero')
GROUP BY Brands;

SELECT
  Brands,
  SUM(Quantity) AS Quantity,
  ROUND(
  (SUM(Quantity)/(SELECT SUM(Quantity)
  FROM Brewery_Analysis
  WHERE Country = 'Nigeria')) * 100,
  2) AS Level_of_Consumption,
  Region
FROM Brewery_Analysis
WHERE Country = 'Nigeria'
    AND Brands = 'Budweiser'
GROUP BY Brands, Region;




    
    