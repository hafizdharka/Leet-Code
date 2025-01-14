# Write your MySQL query statement below
with sumz as (
    select visited_on, sum(amount) as amount
    from customer
    group by visited_on)

select 
    visited_on, 
    sum(amount) over (order by visited_on rows between 6 preceding and current row) as amount, 
    round(avg(amount) over(order by visited_on rows between 6 preceding and current row),2) as average_amount
from sumz
limit 5000 offset 6