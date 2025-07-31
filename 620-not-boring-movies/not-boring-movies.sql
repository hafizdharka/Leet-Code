select *
from  cinema c
where (id%2!=0) and (description not like '%boring%')
order by rating desc