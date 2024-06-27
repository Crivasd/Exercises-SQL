--Ejercicio1) Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).
CREATE TABLE CLIENTES(
	ID SERIAL PRIMARY KEY ,
	nombre VARCHAR(255),
	email VARCHAR(255)
)
--Ejercicio 2  Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email="juan@example.com".
INSERT INTO public.clientes(nombre, email)
VALUES('Juan', 'juan@example.com')

--Ejercicio 3  Actualizar el email del cliente con id=1 a "juan@gmail.com".
UPDATE clientes SET email = 'juan@gmail.com' WHERE id = 1

--Ejercicio 4 Eliminar el cliente con id=1 de la tabla "Clientes".
DELETE FROM clientes WHERE ID = 1

--Ejercicio 5 Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero).
CREATE TABLE Pedidos (
ID serial PRIMARY KEY,
cliente_ID INT, 
CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id),
producto VARCHAR(255),
cantidad INT)

--Ejercicio 6 Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.
INSERT INTO Pedidos(producto, cantidad)
VALUES('Camisa', 2)

--Ejercicio 7 Actualizar la cantidad del pedido con id=1 a 3.
UPDATE pedidos SET cantidad = 3 where id = 1

--Ejercicio 8. Eliminar el pedido con id=1 de la tabla "Pedidos".
DELETE from Pedidos WHERE ID = 1

--Ejercicio 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).
CREATE TABLE Productos(
	ID INT PRIMARY KEY,
	nombre VARCHAR(255),
	PRECIO DECIMAL)

--Ejercicio 10. Insertar varios productos en la tabla "Productos" con diferentes valores.
INSERT INTO productos(ID, nombre, precio)
Values(1, 'pantalón', 10),
	   (2, 'camisa',3),
	   (3, 'falda', 4)

--Ejercicio 11. Consultar todos los clientes de la tabla "Clientes".
SELECT * FROM clientes

--Ejercicio 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.
SELECT * FROM pedidos
LEFT JOIN CLIENTES
ON clientes.id = pedidos.cliente_id

--Ejercicio 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.
SELECT NOMBRE FROM PRODUCTOS WHERE PRECIO > 50

--Ejercicio 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.
SELECT PRODUCTO FROM PEDIDOS WHERE CANTIDAD >= 5

--Ejercicio 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".
SELECT NOMBRE FROM CLIENTES WHERE nombre ILIKE 'A%'

--Ejercicio 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.
SELECT nombre, cantidad FROM clientes
LEFT JOIN pedidos
ON clientes.id = pedidos.cliente_id

--Ejercicio 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.
SELECT nombre, cantidad FROM productos
LEFT JOIN pedidos
ON productos.id = pedidos.id

--Ejercicio 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.
alter table pedidos add fecha date

--Ejercicio 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".
ALTER TABLE Pedidos
ADD CONSTRAINT id
FOREIGN KEY (id)
REFERENCES Productos(id)

--Ejercicio 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.