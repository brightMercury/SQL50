/* Write your PL/SQL query statement below */
WITH cte AS
(SELECT person_name,weight,turn,
SUM(weight) OVER (ORDER BY turn) AS total 
FROM Queue)

SELECT person_name FROM
(SELECT person_name, total
FROM cte
WHERE total <= 1000
ORDER BY total DESC)
WHERE rownum = 1;