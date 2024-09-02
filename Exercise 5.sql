--Ejercicio 5

--Ejercicio 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).
CREATE TABLE clientes(
	id INT,
	nombre VARCHAR(250)
)

--Ejercicio 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".
INSERT INTO clientes(id, nombre)
VALUES(1, 'John')

--Ejercicio3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".
UPDATE clientes SET nombre = 'John Doe' WHERE nombre = 'John'

--Ejercicio4. Elimina el cliente con id=1 de la tabla "Clientes".
DELETE FROM clientes where id = 1

--Ejercicio 5. Lee todos los clientes de la tabla "Clientes".
SELECT * from clientes 

--Ejercicio6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero).
CREATE TABLE pedidos(
	id INT,
	cliente_id INT
)

--Ejercicio 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".
INSERT INTO pedidos(id, cliente_id)
VALUES(1, 1)

--Ejercicio8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".
UPDATE pedidos SET cliente_id = 2 where id = 1

--Ejercicio9. Elimina el pedido con id=1 de la tabla "Pedidos".
DELETE FROM PEDIDOS WHERE ID = 1

--Ejercicio10. Lee todos los pedidos de la tabla "Pedidos".
SELECT * FROM pedidos

--Ejercicio11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).
CREATE TABLE productos(
	id INT, 
	nombre VARCHAR(250)
)

--Ejercicio12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".
INSERT INTO productos(ID, NOMBRE)
VALUES(1, 'Camisa')

--Ejercicio13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".
UPDATE productos SET nombre = 'Pantalón' where nombre = 'Camisa' 

--Ejercicio14. Elimina el producto con id=1 de la tabla "Productos".
DELETE FROM productos WHERE ID = 1

--Ejercicio15. Lee todos los productos de la tabla "Productos".
SELECT * FROM productos

--Ejercicio16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).
CREATE TABLE DetallesPedido(
	pedido_ID INT, 
	producto_id INT
)

--Ejercicio17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".
INSERT INTO DetallesPedido(PEDIDO_ID, PRODUCTO_ID)
VALUES(1, 1)

--Ejercicio18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".
UPDATE DetallesPedido SET PRODUCTO_ID = 2 WHERE PEDIDO_ID = 1

--Ejercicio19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".
DELETE FROM DetallesPedido WHERE pedido_id=1

--Ejercicio20. Lee todos los detalles de pedido de la tabla "DetallesPedido".
select * from DetallesPedido 

--Ejercicio21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.
SELECT CLIENTES.NOMBRE, PEDIDOS.ID FROM CLIENTES
INNER JOIN PEDIDOS ON CLIENTES.ID = PEDIDOS.CLIENTE_ID

--Ejercicio22. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un left join.
SELECT CLIENTES.NOMBRE, PEDIDOS.ID FROM CLIENTES
LEFT JOIN PEDIDOS ON CLIENTES.ID = PEDIDOS.CLIENTE_ID

--Ejercicio23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.
SELECT PRODUCTOS.NOMBRE, PEDIDOS.ID FROM PRODUCTOS
INNER JOIN PEDIDOS ON PRODUCTOS.ID = PEDIDOS.ID

--Ejercicio24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.
SELECT PRODUCTOS.NOMBRE, PEDIDOS.ID FROM PRODUCTOS
LEFT JOIN PEDIDOS ON PRODUCTOS.ID = PEDIDOS.ID

--Ejercicio25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".
ALTER TABLE clientes
ADD telefono VARCHAR(250)

--Ejercicio26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.
ALTER TABLE clientes ALTER telefono INT

--Ejercicio27. Elimina la columna "telefono" de la tabla "Clientes".
ALTER TABLE clientes DROP COLUMN telefono

--Ejercicio28. Cambia el nombre de la tabla "Clientes" a "Usuarios".
ALTER TABLE CLIENTES RENAME TO USUARIOSS

--Ejercicio29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".
ALTER TABLE USUARIOSS
RENAME NOMBRE TO NOMBRE_COMPLETO

--Ejercicio30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".
ALTER TABLE USUARIOSS
ADD CONSTRAINT id PRIMARY KEY (id)
