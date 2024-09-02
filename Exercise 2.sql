--Ejercicio 2
--ejercicio 1. Crea una base de datos llamada "MiBaseDeDatos".
CREATE TABLE MiBaseDeDatos()

--ejercicio2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).
CREATE TABLE Usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)

--ejercicio3. Inserta dos registros en la tabla "Usuarios".
INSERT INTO usuarios(id, nombre, edad)
VALUES(1, 'juan', 23),
      (2, 'carlos', 24)

--ejercicio4. Actualiza la edad de un usuario en la tabla "Usuarios".
UPDATE usuarios SET edad = 35 WHERE edad = 24

--ejercicio5. Elimina un usuario de la tabla "Usuarios".
DELETE FROM usuarios WHERE edad = 35

--Nivel de dificultad: Moderado
--ejercicio1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto).
CREATE TABLE Ciudades(
	id INT PRIMARY KEY,
	nombre VARCHAR(250),
	pais VARCHAR(250)
)

--ejercicio2. Inserta al menos tres registros en la tabla "Ciudades".
INSERT INTO ciudades (id, nombre, pais)
VALUES(1, 'Madrid', 'España'),
      (2, 'Roma', 'Italia') ,
      (3, 'Barcelona', 'España') 

--ejercicio3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".
ALTER TABLE Usuarios 
ADD CONSTRAINT id
FOREIGN KEY (id)
REFERENCES ciudades(id)

--ejercicio4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).
SELECT usuarios.nombre, ciudades.nombre, ciudades.pais 
FROM usuarios
LEFT JOIN ciudades 
ON ciudades.id = usuarios.id

--ejercicio5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).
SELECT usuarios.nombre FROM usuarios
INNER JOIN ciudades
ON ciudades.id = usuarios.id
