# Write your MySQL query statement below
select name
from employee e1
inner join (select managerId from employee group by managerId having count(managerId)>=5) e2
on e1.id=e2.managerId