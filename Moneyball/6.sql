SELECT
    teams."name",
    SUM("H") AS "total_hits"
FROM
    "performances"
JOIN
    "players" ON performances."player_id" = players."id"
JOIN
    "teams" ON performances."team_id" = teams."id"
WHERE
    performances."year" = 2001
GROUP BY
    teams."name"
ORDER BY
    "total_hits" DESC
LIMIT 5
;