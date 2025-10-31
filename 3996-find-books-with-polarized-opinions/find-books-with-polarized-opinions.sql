# Write your MySQL query statement below
SELECT 
    b.book_id,
    b.title,
    b.author,
    b.genre,
    b.pages,
    (MAX(rs.session_rating) - MIN(rs.session_rating)) AS rating_spread,
    ROUND(
        SUM(CASE WHEN rs.session_rating <= 2 OR rs.session_rating >= 4 THEN 1 ELSE 0 END) 
        / COUNT(*), 
        2
    ) AS polarization_score

FROM books b
JOIN reading_sessions rs ON b.book_id = rs.book_id
GROUP BY b.book_id, b.title, b.author, b.genre, b.pages
HAVING 
    COUNT(*) >= 5
    AND MAX(rs.session_rating) >= 4
    AND MIN(rs.session_rating) <= 2
    AND ROUND(
        SUM(CASE WHEN rs.session_rating <= 2 OR rs.session_rating >= 4 THEN 1 ELSE 0 END) 
        / COUNT(*), 
        2
    ) >= 0.6
ORDER BY polarization_score DESC, b.title DESC;