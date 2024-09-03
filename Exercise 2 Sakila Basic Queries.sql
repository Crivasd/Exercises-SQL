--2º Exercise Guiado SQL: Advanced Queries.

-- 2.1. Ordena las películas por duración de forma ascendente
SELECT "title",
	  "length"
FROM film
ORDER BY "length" ASC

-- 2.2. Muestra los 10 clientes con mayor valor de id
SELECT "customer_id",
	   CONCAT("first_name", ' ', "last_name") AS "Nombre y Apellido"
FROM customer
ORDER BY "customer_id" DESC
LIMIT 10

-- 2.3. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.
SELECT "payment_date",
       "amount"
FROM payment
LIMIT 1 OFFSET 3

-- 2.4. Qué películas se alquilan por encima del precio medio. Para este ejercicio tendrás que generar dos queries diferentes. Una primera para calcular la media y la segunda para obtener las películas que se alquilan por encima de ese valor.
SELECT "title",
	   "rental_rate"
FROM film
WHERE "rental_rate" > (SELECT ROUND(AVG("rental_rate"),1)
	                   FROM film)
ORDER BY "rental_rate" DESC

-- 2.5. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT DISTINCT COUNT("title") AS "Cantidad de peliculas",
                       "rating"
FROM film
GROUP BY film.rating

-- 2.6. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT ROUND(AVG("length"),1) AS "Media de duracion",
                       "rating"
FROM film
GROUP BY film.rating

-- 2.7. Números de alquileres por día. Ordenados por cantidad de alquileres de forma descendente.
SELECT CONCAT(EXTRACT(DAY FROM "rental_date"), '-', EXTRACT( MONTH FROM "rental_date"), '-', EXTRACT(YEAR FROM "rental_date")) AS "Fecha_Alquiler",
              COUNT ("rental_id") AS "Cantidad de alquileres"
FROM rental
GROUP BY "Fecha_Alquiler"
ORDER BY "Cantidad de alquileres" DESC  

-- 2.8. Averigua el número de alquileres registrados por mes.
SELECT EXTRACT(MONTH FROM "rental_date") AS "Mes",
        COUNT("rental_id") AS "Cantidad de alquileres"
FROM rental
GROUP BY "Mes"
ORDER BY "Cantidad de alquileres" ASC 

-- 2.9. Número de películas por categoría estrenadas en 2006
SELECT DISTINCT COUNT("film_id") AS "Numero de peliculas",
     film_category."category_id",
	 category."name"
FROM film_category
INNER JOIN category ON film_category."category_id" = category."category_id"
WHERE EXTRACT(YEAR FROM film_category."last_update") = 2006
GROUP BY film_category."category_id", category."name"
ORDER BY "Numero de peliculas" DESC

-- 2.10. Muestra el id de los actores que hayan participado en más de 40 películas.
SELECT film_actor."actor_id",
       CONCAT(actor."first_name", ' ', actor."last_name") AS "Nombre completo"
FROM film_actor
INNER JOIN actor ON film_actor."actor_id" = actor."actor_id"
GROUP BY film_actor."actor_id", "Nombre completo", film_actor."film_id"
HAVING COUNT(DISTINCT (film_actor."film_id")) > 40
ORDER BY film_actor."film_id" DESC