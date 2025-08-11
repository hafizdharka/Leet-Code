With cte as(
    SELECT 
        DENSE_RANK() OVER(ORDER BY SALARY DESC) ranked,
        salary 
    FROM
        Employee
)

SELECT 
    Max(salary) as SecondHighestSalary
FROM 
    cte
WHERE 
    ranked=2
