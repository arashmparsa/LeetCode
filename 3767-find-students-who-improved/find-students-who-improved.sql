# Write your MySQL query statement below
WITH first_last AS (
    SELECT 
        student_id,
        subject,
        MIN(exam_date) AS first_date,
        MAX(exam_date) AS last_date,
        COUNT(DISTINCT exam_date) AS exam_count
    FROM Scores
    GROUP BY student_id, subject
    HAVING COUNT(DISTINCT exam_date) >= 2
)
SELECT 
    f.student_id,
    f.subject,
    s1.score AS first_score,
    s2.score AS latest_score
FROM first_last f
JOIN Scores s1 ON f.student_id = s1.student_id 
    AND f.subject = s1.subject 
    AND f.first_date = s1.exam_date
JOIN Scores s2 ON f.student_id = s2.student_id 
    AND f.subject = s2.subject 
    AND f.last_date = s2.exam_date
WHERE s2.score > s1.score
ORDER BY f.student_id, f.subject;






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