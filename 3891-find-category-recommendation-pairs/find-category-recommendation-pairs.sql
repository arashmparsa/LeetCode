# Write your MySQL query statement below
WITH user_categories AS (
    -- Get distinct categories each user purchased from
    SELECT DISTINCT 
        pp.user_id,
        pi.category
    FROM ProductPurchases pp
    JOIN ProductInfo pi ON pp.product_id = pi.product_id
),
category_pairs AS (
    -- Create pairs where category1 < category2 for each user
    SELECT 
        uc1.user_id,
        uc1.category as category1,
        uc2.category as category2
    FROM user_categories uc1
    JOIN user_categories uc2 
        ON uc1.user_id = uc2.user_id 
        AND uc1.category < uc2.category
),
pair_customer_count AS (
    -- Count distinct users per category pair
    SELECT 
        category1,
        category2,
        COUNT(DISTINCT user_id) as customer_count
    FROM category_pairs
    GROUP BY category1, category2
)
SELECT 
    category1,
    category2,
    customer_count
FROM pair_customer_count
WHERE customer_count >= 3
ORDER BY customer_count DESC, category1 ASC, category2 ASC;