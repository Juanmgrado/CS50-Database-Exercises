SELECT DISTINCT
    teams."name" AS "team_name"
FROM
    "performances"
JOIN "players" ON performances."player_id" = players."id"
JOIN "teams" ON performances."team_id" = teams."id"
WHERE
    LOWER("first_name") = 'satchel'
    AND
    LOWER("last_name") = 'paige'
;