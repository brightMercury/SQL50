/* Write your PL/SQL query statement below */
WITH countall AS 
(SELECT requester_id AS id 
FROM RequestAccepted
UNION ALL 
SELECT accepter_id AS id
FROM RequestAccepted)

SELECT * FROM 
(SELECT id, count(id) AS num
FROM countall
GROUP BY id
ORDER BY num DESC)
WHERE ROWNUM =1;


