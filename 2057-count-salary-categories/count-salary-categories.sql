# Write your MySQL query statement below
WITH cat AS (
    SELECT account_id, CASE 
        WHEN income <20000 THEN 'Low Salary'
        WHEN income <=50000 THEN 'Average Salary'
        ELSE 'High Salary'
        end AS category
    FROM accounts
),

ref AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

SELECT r.category, COUNT(c.category) AS accounts_count
FROM ref r
LEFT JOIN cat c
ON r.category=c.category
GROUP BY r.category
ORDER BY accounts_count