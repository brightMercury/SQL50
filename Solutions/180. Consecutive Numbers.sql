/* Write your PL/SQL query statement below */
select distinct num as ConsecutiveNums
from
(select id, num, lag(num) over (order by id) prev_mum, lead(num) over (order by id) next_num
from Logs)
where num = prev_mum and num = next_num;
