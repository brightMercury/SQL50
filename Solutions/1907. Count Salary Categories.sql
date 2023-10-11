/* Write your PL/SQL query statement below */
with cats as
(select 
case when income < 20000 then 1 else 0 end as low,
case when income between 20000 and 50000 then 1 else 0 end as average,
case when income > 50000 then 1 else 0 end as high
from Accounts)

select 'Low Salary' as category, sum(low) as accounts_count
from cats
union all
select 'Average Salary' as category, sum(average) as accounts_count
from cats
union all
select 'High Salary' as category, sum(high) as accounts_count
from cats;