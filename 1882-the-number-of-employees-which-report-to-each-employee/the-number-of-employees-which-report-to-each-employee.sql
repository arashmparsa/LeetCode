# Write your MySQL query statement below
SELECT 
    m.employee_id,
    m.name,
    COUNT(e.employee_id) as reports_count,
    ROUND(AVG(e.age)) as average_age
FROM Employees m
JOIN Employees e ON m.employee_id = e.reports_to
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;





# WITH cte AS (...)                              -- 1. CTE (if needed)
# SELECT [DISTINCT] columns, functions           -- 2. SELECT
# FROM table                                     -- 3. FROM
# [JOIN table2 ON connection]                    -- 4. JOIN (INNER, LEFT, RIGHT, CROSS)
# WHERE individual_row_conditions                -- 5. WHERE (before grouping)
# GROUP BY grouping_columns                      -- 6. GROUP BY (combine rows)
# HAVING group_conditions                        -- 7. HAVING (after grouping)
# ORDER BY columns [ASC|DESC]                    -- 8. ORDER BY (sort)
# LIMIT number                                   -- 9. LIMIT (limit rows)
# OFFSET number                                  -- 10. OFFSET (skip rows)"