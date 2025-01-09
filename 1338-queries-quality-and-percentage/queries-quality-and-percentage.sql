select query_name, round(avg(rating/position),2) as quality, round(sum(rating<3)/count(result)*100,2) as poor_query_percentage
from queries q
group by query_name 