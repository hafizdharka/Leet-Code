with cte as(
    select 
        *,
        rank() over(partition by product_id order by change_date desc) as ranks
    from products
    where change_date <= '2019-08-16'),

product as(
    select distinct product_id
    from products
)


select p.product_id, ifnull(new_price,10) as price
from product p
left join cte c
on p.product_id=c.product_id
where ranks=1 or ranks is null
