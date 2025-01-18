# Write your MySQL query statement below
SELECT product_name, SUM(unit) AS unit
FROM orders o
LEFT JOIN products p
ON o.product_id=p.product_id
WHERE MONTH(order_date)='02' AND YEAR(order_date)='2020'
GROUP BY product_name
HAVING SUM(unit)>=100