-- 3º Reto Guiado SQL: Relaciones de tablas (JOINS).
-- 2.1. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.
SELECT  store.store_id,
	   CONCAT("first_name", ' ', "last_name") AS "Complete Name"
FROM staff
CROSS JOIN store 

-- 2.2. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT "customer"."customer_id" AS "Customer ID",
	   CONCAT("first_name", ' ', "last_name") AS "Complete Name",
        COUNT("rental_id") AS "· Rentals"
FROM customer
LEFT JOIN rental 
ON "customer"."customer_id" = "rental"."customer_id" 
GROUP BY "customer"."customer_id"

-- 2.3 Obtener todas las películas y, si están disponibles en inventario, mostrar la cantidad disponible.
SELECT "title" AS "Title",
       COUNT(inventory_id) AS "Inventory"
FROM film
LEFT JOIN inventory 
ON "film"."film_id" = "inventory"."film_id"
GROUP BY "title"
ORDER BY "Inventory" DESC

-- 2.4. Obtener los actores y el número de películas en las que ha actuado
SELECT CONCAT("first_name", ' ', "last_name") AS "Complete Name",
       COUNT("film_actor"."film_id") AS "Film IDs Quantity"
FROM actor
INNER JOIN film_actor
ON "actor"."actor_id" = "film_actor"."actor_id"
GROUP BY "Complete Name"
ORDER BY "Film IDs Quantity" ASC

-- 2.5. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.
SELECT "title",
	CONCAT("first_name", ' ', "last_name") AS "Complete Name"
FROM film
LEFT JOIN film_actor
ON "film"."film_id" = "film_actor"."film_id"
INNER JOIN actor
ON "film_actor"."actor_id" = "actor"."actor_id" 

-- 2.6. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.
SELECT CONCAT("first_name", ' ', "last_name") AS "Complete Name",
      "title"
FROM "film"
INNER JOIN "film_actor"
ON "film"."film_id" = "film_actor"."film_id"
RIGHT JOIN "actor"
ON "film_actor"."actor_id" = "actor"."actor_id"

-- 2.7. Obtener todas las películas que tenemos y todos los registros de alquiler.
SELECT "title",
	   "rental_id"
FROM "film"
INNER JOIN "inventory"
ON "inventory"."film_id" = "film"."film_id"
FULL JOIN rental
ON "rental"."inventory_id" = "inventory"."inventory_id"
ORDER BY "title"

-- 2.8. Encuentra el título de las películas que son de animación y tienen una duración mayor a 120 minutos en la tabla film.
SELECT "title",
       "name",
	   "length"
FROM "film"
INNER JOIN "film_category"
ON "film"."film_id" = "film_category"."film_id" 
INNER JOIN "category"
ON "film_category"."category_id" = "category"."category_id"
WHERE "name" = 'Animation' and "length" > 120
ORDER BY "length" ASC

-- 2.9. Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.
SELECT "name",
       ROUND(AVG("length"),0) AS "AVG. Length"
FROM category
INNER JOIN film_category
ON "film_category"."category_id" = "category"."category_id"
INNER JOIN "film"
ON "film_category"."film_id" = "film"."film_id" 
GROUP BY "name"
HAVING AVG(ROUND("length",0)) > 110
ORDER by "AVG. Length" ASC

-- 2.10. Obtén los 5 clientes españoles que más dinero se hayan gastado con nosotros.
SELECT "customer"."customer_id" AS "Customer ID",
	   CONCAT("first_name", ' ', "last_name") AS "Nombre",
	   SUM(amount) AS "Total Amount"
FROM "customer"
INNER JOIN "payment"
ON "customer"."customer_id" = "payment"."customer_id"
INNER JOIN "address"
ON "address"."address_id" = "customer"."address_id"
INNER JOIN "city"
ON "address"."city_id" = "city"."city_id" 
INNER JOIN "country"
ON "city"."country_id" = "country"."country_id"
WHERE "country"."country" = 'Spain'
GROUP BY "Customer ID" 
ORDER BY "Total Amount" DESC	
LIMIT 5