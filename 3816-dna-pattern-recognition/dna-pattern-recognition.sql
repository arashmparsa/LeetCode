# Write your MySQL query statement below

SELECT 
    sample_id,
    dna_sequence,
    species,
    CASE WHEN dna_sequence LIKE 'ATG%' THEN 1 ELSE 0 END AS has_start,
    CASE WHEN dna_sequence LIKE '%TAA' OR dna_sequence LIKE '%TAG' OR dna_sequence LIKE '%TGA' THEN 1 ELSE 0 END AS has_stop,
    CASE WHEN dna_sequence LIKE '%ATAT%' THEN 1 ELSE 0 END AS has_atat,
    CASE WHEN dna_sequence LIKE '%GGG%' THEN 1 ELSE 0 END AS has_ggg
FROM Samples
ORDER BY sample_id ASC


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