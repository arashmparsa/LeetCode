# Write your MySQL query statement below
WITH 
seasonal_sales AS (
    SELECT 
        CASE
            WHEN MONTH(s.sale_date) IN (12,1,2) THEN 'Winter'
            WHEN MONTH(s.sale_date) IN (3,4,5) THEN 'Spring'
            WHEN MONTH(s.sale_date) IN (6,7,8) THEN 'Summer'
            WHEN MONTH(s.sale_date) IN (9, 10, 11) THEN 'Fall' 
        END  AS season
        ,p.category
        ,SUM(s.quantity) AS total_quantity
        ,SUM(s.quantity * s.price) AS total_revenue
    FROM sales s
    JOIN products p
        ON s.product_id=p.product_id
    GROUP BY season, p.category
)
,ranked_categories AS(
    SELECT
        season
        ,category
        ,total_quantity
        ,total_revenue
        ,ROW_NUMBER() OVER(PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC) AS rnk
    FROM seasonal_sales
)
SELECT 
    season
    ,category
    ,total_quantity
    ,total_revenue
FROM ranked_categories
WHERE RNK=1
ORDER BY season


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