SELECT
    "name",
    "city"
FROM
    "schools"
WHERE
    "state" = 'Massachusetts'
    AND ("type" = 'Public School' OR "type" = 'Charter School')
ORDER BY
    "city",
    "name";