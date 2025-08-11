SELECT 
    t1.name as Employee
FROM 
    employee t1
LEFT JOIN 
    employee t2
ON 
    t1.managerId=t2.Id
WHERE
    t1.salary>t2.salary
