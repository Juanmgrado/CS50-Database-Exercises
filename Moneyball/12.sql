SELECT
    players."first_name",
    players."last_name"
FROM
    players
JOIN
    salaries ON salaries."player_id" = players."id"
JOIN
    performances ON performances."player_id" = players."id"
WHERE
    salaries."year" = 2001
    AND performances."year" = 2001
    AND players."id" IN (
        SELECT
            players."id"
        FROM
            players
        JOIN
            salaries ON salaries."player_id" = players."id"
        JOIN
            performances ON performances."player_id" = players."id"
        WHERE
            salaries."year" = 2001
            AND performances."year" = 2001
            AND performances."H" > 0
        ORDER BY
            (salaries."salary" / performances."H") ASC
        LIMIT 10
    )
    AND players."id" IN (
        SELECT
            players."id"
        FROM
            players
        JOIN
            salaries ON salaries."player_id" = players."id"
        JOIN
            performances ON performances."player_id" = players."id"
        WHERE
            salaries."year" = 2001
            AND performances."year" = 2001
            AND performances."RBI" > 0
        ORDER BY
            (salaries."salary" / performances."RBI") ASC
        LIMIT 10
    )
ORDER BY
    players."id" ASC;