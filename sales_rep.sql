SELECT EXTRACT(YEAR FROM DeliveryDate) AS sales_year,
SalesTeamID,
ROUND(SUM(Profit),2) AS summed_profit
FROM Mysql_Learners.regional_sales_data
GROUP BY SalesTeamID, EXTRACT(YEAR FROM DeliveryDate)
ORDER BY sales_year, SalesTeamID
LIMIT 5;