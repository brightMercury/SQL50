/* Write your PL/SQL query statement below */
select TO_CHAR(activity_date,'YYYY-MM-DD') as day, count(distinct user_id) as active_users
from Activity
where activity_date between '2019-06-28' and '2019-07-27'
group by activity_date;