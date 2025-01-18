# Write your MySQL query statement below
with cte as (
    select account_id, case 
        when income <20000 then 'Low Salary'
        when income <=50000 then 'Average Salary'
        else 'High Salary'
        end as category
    from accounts
),

ref AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

select r.category, count(c.category) as accounts_count
from ref r
left join cte c
on r.category=c.category
group by r.category
order by accounts_count