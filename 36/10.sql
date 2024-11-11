SELECT english_title, entropy AS "Entropia"
FROM views
WHERE artist = 'Hokusai'
ORDER BY entropy ASC;