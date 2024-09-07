SELECT COUNT(Brand_Name) AS Number_of_Brands
FROM `database`.`flipkart-data`;


SELECT Brand_Name, COUNT(*) AS SKU_Count
FROM `database`.`flipkart-data`
GROUP BY Brand_Name
ORDER BY SKU_Count DESC;  -- Optional: You can order by SKU_Count descending if you want to see which brand has the most SKUs


	WITH SKU_Rank AS (
    SELECT Brand_Name, Ranking,
           ROW_NUMBER() OVER (PARTITION BY Brand_Name ORDER BY Ranking ASC) AS SKU_Rank
    FROM `database`.`flipkart-data`
)
SELECT Brand_Name,
       COUNT(*) AS SKU_Count,
       SUM(SKU_Rank) AS Total_Rank_Score,
       AVG(Ranking) AS Average_Ranking
FROM SKU_Rank
GROUP BY Brand_Name
ORDER BY Total_Rank_Score ASC;  -- Adjust the ORDER BY as per your ranking criteria


WITH SKU_Rating AS (
    SELECT Brand_Name, Rating,
           ROW_NUMBER() OVER (PARTITION BY Brand_Name ORDER BY Rating ASC) AS SKU_Rating
    FROM `database`.`flipkart-data`
)
SELECT Brand_Name,
       COUNT(*) AS SKU_Count,
       SUM(SKU_Rating) AS Total_Rating_Score,
       AVG(Rating) AS Average_Rating
FROM SKU_Rating
GROUP BY Brand_Name
ORDER BY Total_Rating_Score ASC; 



SELECT 
    Price_Band,
    COUNT(*) AS SKU_Count
FROM (
    SELECT 
        CASE 
            WHEN Price < 3000 THEN '< 3000'
            WHEN Price >= 3000 AND Price < 5000 THEN 'INR 3000-4999'
            WHEN Price >= 5000 AND Price < 10000 THEN 'INR 5000-9999'
            WHEN Price >= 10000 AND Price < 15000 THEN 'INR 10000-14999'
            WHEN Price >= 15000 AND Price < 20000 THEN 'INR 5000-19999'
            WHEN Price >= 20000 THEN 'Greater than 20000'
            ELSE 'Unknown'
        END AS Price_Band
    FROM `database`.`flipkart-data`
) AS Price_Bands
GROUP BY Price_Band
ORDER BY 
    CASE 
        WHEN Price_Band = '< INR  3000' THEN 1
        WHEN Price_Band = 'INR 3000-4999' THEN 2
        WHEN Price_Band = 'INR 5000-9999' THEN 3
        WHEN Price_Band = 'INR 10000-14999' THEN 4
        WHEN Price_Band = 'INR 15000-19999' THEN 5
        WHEN Price_Band = 'Greater than 20000' THEN 6
        ELSE 7
    END;
