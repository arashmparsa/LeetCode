# Write your MySQL query statement below
SELECT name
FROM SalesPerson s
WHERE sales_id NOT IN (
    SELECT DISTINCT o.sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE c.name = 'RED'
) # finds orders not RED sales_id
ORDER BY name;