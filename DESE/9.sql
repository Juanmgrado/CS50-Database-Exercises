SELECT
    districts."name"
FROM
    "districts"
JOIN
    "expenditures" ON districts."id" = expenditures."district_id"
GROUP BY
    districts."name"
ORDER BY
    SUM(expenditures."pupils") ASC
LIMIT 1;
