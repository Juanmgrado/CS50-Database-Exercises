SELECT
    salaries."salary"
FROM
    "players"
JOIN
    "salaries" ON salaries."player_id" = players."id"
JOIN
    "performances" ON performances."player_id" = players."id"
WHERE
    salaries."year" = 2001
    AND
    performances."year" = 2001
    AND
    performances."HR" = (
        SELECT
            MAX("HR")
        FROM
            "performances"
    )
;