WITH CTE AS(
    SELECT 
        d.name as dept_name,
        e.name as emp_name,
        e.salary,
        DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) as ranked
    FROM employee e
    LEFT JOIN department d
    ON e.departmentId=d.id
)

SELECT 
    dept_name as Department,
    emp_name as Employee,
    salary as Salary
FROM CTE
WHERE ranked=1