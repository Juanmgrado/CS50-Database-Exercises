SELECT latitude, longitude, "0m" AS surface_temperature
FROM normals
ORDER BY surface_temperature ASC, latitude ASC
LIMIT 10;