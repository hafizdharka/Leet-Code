WITH base AS (
    SELECT 
        *,
        SUM(weight) OVER(ORDER BY turn) AS cuw
    FROM queue
)

SELECT person_name
FROM base
WHERE cuw<=1000
ORDER BY cuw DESC
LIMIT 1