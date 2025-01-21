# Write your MySQL query statement below
# Write your MySQL query statement below
with ranked as (
    select 
        *,
        dense_rank() over(order by salary desc) as ranks
    from employee)

select (
    select salary from ranked where ranks=2
    limit 1) as SecondHighestSalary