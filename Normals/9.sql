SELECT latitude, longitude, "0m" AS surface_temperature
FROM normals
ORDER BY surface_temperature DESC, latitude ASC
LIMIT 10;