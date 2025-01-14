# Write your MySQL query statement below
select id,
    case when mod(id,2)=0 then lag(student,1) over()
    else coalesce(lead(student,1)over(),student)
    end as student
from seat