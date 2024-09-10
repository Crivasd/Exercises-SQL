-- 4º Reto Guiado SQL: Subqueries.

-- 2.1. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
SELECT CONCAT("first_name", ' ',"last_name") AS "nombre completo"
FROM "actor"
WHERE "actor_id" NOT IN (
          SELECT "actor_id"
          FROM "film_actor")

-- 2.2. Qué películas se alquilan por encima del precio medio. (Este ejercicio ya lo resolvimos en el segundo reto guiado de SQL)
SELECT "title",
	  "rental_rate"
FROM "film"
WHERE "rental_rate" > 
	   (SELECT ROUND(AVG("rental_rate"),2) AS "AVG rental_rate"   
       FROM "film")
ORDER BY "rental_rate" ASC

-- 2.3. Encuentra los nombres de las películas que tienen la misma duración que la película con el título "Dancing Fever" Ordena los resultados alfabéticamente por título de película.
SELECT "title", "length"
FROM "film"
WHERE "length" = (
	SELECT "length"
	FROM "film"
	WHERE "title" = 'DANCING FEVER'
)
AND "title" <> 'DANCING FEVER'
ORDER BY "title" ASC

-- 2.4. Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. Ordena los resultados alfabéticamente por apellido.
SELECT CONCAT("first_name", ' ',"last_name") AS "nombre completo"
FROM "customer"
WHERE "customer_id" IN(
	  SELECT "customer_id"
	  FROM "rental"
	  GROUP BY "customer_id"
	  HAVING(COUNT(DISTINCT("inventory_id"))>7)
)
ORDER BY "last_name" ASC

-- 2.5. Encuentra el nombre y apellido de los actores que aparecen en la película con título "Egg Igby".
SELECT CONCAT("first_name", ' ', "last_name") AS "Actors"
FROM "actor"
WHERE "actor_id" IN(
	SELECT "actor_id"
	FROM "film_actor"
	WHERE "film_id" IN(
	    SELECT "film_id"
	    FROM "film"
	    WHERE "title" = 'EGG IGBY'))

-- 2.6. Encuentra el título de todas las películas que son de la misma categoría que "Animation".
SELECT "title"
FROM film
WHERE "film_id" IN(
	SELECT "film_id"
	FROM "film_category"
	WHERE "category_id" IN(
	     SELECT "category_id"
	     FROM "category"
	     WHERE "name" = 'Animation'))

-- 2.7. Encuentra el título de todas las películas que fueron alquiladas por más de 8 días. 
SELECT "title"
FROM film
WHERE "film_id" IN(
	SELECT "film_id" 
	FROM "inventory"
	WHERE "inventory_id" IN(
	     SELECT "inventory_id"
	     FROM "rental"
	     WHERE DATE_PART('day',"return_date" - "rental_date") > 8))

-- 2.8. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Music".
SELECT CONCAT("first_name", ' ', "last_name") AS "Actors"
FROM Actor
WHERE "actor_id" NOT IN(
	SELECT "actor_id"
	FROM "film_actor"
	WHERE "film_id" IN(
	     SELECT "film_id"
	     FROM "film_category"
	     WHERE "category_id" IN(
	          SELECT "category_id"
	          FROM "category"
	          WHERE "name" = 'Music')))

-- 2.9. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre "Tammy Sanders" y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.
SELECT "title"
FROM "film"
WHERE "film_id" IN (
	   SELECT "film_id"
	   FROM "inventory"
	   WHERE "inventory_id" IN (
	     SELECT "inventory_id"
	     FROM "rental"
	     WHERE "customer_id" IN (
	        SELECT "customer_id"
	        FROM "customer"
	        WHERE CONCAT("first_name", ' ', "last_name")='TAMMY SANDERS') 
	     AND "return_date" IS NULL))
ORDER BY "title" ASC

-- 2.10. Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría "Sci-Fi." Ordena los resultados alfabéticamente por apellido.
SELECT CONCAT("first_name", ' ', "last_name") AS "Actors"
FROM Actor
WHERE "actor_id" IN(
	SELECT "actor_id"
	FROM "film_actor"
	WHERE "film_id" IN(
	     SELECT "film_id"
	     FROM "film_category"
	     WHERE "category_id" IN(
	          SELECT "category_id"
	          FROM "category"
	          WHERE "name" = 'Sci-Fi')))
ORDER BY "last_name" ASC

-- 2.11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
SELECT "c"."name" AS "category",
	  COUNT("fc"."category_id") AS "Num de peliculas de cada categoria"
FROM "category" AS "c"
INNER JOIN "film_category" AS "fc"
ON "c"."category_id"= "fc"."category_id"
WHERE "fc"."film_id" IN(
	SELECT "film_id"
	FROM "inventory"
	WHERE "inventory_id" IN(
	     SELECT "inventory_id"
	     FROM rental))
GROUP BY "c"."name"

-- 2.12. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película "Spartacus Cheaper" se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.
SELECT CONCAT("first_name", ' ', "last_name") AS "Actors"
FROM "actor"
WHERE "actor_id" IN(
	SELECT "actor_id"
	FROM "film_actor"
	WHERE "film_id" IN(
	      SELECT "film_id"
	      FROM "film"
	      WHERE "film_id" IN(
	           SELECT "film_id"
	           FROM "inventory"
	           WHERE "inventory_id" IN(
	                SELECT "inventory_id"
	                FROM "rental"
	                WHERE "inventory_id" IN(
	                     SELECT "inventory_id"
	                     FROM "inventory"
	                     WHERE "film_id" IN(
	                         SELECT "film_id"
	                         FROM "film"
	                         WHERE "title" = 'SPARTACUS CHEAPER'))
	               ORDER BY "rental_date"
	               LIMIT 1))))