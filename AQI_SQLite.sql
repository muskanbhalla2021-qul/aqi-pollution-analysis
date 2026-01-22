#1 — The most polluted cities

SELECT City,
       AVG(AQI_Value) AS avg_aqi
FROM cleaned_aqi_data_v2
GROUP BY City
ORDER BY avg_aqi DESC
LIMIT 10;






#2 — Shows trends over time

SELECT Month,
       AVG(AQI_Value) AS avg_aqi
FROM cleaned_aqi_data_v2
GROUP BY Month
ORDER BY Month;






#3 — Rank cities by pollution

SELECT City,
       AVG(AQI_Value) AS avg_aqi,
       RANK() OVER (ORDER BY AVG(AQI_Value) DESC) AS pollution_rank
FROM cleaned_aqi_data_v2
GROUP BY City;






#4 — AQI Category Breakdown

SELECT AQI_Category,
       COUNT(*) AS total_days
FROM cleaned_aqi_data_v2
GROUP BY AQI_Category;





#5 — Worst City per Year

WITH city_year AS (
    SELECT City,
           Year,
           AVG(AQI_Value) AS avg_aqi
    FROM cleaned_aqi_data_v2
    GROUP BY City, Year
)
SELECT *
FROM city_year
ORDER BY avg_aqi DESC
LIMIT 10;

