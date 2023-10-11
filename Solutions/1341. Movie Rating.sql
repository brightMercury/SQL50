/* Write your PL/SQL query statement below */
with cte1 as (
select name, rank() over( order by count(movierating.user_id) desc, name) as rn from movierating join users on movierating.user_id = users.user_id  group by name )
,cte2 as (
select title, rank() over (order by avg(rating) desc, title) as rn from movierating m join movies on m.movie_id = movies.movie_id  where to_char(created_at,'YYYY-MM') = '2020-02' group by title)

select name as results from cte1 where rn = 1
union all
select title as results from cte2 where rn = 1