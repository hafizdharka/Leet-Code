# Write your MySQL query statement below
WITH sumz AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on)

SELECT 
    visited_on, 
    SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 preceding AND current ROW) AS amount, 
    ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 preceding AND current ROW),2) AS average_amount
FROM sumz
LIMIT 5000 OFFSET 6