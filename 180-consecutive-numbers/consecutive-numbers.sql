WITH CTE AS
(
    SELECT 
        num, 
        LAG(num,1) OVER(ORDER BY id) AS sec,
        LAG(num,2) OVER(ORDER BY id) as third
    FROM 
        logs
)
    
SELECT 
    DISTINCT (num) AS ConsecutiveNums
FROM
    CTE
WHERE
    (num=sec) AND (sec=third)