/* Write your PL/SQL query statement below */
with cte3 as (
select visited_on, sum(amount) as amount from customer group by visited_on) 
,cte1 as (
SELECTvisited_on, 
SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN  6  PRECEDING AND CURRENT ROW) AS amount, 
ROUND(SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN  6  PRECEDING AND CURRENT ROW)/7, 2) AS average_amount, 
MIN(visited_on) OVER() AS start_date
from cte3)

select to_char(visited_on,'yyyy-mm-dd') as visited_on, amount, average_amount
FROM cte1 
WHERE visited_on >= start_date + 6;