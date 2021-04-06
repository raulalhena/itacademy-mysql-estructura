/*

    EJERCICIO 2: PIZZERIA
    SCRIPT CREACION BBDD PIZZERIA, TABLAS E INTRODUCCION DE DATOS PARA REALIZAR LAS CONSULTAS
    AL FINAL SE ENCUENTRAN LAS SENTENCIAS DE SELECCION DEL EJERCICIO

*/

DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE IF NOT EXISTS pizzeria;
USE pizzeria;


/***********************\
/*  CREACION DE TABLAS *\
/***********************\

/*
* TABLA PROVINCIAS
*/

CREATE TABLE provincias(
    provincia_id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(provincia_id)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

/*
* TABLA LOCALIDADES
*/

CREATE TABLE localidades(
    localidad_id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL UNIQUE,
    provincia_id INT(11) NOT NULL,
    PRIMARY KEY(localidad_id)
)ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE localidades ADD FOREIGN KEY(provincia_id) REFERENCES provincias(provincia_id);

/*
* TABLA CLIENTES
*/

CREATE TABLE clientes(
    cliente_id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    localidad_id INT(11) NOT NULL,
    provincia_id INT(11) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY(cliente_id)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE clientes ADD FOREIGN KEY(provincia_id) REFERENCES provincias(provincia_id);
ALTER TABLE clientes ADD FOREIGN KEY(localidad_id) REFERENCES localidades(localidad_id);

/*
* TABLA TIENDAS
*/

CREATE TABLE tiendas(
    tienda_id INT(11) NOT NULL AUTO_INCREMENT,
    direccion VARCHAR(50) NOT NULL,
    codigo_postal VARCHAR(10),
    localidad_id INT(11) NOT NULL,
    provincia_id INT(11) NOT NULL,
    PRIMARY KEY(tienda_id)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE tiendas ADD FOREIGN KEY(provincia_id) REFERENCES provincias(provincia_id);
ALTER TABLE tiendas ADD FOREIGN KEY(localidad_id) REFERENCES localidades(localidad_id);

/*
* TABLA EMPLEADOS
*/

CREATE TABLE empleados(
    empleado_id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    nif VARCHAR(15) NOT NULL UNIQUE,
    puesto CHAR(1) NOT NULL,
    tienda_id INT(11) NOT NULL,
    PRIMARY KEY(empleado_id)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE empleados ADD FOREIGN KEY(tienda_id) REFERENCES tiendas(tienda_id);

/*
* TABLA CATEGORIAS_PIZZAS
*/

CREATE TABLE categorias_pizzas(
    categoria_id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(categoria_id)
)ENGINE=InnoDB AUTO_INCREMENT = 1;

/*
* TABLA PRODUCTOS
*/

CREATE TABLE productos(
    producto_id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    tipo CHAR(1) NOT NULL,
    precio DECIMAL(5,2) NOT NULL,
    imagen VARCHAR(25),
    descripcion TEXT,
    categoria_pizza_id INT(11) DEFAULT NULL,
    PRIMARY KEY(producto_id)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE productos ADD FOREIGN KEY(categoria_pizza_id) REFERENCES categorias_pizzas(categoria_id);

/*
* TABLA PEDIDOS
*/

CREATE TABLE pedidos(
    pedido_id INT(11) NOT NULL AUTO_INCREMENT,
    tipo CHAR(1) NOT NULL,
    fecha DATETIME NOT NULL,
    tienda_id INT(11) NOT NULL,
    cliente_id INT(11) NOT NULL,
    empleado_id INT(11) NOT NULL,
    PRIMARY KEY(pedido_id)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE pedidos ADD FOREIGN KEY(tienda_id) REFERENCES tiendas(tienda_id);
ALTER TABLE pedidos ADD FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id);
ALTER TABLE pedidos ADD FOREIGN KEY(empleado_id) REFERENCES empleados(empleado_id);


/*
* TABLA REPARTOS
*/

CREATE TABLE repartos(
    reparto_id INT(11) NOT NULL AUTO_INCREMENT,
    empleado_id INT(11) NOT NULL,
    fecha_entrega DATETIME NOT NULL,
    pedido_id INT(11) NOT NULL,
    PRIMARY KEY(reparto_id)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE repartos ADD FOREIGN KEY(empleado_id) REFERENCES empleados(empleado_id);
ALTER TABLE repartos ADD FOREIGN KEY(pedido_id) REFERENCES pedidos(pedido_id);

/*
* TABLA DETALLE_PEDIDO
*/

CREATE TABLE detalle_pedido(
    detalle_pedido_id INT(11) NOT NULL AUTO_INCREMENT,
    producto_id INT(11) NOT NULL,
    pedido_id INT(11) NOT NULL,
    PRIMARY KEY(detalle_pedido_id)
)ENGINE=InnoDB AUTO_INCREMENT = 1;

ALTER TABLE detalle_pedido ADD FOREIGN KEY(producto_id) REFERENCES productos(producto_id);
ALTER TABLE detalle_pedido ADD FOREIGN KEY(pedido_id) REFERENCES pedidos(pedido_id);


/************************************\
/* INSERCION DE DATOS EN LAS TABLAS *\
/************************************\

/*
* DATOS TABLA PROVINCIAS
*/

INSERT INTO provincias(nombre) VALUES('Barcelona');
INSERT INTO provincias(nombre) VALUES('Girona');
INSERT INTO provincias(nombre) VALUES('Tarragona');
INSERT INTO provincias(nombre) VALUES('Lleida');

/*
* DATOS TABLA LOCALIDADES
*/

INSERT INTO localidades(nombre, provincia_id) VALUES('Barcelona', 1);
INSERT INTO localidades(nombre, provincia_id) VALUES('Altafulla', 3);
INSERT INTO localidades(nombre, provincia_id) VALUES('Alp', 2);
INSERT INTO localidades(nombre, provincia_id) VALUES('Bell Lloch', 4);

/*
* DATOS TABLA CATEGORIAS_PIZZAS
*/

INSERT INTO categorias_pizzas(nombre) VALUES('c1');
INSERT INTO categorias_pizzas(nombre) VALUES('c2');
INSERT INTO categorias_pizzas(nombre) VALUES('c3');

/*
* DATOS TABLA CLIENTES
*/

INSERT INTO clientes(nombre, apellido, direccion, codigo_postal, localidad_id, provincia_id, telefono) VALUES('cl1', 'cl1a', 'd1', '08284', '1','1','683492304');
INSERT INTO clientes(nombre, apellido, direccion, codigo_postal, localidad_id, provincia_id, telefono) VALUES('cl2', 'cl2a', 'd2', '08284', '2','3','683492305');
INSERT INTO clientes(nombre, apellido, direccion, codigo_postal, localidad_id, provincia_id, telefono) VALUES('cl3', 'cl3a', 'd3', '08284', '4','3','683492306');

/*
* DATOS TABLA TIENDAS
*/

INSERT INTO tiendas(direccion, codigo_postal, localidad_id, provincia_id) VALUES('d1', '08028', 1, 1);
INSERT INTO tiendas(direccion, codigo_postal, localidad_id, provincia_id) VALUES('d2', '79898', 2, 3);
INSERT INTO tiendas(direccion, codigo_postal, localidad_id, provincia_id) VALUES('d3', '23128', 3, 2);


/*
* DATOS TABLA EMPLEADOS
*/

INSERT INTO empleados(nombre, apellidos, nif, puesto, tienda_id) VALUES('e1', 'e1a', '374838499Y', 'R', 1);
INSERT INTO empleados(nombre, apellidos, nif, puesto, tienda_id) VALUES('e2', 'e2a', '374838499X', 'C', 2);
INSERT INTO empleados(nombre, apellidos, nif, puesto, tienda_id) VALUES('e3', 'e3a', '374838499N', 'R', 3);

/*
* DATOS TABLA PEDIDOS
*/

INSERT INTO pedidos(tipo, fecha, tienda_id, cliente_id, empleado_id) VALUES('R', '2020-12-01', 1, 2, 1);
INSERT INTO pedidos(tipo, fecha, tienda_id, cliente_id, empleado_id) VALUES('R', '2020-02-15', 3, 1, 3);
INSERT INTO pedidos(tipo, fecha, tienda_id, cliente_id, empleado_id) VALUES('T', '2021-02-14', 1, 2, 1);
INSERT INTO pedidos(tipo, fecha, tienda_id, cliente_id, empleado_id) VALUES('R', '2019-07-28', 2, 3, 2);
INSERT INTO pedidos(tipo, fecha, tienda_id, cliente_id, empleado_id) VALUES('T', '2021-01-12', 1, 2, 1);
INSERT INTO pedidos(tipo, fecha, tienda_id, cliente_id, empleado_id) VALUES('T', '2021-01-12', 3, 3, 3);


/*
* DATOS TABLA PRODUCTOS
*/

INSERT INTO productos(nombre, tipo, precio, imagen, descripcion, categoria_pizza_id) VALUES('Margarita', 'P', 9.95, 'margarita1.webp', 'Pizza con base fina. Ingredientes: Tomate, Mozzaeralla, Oregano.', 1);
INSERT INTO productos(nombre, tipo, precio, imagen, descripcion, categoria_pizza_id) VALUES('Cuatro Estaciones', 'P', 10.95, 'cuatro_estaciones.webp', 'Pizza con base fina. Ingredientes: Tomate, Mozzaeralla, Oregano, Alcachofas, Champiñones, Jamón Dulce', 1);
INSERT INTO productos(nombre, tipo, precio, imagen, descripcion, categoria_pizza_id) VALUES('Veggie Burger', 'H', 7.65, 'veggie_burger1.webp', 'Hamburguesa Vegetariana. Ingredientes: Hamburguesa de quinoa, Tomate, Lechuga, Cebolla, Aguacate.', NULL);
INSERT INTO productos(nombre, tipo, precio, imagen, descripcion, categoria_pizza_id) VALUES('Refresco Cola', 'B', 1.70, 'refresco_cola1.webp', 'Refresco de cola con gas', NULL);
INSERT INTO productos(nombre, tipo, precio, imagen, descripcion, categoria_pizza_id) VALUES ('Refresco Limon', 'B', 1.50, 'refresco_limon.webp', 'Refresco Limon sin gas.', NULL);

/*
* DATOS TABLA REPARTOS
*/

INSERT INTO repartos(empleado_id, fecha_entrega, pedido_id) VALUES(1, '2020-02-15', 1);
INSERT INTO repartos(empleado_id, fecha_entrega, pedido_id) VALUES(3, '2019-07-28', 4);
INSERT INTO repartos(empleado_id, fecha_entrega, pedido_id) VALUES(2, '2020-12-01', 1);

/*
* DATOS TABLA DETALLE_PEDIDO
*/

INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(1, 1);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(3, 1);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(4, 1);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(2, 5);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(4, 5);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(3, 2);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(3, 2);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(3, 2);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(3, 2);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(2, 3);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(4, 3);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(1, 4);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(4, 4);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(4, 4);
INSERT INTO detalle_pedido(producto_id, pedido_id) VALUES(5, 6);


/***************************\
/* SENTENCIAS DE SELECCION *\
/***************************\

/* SELECCION DE NUMERO DE BEBIDAS SEGUN LOCALIDAD ESCOGIDA *\

/*

SELECT COUNT(p.nombre) AS cantidad, p.nombre AS bebida, t.localidad_id, l.nombre AS localidad 
FROM productos p, detalle_pedido dp, pedidos pe, tiendas t, localidades l 
WHERE p.tipo = 'B' 
AND p.producto_id = dp.producto_id 
AND dp.pedido_id = pe.pedido_id 
AND pe.tienda_id = t.tienda_id 
AND t.localidad_id = l.localidad_id 
AND l.nombre = 'Barcelona';

*/

/* SELECCION DE NUMERO DE PEDIDOS REALIZADOS POR UN EMPLEADO *\

/*

SELECT COUNT(p.pedido_id) AS pedidos, e.empleado_id, e.nombre AS empleado 
FROM pedidos p, tiendas t, empleados e 
WHERE p.tienda_id = t.tienda_id 
AND t.tienda_id = e.tienda_id 
AND e.nombre = 'e2';

*/
