# Write your MySQL query statement below
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
WHERE e.id IN (
    SELECT e2.id
    FROM Employee e2
    WHERE (
        SELECT COUNT(DISTINCT e3.salary)
        FROM Employee e3
        WHERE e3.departmentId = e2.departmentId
        AND e3.salary > e2.salary
    ) < 3
)