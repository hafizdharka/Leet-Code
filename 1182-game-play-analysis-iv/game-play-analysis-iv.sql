WITH 
    first AS (
        SELECT player_id, MIN(event_date) AS first_login
        FROM activity A
        GROUP BY player_id
    ),

    consec AS (
        SELECT COUNT(B.player_id) AS total_log
        FROM first B
        INNER JOIN activity A
            ON B.player_id = A.player_id 
            AND B.first_login = DATE_SUB(A.event_date, INTERVAL 1 DAY)
    )

SELECT ROUND((SELECT total_log FROM consec)/
        (SELECT COUNT(player_id) FROM first),2) AS fraction