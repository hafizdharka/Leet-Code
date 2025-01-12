# Write your MySQL query statement below
select case
    when exists (select num from MyNumbers group by num having count(num)=1 order by num desc)
    then (select num from MyNumbers group by num having count(num)=1 order by num desc limit 1)
    else null
end as num
    