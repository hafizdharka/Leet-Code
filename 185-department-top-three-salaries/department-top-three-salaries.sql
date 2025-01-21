SELECT D.name as Department, E.name as Employee, E.salary 
FROM department D, employee E, employee E2  
WHERE 
    (D.ID = E.DepartmentId) AND (E.DepartmentId = E2.DepartmentId) AND (E.salary <= E2.salary)
GROUP BY D.id,E.name HAVING COUNT(DISTINCT E2.salary) <= 3
ORDER BY D.name, E.salary DESC