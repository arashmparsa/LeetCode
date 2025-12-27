# Write your MySQL query statement below
WITH top_performers AS (
    -- Step 1: Identify students with at least 5 courses and avg rating >= 4
    SELECT user_id
    FROM course_completions
    GROUP BY user_id
    HAVING COUNT(*) >= 5 AND AVG(course_rating) >= 4
),
course_pairs AS (
    -- Step 2: For each top performer, find consecutive course pairs using LEAD()
    SELECT 
        c.course_name AS first_course,
        LEAD(c.course_name) OVER (
            PARTITION BY c.user_id 
            ORDER BY c.completion_date
        ) AS second_course
    FROM course_completions c
    INNER JOIN top_performers tp ON c.user_id = tp.user_id
)
-- Step 3: Count transitions and order results
SELECT 
    first_course,
    second_course,
    COUNT(*) AS transition_count
FROM course_pairs
WHERE second_course IS NOT NULL
GROUP BY first_course, second_course
ORDER BY transition_count DESC, first_course ASC, second_course ASC;