# Write your MySQL query statement below
WITH RECURSIVE chars AS (
    -- Base case: process the first character
    SELECT 
        content_id,
        content_text,
        1 AS pos,
        CAST(
            CASE 
                WHEN SUBSTRING(content_text, 1, 1) REGEXP '[a-zA-Z]' 
                THEN UPPER(SUBSTRING(content_text, 1, 1))
                ELSE SUBSTRING(content_text, 1, 1)
            END 
            AS CHAR(500)
        ) AS converted
    FROM user_content
    
    UNION ALL
    
    -- Recursive case: process remaining characters
    SELECT 
        c.content_id,
        c.content_text,
        c.pos + 1,
        CONCAT(
            c.converted,
            CASE 
                -- Letter after space/hyphen → UPPERCASE
                WHEN SUBSTRING(c.content_text, c.pos + 1, 1) REGEXP '[a-zA-Z]' 
                     AND SUBSTRING(c.content_text, c.pos, 1) IN (' ', '-')
                THEN UPPER(SUBSTRING(c.content_text, c.pos + 1, 1))
                -- Other letters → lowercase
                WHEN SUBSTRING(c.content_text, c.pos + 1, 1) REGEXP '[a-zA-Z]'
                THEN LOWER(SUBSTRING(c.content_text, c.pos + 1, 1))
                -- Non-letters → keep as is
                ELSE SUBSTRING(c.content_text, c.pos + 1, 1)
            END
        )
    FROM chars c
    WHERE c.pos < LENGTH(c.content_text)
)
SELECT 
    content_id,
    content_text AS original_text,
    converted AS converted_text
FROM chars
WHERE pos = LENGTH(content_text)
ORDER BY content_id;