SELECT
    districts."name",
    expenditures."pupils"
FROM
    "expenditures"
JOIN
    "districts" ON expenditures."district_id" = districts."id"
;