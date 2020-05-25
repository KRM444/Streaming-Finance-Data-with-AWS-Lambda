SELECT raw.name AS Company_Name,
         SUBSTRING(raw.ts, 12, 2) AS Hour_Of_Day,
         raw.ts AS Date_Time_Of_When_High_Price_Occurred,
         maxvalues.max_high AS High_Stock_Price
FROM "21" raw
INNER JOIN 
    (SELECT name,
         SUBSTRING(ts, 12, 2) AS hour,
         MAX(high) AS max_high
    FROM "21"
    GROUP BY  name, SUBSTRING(ts, 12, 2) ) maxvalues
    ON raw.name = maxvalues.name
        AND SUBSTRING(raw.ts, 12, 2) = maxvalues.hour
        AND raw.high = maxvalues.max_high
ORDER BY  raw.name ASC, SUBSTRING(raw.ts, 12, 2) ASC
