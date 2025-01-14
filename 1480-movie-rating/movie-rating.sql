# Write your MySQL query statement below
(SELECT name AS results
FROM MovieRating m
JOIN users u
ON m.user_id=u.user_id
GROUP BY name
ORDER BY count(rating) DESC, name ASC
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM MovieRating m
JOIN movies v
ON m.movie_id=v.movie_id
WHERE YEAR(created_at)=2020 AND MONTH(created_at)=2
GROUP BY m.movie_id
ORDER BY AVG(rating) DESC, title ASC
LIMIT 1
)