# Write your MySQL query statement below
SELECT 
    ip,
    COUNT(*) as invalid_count
FROM logs
WHERE 
    -- Check: Not exactly 3 dots (i.e., not 4 octets)
    (LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) != 3)
    OR
    -- Check: Leading zeros in any octet
    SUBSTRING_INDEX(ip, '.', 1) REGEXP '^0[0-9]'
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) REGEXP '^0[0-9]'
    OR SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) REGEXP '^0[0-9]'
    OR SUBSTRING_INDEX(ip, '.', -1) REGEXP '^0[0-9]'
    OR
    -- Check: Any octet > 255
    CAST(SUBSTRING_INDEX(ip, '.', 1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 3), '.', -1) AS UNSIGNED) > 255
    OR CAST(SUBSTRING_INDEX(ip, '.', -1) AS UNSIGNED) > 255
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;