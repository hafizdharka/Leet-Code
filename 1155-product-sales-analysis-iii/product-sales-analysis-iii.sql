WITH first AS (
    SELECT product_id, MIN(year) as first_year
    FROM sales
    GROUP BY product_id
)

SELECT s.product_id, year AS first_year, s.quantity, s.price
FROM sales s
INNER JOIN first f
    ON s.product_id=f.product_id AND s.year=f.first_year