# Write your MySQL query statement below

SELECT                                                          -- 2. SELECT
    date_id, 
    make_name, 
    COUNT(DISTINCT lead_id) unique_leads,
    COUNT(DISTINCT partner_id) unique_partners
FROM DailySales                                                 -- 3. FROM
GROUP BY date_id, make_name                                     -- 6. GROUP BY
ORDER BY date_id;                                               -- 8. ORDER BY

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