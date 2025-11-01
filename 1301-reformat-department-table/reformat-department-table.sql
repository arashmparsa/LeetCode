# Write your MySQL query statement below

SELECT 
  id,
  MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
  MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
  MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
  MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
  MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
  MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
  MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
  MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
  MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
  MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
  MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
  MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;



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