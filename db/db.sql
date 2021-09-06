DROP DATABASE IF EXISTS tienda_test;
CREATE DATABASE tienda_test CHARACTER SET utf8 COLLATE utf8_general_ci;
USE tienda_test;

CREATE TABLE cliente(
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  nick VARCHAR(20) NOT NULL,
  password CHAR(120) NOT NULL,
  correo VARCHAR(60) NOT NULL,
  rfc VARCHAR(10) NOT NULL,
  direccion VARCHAR(250) NOT NULL,
  PRIMARY KEY(id_cliente)
);

CREATE TABLE proveedor(
  id_proveedor INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50),
  PRIMARY KEY(id_proveedor)
);

CREATE TABLE categoria(
  id_categoria INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50),
  PRIMARY KEY(id_categoria)
);

CREATE TABLE producto(
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL, 
  marca VARCHAR(30) NOT NULL,
  precio DECIMAL(5,2) NOT NULL,
  id_proveedor INT NOT NULL,
  id_categoria INT NOT NULL,
  FOREIGN KEY(id_proveedor) REFERENCES proveedor(id_proveedor),
  FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria),
  PRIMARY KEY(id_producto)
);

CREATE TABLE venta(
  id_venta INT NOT NULL AUTO_INCREMENT,
  fecha SMALLDATETIME NOT NULL,
  factura BOOLEAN NOT NULL
  total DECIMA(5,2),
  PRIMARY KEY(id_venta)
);

CREATE TABLE detalle_venta(
  id_detalle_venta INT NOT NULL AUTO_INCREMENT,
  id_venta INT NOT NULL,
  id_cliente INT NOT NULL,
  id_producto INT NOT NULL
);

INSERT INTO proveedor(nombre) VALUES
('Bimbo SA de CV'), 
('CocaCola Company'), 
('Sabritas SA de CV'), 
('Frutas y verduras el wero'),
('Grupo Modelo SA de CV'),
('Pedigree SA de CV'), 
('Holanda SA de CV'),
('Abarrotes el Zorro'), 
('Herdez SA de CV');

INSERT INTO categoria(nombre) VALUES
('Belleza e Higiene'),
('Cervezas y Snacks'),
('Helados'),
('Abarrotes'),
('Verduras/Frutas procesadas'),
('Mascotas'),
('Refrescos y Bebidas energeticas');