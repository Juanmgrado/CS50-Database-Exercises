SELECT
    districts."name" AS "district_name",
    COUNT(schools."id") AS "num_schools",
    expenditures."per_pupil_expenditure"
FROM
    "districts"
JOIN "schools" ON districts."id" = schools."district_id"
JOIN "expenditures" ON districts."id" = expenditures."district_id"
WHERE
    expenditures."per_pupil_expenditure" > (
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    )
GROUP BY
    districts."name",
    expenditures."per_pupil_expenditure"
ORDER BY
    "num_schools" DESC
LIMIT 10;
