with cte as(
    select num
    from MyNumbers m1
    group by m1.num
    having count(*)=1
)

select max(num) as num
from cte