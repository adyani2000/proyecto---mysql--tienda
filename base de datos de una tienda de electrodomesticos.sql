/* Reto 2. Crear mi primera base de datos*/
/* Datos de identificasion*/
/* Nombre completo: Adyani Marquez Valdes*/
/* Matricula: 24008039*/ 
/* Fecha de elaboracion: 15/07/2025*/
/* Nombre del modulo: Taller de bases de datos v1*/
/* Nombre del asesor: Margarita Marquez Tirso*/

-- para crear base de datos--
CREATE DATABASE store;

-- para asegurarnos que estamos usando la base de datos y no nos marque error--
USE store;
 -- para crear tabla--
CREATE TABLE store(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NULL
);
CREATE TABLE product(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
price DOUBLE NOT NULL,
description VARCHAR(50) NULL
-- store_id INT NOT NULL
);

-- para modificar la tabla--
ALTER TABLE product
ADD store_id INT NOT NULL,
ADD remove_property INT NOT NULL;
ALTER TABLE product 
DROP COLUMN remove_property;

 -- para verificar que columnas se agregaron o eliminaron--  
DESCRIBE product;

-- para relacionar la tabla--
 ALTER TABLE product
 ADD CONSTRAINT fk_store_product
 FOREIGN KEY (store_id) REFERENCES store(id);
 
 CREATE TABLE customer(
 id INT NOT NULL PRIMARY KEY,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(50) NOT NULL,
 password VARCHAR(50) NOT NULL,
 address VARCHAR(50) NULL,
 phone VARCHAR(10) NULL
 );
  
  CREATE TABLE payment_method(
  id INT NOT NULL PRIMARY KEY,
  type_payment VARCHAR(50) NOT NULL
  -- customer_id INT NOT NULL
  );
  
  ALTER TABLE payment_method
  ADD COLUMN customer_id INT NOT NULL;
  
  ALTER TABLE payment_method
  ADD CONSTRAINT fk_customer_payment_method
  FOREIGN KEY (customer_id) REFERENCES customer(id);
  
 -- para verificar que columnas se agregaron o eliminaron--  
 DESCRIBE payment_method;
 
-- para asegurarnos que estamos usando la base de datos y no nos maque error--
USE store;

CREATE TABLE purchase_order(
id INT NOT NULL PRIMARY KEY
-- payment_method_id INT NOT NULL,
-- customer_id INT NOT NULL
);

 ALTER TABLE purchase_order
 ADD COLUMN payment_method_id INT NOT NULL,
 ADD COLUMN customer_id INT NOT NULL;
 
 -- para verificar que columnas se agregaron o eliminaron-- 
  DESCRIBE purchase_order;

  
  CREATE TABLE purchase_order_detail(
  id INT NOT NULL PRIMARY KEY,
  amount INT NOT NULL,
  price_per_unit DOUBLE NOT NULL,
  product_description VARCHAR(150) NULL
  -- product_id INT NOT NULL
  -- Purchase_order_id INT NOT NULL
  );
  
-- para verificar que columnas se agregaron o eliminaron-- 
DESCRIBE purchase_order_detail;

 -- Se hacen las relaciones de las tablas que falten--
 
ALTER TABLE purchase_order_detail
ADD COLUMN product_id INT NOT NULL,
ADD COLUMN purchase_order_id INT NOT NULL;  
  
ALTER TABLE purchase_order_detail
ADD CONSTRAINT fk_product
FOREIGN KEY(product_id) REFERENCES product(id);

ALTER TABLE purchase_order_detail
ADD CONSTRAINT fk_purchase_order
FOREIGN KEY (purchase_order_id ) REFERENCES purchase_order(id);

ALTER TABLE purchase_order
ADD CONSTRAINT fk_payment_method
FOREIGN KEY (payment_method_id) REFERENCES payment_method(id);

ALTER TABLE purchase_order
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)REFERENCES customer(id);
 
 -- terminamos de crear la base de datos con las tablaas y relaciones--

-- reto 3 agregar registros--

-- sucursales registradas--



INSERT INTO store (id, name, address) 
VALUES (459, "Electronic Technologies North", "Blvd Lopez Mateos # 459");

INSERT INTO store (id, name, address) 
VALUES (346, "Electronic Technologies Central", "Av Insurgentes # 346");

INSERT INTO store (id, name, address) 
VALUES (549, "Electronic Technologies East", "Blvd Madero  # 549");

SELECT * FROM store;

-- Productos registrados--
INSERT INTO product( id,name,price,description,store_id) VALUES ( 301,"Computadora de Escritorio-Todo en uno",15499.00,"Todo lo que necesitas para este regreso a clases.", 549);
INSERT INTO product( id,name,price,description,store_id) VALUES ( 305,"Celular ET-15a",3590.00,"Ideal para el trabajo.", 549);
INSERT INTO product( id,name,price,description,store_id) VALUES ( 310,"Laptop-Quinta generacion",9999.00,"Economica pero duradera, simplemente lo mejor del año.", 549);
ALTER TABLE product 
-- Aumenta el tamaño de la columna description
MODIFY COLUMN description VARCHAR(150);

SELECT * FROM product;

-- modificacion columnas --
UPDATE product
SET name= "Celular ET2019-19xs",description = "Ideal para trabajo y escuela"
WHERE id = 305;

UPDATE product
SET price = 9999.00
WHERE id = 310;
-- eliminar registros--
DELETE FROM product 
WHERE id= 305;

DELETE FROM product 
WHERE id= 310;

SELECT * FROM store;

-- registrar productos--

INSERT INTO product(id,name,price,description,store_id) VALUES ( 611,"Horno tostador",1499.00,"Horno tostador de 4 rebanadas,acero inoxidable.", 346);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 512,"Freidora con temporizador",1590.00,"Puede cocinar cualquier alimento, desde papas fritas hasta verduras y mucho mas.", 346);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 815,"Batidora",999.00,"5 velocidades, color rojo.", 346);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 531,"Fuente de chocolate",789.00,"Mejora la limpieza gracias a sus piezas desmontables.", 346);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 912,"Maquina de palomitas",830.00,"La maquina ocupa aceite caliente para la elaboracion de las palomitas.", 346);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 412,"Sandwichera",459.00,"Sandwichera para desayuno,color gris.", 346);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 317,"Pantalla smart TV 50",8890.00,"Tamaño de pantalla real 57.5x33.3.", 459);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 679,"Camara de seguridad",1497.00,"Incluye soporte tecnico 24/7.", 459);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 923,"Soporte para TV",279.00,"Adaptable a pantalla de 26-65, hasta 50kg de carga.", 459);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 873,"Laptop 1945",15499.00,"Unidad de estado solido de 256 GB y memoria RAM de 8 GB.", 459);
INSERT INTO product(id,name,price,description,store_id) VALUES ( 682,"Coche estereo GPS-Navegacion",1299.00,"Pantalla tactil, conexion bluetooth,no incluye DVD.", 459);

-- orden de precios ascendente--
SELECT * FROM product
ORDER BY price ASC;

-- orden de precios descendente--
SELECT * FROM product
ORDER BY price DESC;

-- RESTRINGIR DATOS --
SELECT * FROM product
LIMIT 5;

SELECT * FROM product
LIMIT 3,5;

-- AGRUPAR DATOS--

SELECT store_id, COUNT(*) FROM product
GROUP BY store_id;

-- uniones--

INSERT INTO store(id,name,address) VALUES (111,"Sucursal","Blvd Obregon #423");
SELECT* FROM store;

SELECT * FROM store
INNER JOIN product on store.id = product.store_id;

SELECT * FROM store
LEFT JOIN product on store_id = product.store_id;

SELECT * FROM store
RIGHT JOIN product on store_id = product.store_id;

-- consultas anidadas--
SELECT *FROM store
WHERE id= (
SELECT store_id FROM product WHERE id = 310
);

SELECT * FROM product;

-- vistas --
CREATE VIEW product_description AS
SELECT name,description,price FROM product;

SELECT *FROM product_description;

-- seguridad en la base de datos--
-- creacion de roles usuarios y contraseñas--

SELECT * FROM mysql.user;

 -- 1. Crear roles 
 
CREATE ROLE IF NOT EXISTS "admin_store_role";
CREATE ROLE IF NOT EXISTS "read_store_role";
CREATE ROLE IF NOT EXISTS "write_store_role";
-- 2. Asignar privilegios
GRANT ALL PRIVILEGES ON store.* TO "admin_store_role";
GRANT SELECT ON store.* TO "read_store_role";
GRANT INSERT ON store.* TO "write_store_role";
-- 3. Crear usuarios
CREATE USER IF NOT EXISTS "admin"@"localhost" IDENTIFIED BY "adm2020";
CREATE USER IF NOT EXISTS "arturo_torres"@"localhost" IDENTIFIED BY "arturoZXC123";
CREATE USER IF NOT EXISTS "jose_ibarra"@"localhost" IDENTIFIED BY "josestoredb";
CREATE USER IF NOT EXISTS "andrea_rodriguez"@"localhost" IDENTIFIED BY "adi1989";
-- 4. Asignar roles
GRANT "admin_store_role" TO "admin"@"localhost";
GRANT "read_store_role" TO "arturo_torres"@"localhost";
GRANT "write_store_role" TO "jose_ibarra"@"localhost";
GRANT "write_store_role" TO "andrea_rodriguez"@"localhost";
-- 5. Activación crítica
SET DEFAULT ROLE ALL TO "admin"@"localhost";
SET DEFAULT ROLE ALL TO "arturo_torres"@"localhost";
SET DEFAULT ROLE ALL TO "jose_ibarra"@"localhost";
SET DEFAULT ROLE ALL TO "andrea_rodriguez"@"localhost";
-- 6. Eliminar permiso SELECT
REVOKE SELECT ON store.* FROM "write_store_role";
 -- 7. Forzar actualización
FLUSH PRIVILEGES; 
-- para comprobar los permisos--
SELECT Host,User,Select_priv,Insert_priv,Update_priv,delete_priv,Create_priv,Drop_priv FROM mysql.user;
 
 /* Reto 5. Transacciones e integridad de datos*/
/* Datos de identificacion*/
/* Nombre completo: Adyani Marquez Valdes*/
/* Matricula: 24008039*/ 
/* Fecha de elaboracion: 24/07/2025*/
/* Nombre del modulo: Taller de bases de datos v1*/
/* Nombre del asesor: Margarita Marquez Tirso*/

-- Agregar cliente con id 548--
INSERT INTO customer (id, first_name, last_name, email, password, address, phone) 
VALUES (548, 'Laura', 'Fernández', 'laura.fernandez@email.com', 'laura548', 'Av. Central 548', '5555485485');
-- Agregar método de pago con id 185 asociado al cliente 548--
INSERT INTO payment_method (id, type_payment, customer_id)
VALUES (185, 'Tarjeta de débito', 548);
-- Verificar que el producto 317 existe (según tu script ya existe)--
SELECT * FROM product WHERE id = 317;

-- Iniciar transacción--
START TRANSACTION;
-- Obtención de datos en la tabla customer--
SELECT * FROM customer WHERE id = 548;
-- Obtención de datos en la tabla payment_method--
SELECT * FROM payment_method WHERE customer_id = 548;
-- Realización de un registro en la tabla purchase_order--
INSERT INTO purchase_order (id, payment_method_id, customer_id)
VALUES (266, 185, 548);
-- Obtención de registro--
SELECT * FROM purchase_order WHERE id = 266;
 -- Obtención de producto en la tabla product--
SELECT * FROM product WHERE id = 317;
-- Creación de registro en la tabla purchase_order_detail (con error intencional)
-- Nota: El purchase_order_id 266666 no existe y product_id 555 tampoco
INSERT INTO purchase_order_detail (id, amount, price_per_unit, product_description, product_id, purchase_order_id)
VALUES (267, 5, 8890.00, 'Tamaño de pantalla real 57.5” x 33.3”', 555, 266666);
-- Sentencia rollback--
ROLLBACK;
-- Verificamos que la orden 266 ya no existe debido al ROLLBACK--
SELECT * FROM purchase_order WHERE id = 266;
-- Ahora repetimos la transacción pero corrigiendo los errores--
-- Iniciar transacción (nuevamente)
START TRANSACTION;
-- Realización de un registro en la tabla purchase_order
INSERT INTO purchase_order (id, payment_method_id, customer_id)
VALUES (266, 185, 548);
-- Corrección de dato
-- Ahora usamos el product_id correcto (317) y purchase_order_id correcto (266)
INSERT INTO purchase_order_detail (id, amount, price_per_unit, product_description, product_id, purchase_order_id)
VALUES (267, 5, 8890.00, 'Tamaño de pantalla real 57.5” x 33.3”', 317, 266);
-- Comprobación del registro con id 267 en purchase_order_detail
SELECT * FROM purchase_order_detail WHERE id = 267;
-- Sentencia COMMIT--
COMMIT;







