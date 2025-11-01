# Write your MySQL query statement below
WITH cte AS(
    SELECT 
        e.employee_id,
        YEARWEEK(meeting_date, 1) AS week_num,  -- Mode 1: Monday = start of week
        SUM(duration_hours) AS total
    FROM employees e
    LEFT JOIN meetings m ON e.employee_id = m.employee_id
    GROUP BY e.employee_id, YEARWEEK(meeting_date, 1)
    HAVING SUM(duration_hours) > 20
)
    SELECT e.employee_id, e.employee_name, e.department, COUNT(*) AS meeting_heavy_weeks
    FROM employees e
    JOIN cte ON e.employee_id = cte.employee_id
    GROUP BY e.employee_id, e.employee_name, e.department
    HAVING COUNT(*) >= 2
    ORDER BY meeting_heavy_weeks DESC, e.employee_name ASC

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