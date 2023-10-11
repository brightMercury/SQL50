/* Write your PL/SQL query statement below */
WITH cte AS
(SELECT departmentId, name, salary
FROM (
SELECT departmentId, name, salary,
DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
FROM employee
) t
WHERE salary_rank < 4)

SELECT d.name AS Department, cte.name AS Employee, cte.Salary AS Salary
FROM cte
JOIN Department d
ON d.id = cte.departmentId;


