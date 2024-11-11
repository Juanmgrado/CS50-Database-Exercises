SELECT
    "first_name" AS "players_named_John",
    "last_name",
    "birth_year"
FROM
    "players"
WHERE
    LOWER("first_name") = 'john'
ORDER BY
    "birth_year" DESC
;
