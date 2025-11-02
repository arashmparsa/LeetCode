# Write your MySQL query statement below
WITH cte AS (
    SELECT 
        CASE WHEN MONTH(s.sale_date) IN (12,1,2) THEN 'Winter'
             WHEN MONTH(s.sale_date) IN (3,4,5) THEN 'Spring'
             WHEN MONTH(s.sale_date) IN (6,7,8) THEN 'Summer'
             ELSE 'Fall' END season,
        p.category,
        SUM(s.quantity) total_quantity,
        SUM(s.quantity * s.price) total_revenue,
        ROW_NUMBER() OVER(PARTITION BY CASE WHEN MONTH(s.sale_date) IN (12,1,2) THEN 'Winter' WHEN MONTH(s.sale_date) IN (3,4,5) THEN 'Spring' WHEN MONTH(s.sale_date) IN (6,7,8) THEN 'Summer' ELSE 'Fall' END ORDER BY SUM(s.quantity) DESC, SUM(s.quantity * s.price) DESC) rn
    FROM sales s JOIN products p ON s.product_id=p.product_id
    GROUP BY season, p.category
)
SELECT season, category, total_quantity, total_revenue FROM cte 
WHERE rn=1 
ORDER BY season;


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