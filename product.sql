SELECT 
EXTRACT(YEAR from DeliveryDate) AS sale_year,
ProductID, 
ROUND(SUM(Profit),2) AS monthly_profit
FROM Mysql_Learners.regional_sales_data
GROUP BY ProductID, EXTRACT(YEAR from DeliveryDate)
ORDER BY ProductID, sale_year;

