With main as (
SELECT 
reports_to AS employee_id, 
COUNT(employee_id) AS reports_count, 
ROUND(AVG(age),0) AS average_age
FROM employees
GROUP BY reports_to
HAVING 
    COUNT(employee_id) > 0 AND reports_to IS NOT NULL
)

SELECT c.employee_id, e.name, c.reports_count, c.average_age
FROM main c
LEFT JOIN employees e
ON c.employee_id=e.employee_id
ORDER BY c.employee_id