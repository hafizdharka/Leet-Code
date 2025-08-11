WITH CTE AS(
    SELECT
        e.name Employee,
        d.name Department,
        e.salary Salary,
        DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) as ranked
    FROM employee e
    LEFT JOIN department d
    ON e.departmentId=d.id
)

SELECT Department, Employee, Salary
FROM CTE
WHERE ranked<=3
