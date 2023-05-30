##### CREACION Y USO DE LA BASE DE DATOS ####
DROP DATABASE IF EXISTS Tienda;
CREATE DATABASE Tienda;
USE Tienda;
#### CREACION DE LAS TABLAS ###
DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario(
idUsuario			INT				PRIMARY KEY AUTO_INCREMENT,
nombre				VARCHAR(50),
apellido1			VARCHAR(50),
apellido2			VARCHAR(50),
correo				VARCHAR(50) 	UNIQUE,
tfno				VARCHAR(9) 		UNIQUE
);

## RESTRICCIONES ## 
ALTER TABLE Usuario 
ADD CONSTRAINT ComprobarNombreNoNulo
CHECK (nombre IS NOT NULL AND nombre <> ''),
ADD CONSTRAINT ComprobarApellido1NoNulo
CHECK (apellido1 IS NOT NULL && apellido1 <> ''),
ADD CONSTRAINT ComprobarApellido2NoNulo
CHECK (apellido2 IS NOT NULL && apellido2 <> ''),
ADD CONSTRAINT ComprobarCorreoNoNulo
CHECK (correo IS NOT NULL && correo <> ''),
ADD CONSTRAINT ComprobarTfnoNoNulo
CHECK (tfno IS NOT NULL && tfno <> '');

DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor(
cif					INT 			PRIMARY KEY AUTO_INCREMENT,
nombre				VARCHAR(100),
tfno				VARCHAR(9) 		UNIQUE,
direccion			VARCHAR(50) 	UNIQUE
)AUTO_INCREMENT = 501;

DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto(
idProducto			INT 			PRIMARY KEY AUTO_INCREMENT,
cif					INT,
nombre				VARCHAR(50),
descripcion			TEXT,
valor				FLOAT
);

DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido(
idPedido			INT				PRIMARY KEY AUTO_INCREMENT,
idUsuario			INT,
fecha				DATETIME
);

DROP TABLE IF EXISTS Pedido_Usuario;
CREATE TABLE Pedido_Producto(
idPedido_Producto	INT				PRIMARY KEY AUTO_INCREMENT,
idPedido			INT,
idProducto			INT
);

## CLAVES FORANEAS DE LA TABLA PRODUCTO ##
ALTER TABLE Producto 
ADD CONSTRAINT fk_Producto_Proveedor 
FOREIGN KEY (cif) 
REFERENCES Proveedor(cif);

## CLAVES FORANEAS DE LA TABLA PEDIDO ##
ALTER TABLE Pedido
ADD CONSTRAINT fk_Pedido_Usuario
FOREIGN KEY (idUsuario)
REFERENCES Usuario (idUsuario);

## CLAVES FORANEAS DE LA TABLA INTERMEDIA PEDIDO-PRODUCTOS ##
ALTER TABLE Pedido_Producto
ADD CONSTRAINT fk_TablaIntermedia_Pedido
FOREIGN KEY (idPedido)
REFERENCES Pedido (idPedido),
ADD CONSTRAINT fk_TablaIntermedia_Producto
FOREIGN KEY (idPedido)
REFERENCES Producto (idProducto);

## INSERCION DE DATOS INVENTADOS PARA PROBAR LA BASE DE DATOS ## 

INSERT INTO Usuario ( nombre, apellido1, apellido2, correo, tfno)
VALUES
  ( 'Juan', 'González', 'López', 'juan@example.com', '123456789'),
  ( 'María', 'Rodríguez', 'Sánchez', 'maria@example.com', '987654321'),
  ( 'Carlos', 'Fernández', 'Gómez', 'carlos@example.com', '555555555'),
  ( 'Laura', 'López', 'Martínez', 'laura@example.com', '111111111'),
  ( 'Pedro', 'Hernández', 'Ramírez', 'pedro@example.com', '999999999'),
  ( 'Ana', 'Pérez', 'García', 'ana@example.com', '777777777'),
  ( 'José', 'Díaz', 'Torres', 'jose@example.com', '888888888'),
  ( 'Sara', 'Navarro', 'Vargas', 'sara@example.com', '222222222'),
  ( 'Luis', 'Romero', 'Ortega', 'luis@example.com', '444444444'),
  ( 'Elena', 'Soto', 'Guerrero', 'elena@example.com', '666666666');

INSERT INTO Proveedor (nombre, tfno, direccion)
VALUES
  ('Proveedor 1', '111111111', 'Calle Proveedor 1'),
  ('Proveedor 2', '222222222', 'Calle Proveedor 2'),
  ('Proveedor 3', '333333333', 'Calle Proveedor 3'),
  ('Proveedor 4', '444444444', 'Calle Proveedor 4'),
  ('Proveedor 5', '555555555', 'Calle Proveedor 5');

INSERT INTO Producto (cif, nombre, descripcion, valor)
VALUES
  ( 505, 'Producto 1', 'Descripción del producto 1', 10.50),
  ( 501, 'Producto 2', 'Descripción del producto 2', 15.75),
  ( 502, 'Producto 3', 'Descripción del producto 3', 20.99),
  ( 503, 'Producto 4', 'Descripción del producto 4', 8.25),
  ( 504, 'Producto 5', 'Descripción del producto 5', 12.60),
  ( 501, 'Producto 6', 'Descripción del producto 6', 18.50),
  ( 502, 'Producto 7', 'Descripción del producto 7', 9.99),
  ( 501, 'Producto 8', 'Descripción del producto 8', 14.75),
  ( 505, 'Producto 9', 'Descripción del producto 9', 21.25),
  ( 501, 'Producto 10', 'Descripción del producto 10', 11.50);

INSERT INTO Pedido (idUsuario, fecha)
VALUES
  (3, NOW()),
  (5, NOW()),
  (2, NOW()),
  (1, NOW()),
  (4, NOW()),
  (7, NOW()),
  (9, NOW()),
  (8, NOW()),
  (6, NOW()),
  (10, NOW());

INSERT INTO Pedido_Producto (idPedido, idProducto)
VALUES
  (1, 3),
  (1, 7),
  (2, 2),
  (3, 5),
  (4, 10),
  (4, 1),
  (4, 3),
  (4, 5),
  (5, 6),
  (6, 9),
  (7, 8),
  ( 8, 4);

SELECT * FROM Usuario;
SELECT * FROM Proveedor;
SELECT * FROM Producto;
SELECT * FROM Pedido;
SELECT * FROM Pedido_Producto;
