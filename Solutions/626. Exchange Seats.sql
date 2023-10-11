/* Write your PL/SQL query statement below */
select
case 
when mod(id,2)=0 then lag(id,1) over(order by id)
else coalesce(lead(id,1) over(order by id),id)
end as id,
student from seat
order by 1;