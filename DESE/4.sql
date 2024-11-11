SELECT
    "city",
    COUNT("type") AS "publics_schools"
FROM
    "schools"
WHERE
    "type" LIKE '%Public%'
GROUP BY
    "city"
ORDER BY
    "publics_schools" DESC,
    "city"
LIMIT 10
;