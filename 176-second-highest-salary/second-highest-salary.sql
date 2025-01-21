# Write your MySQL query statement below
# Write your MySQL query statement below
WITH ranked AS (
    SELECT 
        *,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS ranks
    FROM employee)

SELECT (
    SELECT salary FROM ranked WHERE ranks=2
    LIMIT 1) AS SecondHighestSalary