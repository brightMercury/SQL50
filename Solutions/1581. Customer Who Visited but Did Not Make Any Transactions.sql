/* Write your PL/SQL query statement below */
SELECT customer_id, count (customer_id) AS count_no_trans
FROM Visits
WHERE visit_id IN (SELECT visit_id FROM Visits
minus
SELECT visit_id FROM Transactions)
GROUP BY customer_id
ORDER BY count_no_trans;