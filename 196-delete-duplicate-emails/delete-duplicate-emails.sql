WITH dummy AS (
    SELECT id, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) AS rn
    FROM person
)

DELETE FROM person
WHERE id IN(
    SELECT id FROM dummy WHERE rn>1
)
