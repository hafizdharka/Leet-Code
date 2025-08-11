SELECT email
FROM person
group by email
having count(*)>1