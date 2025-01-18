# Write your MySQL query statement below
Select product_name, sum(unit) as unit
from orders o
left join products p
on o.product_id=p.product_id
where month(order_date)='02' and year(order_date)='2020'
group by product_name
having sum(unit)>=100