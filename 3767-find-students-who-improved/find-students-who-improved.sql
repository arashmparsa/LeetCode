# Write your MySQL query statement below

# CTE: Create temporary lookup table with first & last exam dates
# This table filters for student-subject pairs that have exams on at least 2 different dates
# For each eligible pair, we capture:
#   - first_date: earliest exam date (to fetch the first score)
#   - last_date: latest exam date (to fetch the latest score)
#   - exam_count: number of distinct exam dates (used in HAVING filter)
WITH first_last AS (
    SELECT 
        student_id,
        subject,
        MIN(exam_date) AS first_date,      # Earliest exam date
        MAX(exam_date) AS last_date,       # Latest exam date
        COUNT(DISTINCT exam_date) AS exam_count
    FROM Scores
    GROUP BY student_id, subject
    HAVING COUNT(DISTINCT exam_date) >= 2  # Only keep pairs with 2+ exam dates
)

# Main query: Join CTE twice with Scores table to get actual scores
# Then filter for students who improved (latest score > first score)
SELECT 
    f.student_id,
    f.subject,
    s1.score AS first_score,               # Score from earliest exam
    s2.score AS latest_score               # Score from latest exam
FROM first_last f

# First join: Get the score from the first (earliest) exam date
JOIN Scores s1 ON f.student_id = s1.student_id 
    AND f.subject = s1.subject 
    AND f.first_date = s1.exam_date

# Second join: Get the score from the latest (most recent) exam date
JOIN Scores s2 ON f.student_id = s2.student_id 
    AND f.subject = s2.subject 
    AND f.last_date = s2.exam_date

# Filter: Keep only students who showed improvement (latest > first)
WHERE s2.score > s1.score

# Sort results by student_id and subject in ascending order
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