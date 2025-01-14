# Write your MySQL query statement below
WITH un AS (
    SELECT requester_id AS id
    FROM requestaccepted 
    UNION ALL
    SELECT accepter_id AS id
    FROM requestaccepted
)

SELECT id, COUNT(id) AS num
FROM un
GROUP BY id
ORDER BY num DESC
LIMIT 1