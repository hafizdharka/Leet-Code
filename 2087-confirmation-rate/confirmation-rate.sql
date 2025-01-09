select s.user_id, round(count(case when action='confirmed' then 1 else null end)/count(s.user_id),2) as confirmation_rate
from signups s
left join confirmations c
on s.user_id=c.user_id
group by user_id