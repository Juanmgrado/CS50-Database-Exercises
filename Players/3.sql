SELECT
    "id"
FROM
    "players"
WHERE
    "debut" IS NULL
    OR
    "debut" = 'missing'
;
