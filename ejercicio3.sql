--Ejercicio 3
--Ejercici1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).
CREATE TABLE Productoss(
	id INT Primary KEY,
	nombre VARCHAR(250),
	precio numeric
)

--Ejercicio 2. Inserta al menos cinco registros en la tabla "Productos".
INSERT INTO productoss (id, nombre, precio)
VALUES(1, 'manzana', 3),
      (2, 'pera', 4),
      (3, 'banana', 1),
      (4, 'platano', 3),
      (5, 'fresa', 5),
      (6, 'kiwi', 10)

--Ejercicio 3. Actualiza el precio de un producto en la tabla "Productos".
UPDATE productoss SET precio = 10 where precio = 1

--Ejercicio 4. Elimina un producto de la tabla "Productos".
DELETE FROM productoss where id = 2

--Ejercicio 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").
SELECT usuarios.nombre, productoss.nombre FROM usuarios
INNER JOIN productoss 
ON usuarios.id = productoss.id