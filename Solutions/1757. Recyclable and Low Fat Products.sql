/*
Link to problem on LeetCode:
https://leetcode.com/problems/recyclable-and-low-fat-products/description/
*/

/*
This is my solution to the problem in Oracle SQL
*/
SELECT product_id 
FROM Products
WHERE low_fats ='Y' AND recyclable ='Y';