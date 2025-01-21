with base as (
    select 
        *,
        sum(weight) over(order by turn) as cuw
    from queue
)

select person_name
from base
where cuw<=1000
order by cuw desc
limit 1