/* Write your PL/SQL query statement below */
WITH cte1 AS (
SELECT product_id , new_price, 
row_number() over(partition by product_id ORDER BY change_date DESC) AS rn FROM products WHERE to_char(change_date, 'yyyy-mm-dd') < = '2019-08-16')

SELECT DISTINCT p.product_id, nvl(cte1.new_price,10) AS price 
FROM products p 
LEFT JOIN cte1 
ON p.product_id = cte1.product_id AND rn = 1;