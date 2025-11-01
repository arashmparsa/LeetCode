# Write your MySQL query statement below
# Write your MySQL query statement below
SELECT uni.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI uni ON e.id = uni.id;

#SELECT 
#  CASE WHEN uni.unique_id IS NOT NULL THEN uni.unique_id ELSE NULL #END AS unique_id, 
#  e.name
#FROM Employees e
#LEFT JOIN EmployeeUNI uni ON e.id = uni.id;