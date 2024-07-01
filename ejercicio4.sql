--Ejercicio 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").
CREATE TABLE pedidos (
	id INT PRIMARY KEY,
	ID_USUARIOS INT,
	CONSTRAINT id_usuarios 
	FOREIGN KEY (id_usuarios)
	REFERENCES usuarios(id),
	id_producto INT,
	CONSTRAINT id_producto FOREIGN KEY (id_producto) REFERENCES productoss(id)
)

--Ejercicio 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.
INSERT INTO pedidos(id, id_usuarios, id_producto)
VALUES(1, 2, 3),
      (2, 1, 4),
      (3, 4, 5)

--Ejercicio 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).
SELECT usuarios.nombre, productoss.nombre, COALESCE(productoss.nombre, 'NO COMPRÓ FRUTA') FROM Usuarios
LEFT JOIN productoss ON productoss.id = usuarios.id

--Ejercicio 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).
SELECT usuarios.nombre FROM Usuarios
LEFT JOIN productoss ON productoss.id = usuarios.id

--Ejercicio 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)
ALTER TABLE pedidos
ADD cantidad INT
ALTER TABLE pedidos
DROP CONSTRAINT id_usuarios;
ALTER TABLE pedidos
DROP CONSTRAINT id_producto;
UPDATE pedidos SET id = 11 WHERE id = 2;
UPDATE pedidos SET id = 12 where id =3;
UPDATE pedidos SET id = 13 where id =1;
UPDATE pedidos SET id_usuarios = 20 where id_usuarios =1;
UPDATE pedidos SET id_usuarios = 17 where id_usuarios =4;
UPDATE pedidos SET id_usuarios = 11 where id_usuarios =2;
UPDATE pedidos SET id_producto = 2 where id_producto =4;
UPDATE pedidos SET id_producto = 16 where id_producto =5;
UPDATE pedidos SET id_producto = 1 where id_producto =3