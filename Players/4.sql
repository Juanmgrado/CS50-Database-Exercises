SELECT
    "first_name",
    "last_name"
FROM
    "players"
WHERE
    "birth_country" != 'United States'
ORDER BY
    "last_name",
    "first_name"
;