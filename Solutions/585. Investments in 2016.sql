/* Write your PL/SQL query statement below */
select SUM(tiv_2016) as tiv_2016 
from Insurance
where tiv_2015 IN 
(select tiv_2015 from Insurance 
group by tiv_2015 
having COUNT(*) > 1)
AND
(lat, lon) NOT IN 
(select lat, lon from Insurance group by lat, lon having COUNT(*) > 1)