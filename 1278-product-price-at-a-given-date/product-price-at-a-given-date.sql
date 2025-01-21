WITH cte AS(
    SELECT 
        *,
        RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS ranks
    FROM products
    WHERE change_date <= '2019-08-16'),

product AS(
    SELECT DISTINCT product_id
    FROM products
)

SELECT p.product_id, IFNULL(new_price,10) AS price
FROM product p
LEFT JOIN cte c
ON p.product_id=c.product_id
WHERE ranks=1 OR ranks IS NULL
