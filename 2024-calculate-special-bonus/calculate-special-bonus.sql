# Write your MySQL query statement below


SELECT 
    employee_id,
    CASE 
        WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;


# WITH cte AS (...)                              -- 1. CTE (if needed)
# SELECT [DISTINCT] columns, functions           -- 2. SELECT
# FROM table                                     -- 3. FROM
# [JOIN table2 ON connection]                    -- 4. JOIN (INNER, LEFT, RIGHT, CROSS)
# WHERE individual_row_conditions                -- 5. WHERE (before grouping)
# GROUP BY grouping_columns                      -- 6. GROUP BY (combine rows)
# HAVING group_conditions                        -- 7. HAVING (after grouping)
# ORDER BY columns [ASC|DESC]                    -- 8. ORDER BY (sort)
# LIMIT number                                   -- 9. LIMIT (limit rows)
# OFFSET number                                  -- 10. OFFSET (skip rows)