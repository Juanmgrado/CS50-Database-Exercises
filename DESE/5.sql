SELECT
    subquery."city",
    subquery."number_public_schools"
FROM (
    SELECT
        "city",
        COUNT(*) AS "number_public_schools"
    FROM
        "schools"
    WHERE
        "type" LIKE '%Public%'
    GROUP BY
        "city"
) AS subquery
WHERE
    subquery."number_public_schools" <= 3
ORDER BY
    subquery."number_public_schools" DESC,
    subquery."city";
