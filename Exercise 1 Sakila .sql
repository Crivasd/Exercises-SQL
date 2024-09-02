---Ejercicio 3.2. Selecciona todos los nombres de las películas únicos.
SELECT DISTINCT("title") AS "Titulo"
FROM film

-- Ejercicio 3.3. Crea una columna con el nombre y apellidos de todos los actores y actrices.
SELECT CONCAT("first_name",' ', "last_name") AS "Nombre y Apellido"
FROM actor

-- Ejercicio 3.4 Muestra los nombres de todas las películas con una clasificación por edades de "R".
SELECT "title" AS "Titulo",
	   "rating" AS "Clasificacion"
FROM film
WHERE "rating" = 'R'

-- Ejercicio 3.5. Obtén las películas que tenemos cuyo idioma conicide con el idioma original
SELECT "title" AS "Titulo"
FROM film
WHERE "language_id" = "original_language_id"

-- Ejercicio 3.6. Encuentra el nombre y apellido de los actores que tengan "Allen"" en su apellido.
SELECT CONCAT("first_name",' ', "last_name") AS "Name y Last Name"
FROM actor
WHERE "last_name" ILIKE 'Allen'

-- Ejercicio 3.7. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
SELECT "title" AS "Title", 
	   "length" AS "Length in minutes"
FROM film
WHERE "length" > 180

-- Ejercicio 3.8. Encuentra los nombres de los actores que tengan un actor_id entre 30 y 40
SELECT CONCAT("first_name", ' ', "last_name") AS "Complete Name",
	   "actor_id" 
FROM actor
WHERE actor_id BETWEEN 30 AND 40

-- Ejercicio 3.9. Encuentra el título de las películas en la tabla film que no sean ni "NC-17" ni "G" en cuanto a su clasificación
SELECT "title" AS "Title",
	   "rating"
FROM film
WHERE rating NOT IN ('NC-17','G')

-- Ejercicio 3.10. Encuentra el título de todas las películas que son "PG-13" o tienen una duración mayor a 3 horas en la tabla film.
SELECT "title" AS "Title",
	   "rating",
	   "length"
FROM film
WHERE "rating" = 'PG-13' OR "length" > 180

-- Ejercicio 3.11. Encuentra la mayor y menor duración de una película de nuestra BBDD
SELECT MAX("length"),
	   MIN ("length")
FROM film

-- Ejercicio 3.12. ¿Cuántas películas distintas tenemos?
SELECT COUNT (DISTINCT "title") AS "Quantity of unique titles"
FROM film

-- Ejercicio 3.13. ¿Cuánto dinero ha generado en total la empresa?
SELECT SUM("amount") AS "Total profit"
FROM payment

-- Ejercicio 3.14. ¿Cuál es la media de duración del alquiler de las películas?
SELECT ROUND(AVG(length),1) AS "Length Average"
FROM film

-- Ejercicio 3.15. Encuentra la variabilidad de los que costaría reemplazar las películas
SELECT ROUND(STDDEV_SAMP("replacement_cost"),2) AS "Average Replacement Cost"
FROM film