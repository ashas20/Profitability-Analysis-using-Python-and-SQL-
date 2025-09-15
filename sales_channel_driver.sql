WITH profit_data AS (
SELECT DeliveryDate,
EXTRACT(MONTH from DeliveryDate) AS prof_month,
CONCAT(monthname(DeliveryDate),' ', EXTRACT(YEAR from DeliveryDate)) AS monthly_date,
Sales_Channel, 
SUM(Profit) AS summed_daily_profit
FROM Mysql_Learners.regional_sales_data
WHERE Sales_Channel = "Online"
GROUP BY DeliveryDate, prof_month, monthly_date, Sales_Channel
ORDER BY DeliveryDate ASC, summed_daily_profit ASC),

month_profits AS (
SELECT prof_month,
monthly_date,
Sales_Channel,
ROUND(SUM(summed_daily_profit),2) AS monthly_profit
FROM profit_data
GROUP BY prof_month, monthly_date, Sales_Channel)

SELECT monthly_date,
Sales_Channel,
monthly_profit
FROM month_profits;
