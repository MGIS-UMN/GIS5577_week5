SELECT ST_AsText(geom)
FROM us_states
-- function for converting geom type to Text

SELECT f_table_schema || f_table_name
FROM geometry_columns
-- concatenating to fields converts it to text

SELECT ST_GeometryFromText('Point('|| x ||
' ' || y || ')',4326)
-- Convert a table with x,y coordinates to a geometry field

CREATE TABLE us_cities(
city_id integer,
x double precision,
y double precision,
geomtext text
)
-- build a table

SELECT ST_GeometryFromText('Point('|| x ||
' ' || y || ')',4326)
-- Convert a table with x,y coordinates to a geometry field

SELECT *
FROM us_cities

ALTER TABLE us_cities ADD geom geometry;
-- Add a geometry field

UPDATE us_cities
SET geom = ST_GeometryFromText('Point('|| x ||
' ' || y || ')',4326)
-- update the geometry field (geom) with the geometry

SELECT s.name, count(c.city_id),
FROM us_cities c 
INNER JOIN us_states s ON ST_Intersects(c.geom, s.geom)
WHERE lower(name) = 'new york'
GROUP BY s.name
-- Count the number of cities in new york

SELECT ST_area(ST_Transform(geom,26915))
FROM us_states
LIMIT 5
--  calculate area of the geomery
