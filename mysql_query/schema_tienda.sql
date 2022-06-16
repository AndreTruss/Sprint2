

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



SELECT nombre FROM producto;


SELECT nombre, precio FROM producto;


SELECT * FROM producto;


SELECT nombre, precio, TRUNCATE((precio * 1.07), 2) AS 'precio USD dolars' FROM producto;


SELECT nombre AS 'nom del producto', precio AS 'euros', TRUNCATE((precio * 1.07), 2) AS 'dolars' FROM producto;


SELECT UPPER(nombre) AS 'NOM DEL PRODUCTO', UPPER(precio) AS 'EUROS' FROM producto;


SELECT LOWER(nombre) AS 'NOM DEL PRODUCTO', LOWER(precio) AS 'EUROS' FROM producto;


SELECT nombre, LEFT(UPPER(nombre), 2) FROM FABRICANTE;


SELECT nombre AS 'NOM DEL PRODUCTO', ROUND(precio) AS 'EUROS' FROM producto;


SELECT nombre AS 'NOM DEL PRODUCTO', TRUNCATE(precio, 0) AS 'EUROS' FROM producto;


SELECT FABRICANTE.CODIGO FROM FABRICANTE INNER JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


SELECT DISTINCT FABRICANTE.CODIGO FROM FABRICANTE INNER JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE ASC;


SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;


SELECT NOMBRE FROM PRODUCTO ORDER BY NOMBRE ASC, PRECIO DESC;


SELECT * FROM FABRICANTE LIMIT 5;


SELECT * FROM FABRICANTE WHERE CODIGO BETWEEN 4 AND 5;


SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO ASC LIMIT 1;


SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO DESC LIMIT 1;


SELECT PRODUCTO.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.CODIGO = 2;


SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE ORDER BY FABRICANTE.NOMBRE ASC;


SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, FABRICANTE.CODIGO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE ORDER BY PRODUCTO.precio ASC LIMIT 1;


SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE ORDER BY PRODUCTO.precio DESC LIMIT 1;


SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE "Lenovo";


SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE "Crucial" AND PRODUCTO.PRECIO > 200;


SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE "Asus" OR FABRICANTE.NOMBRE LIKE "Hewlett-Packard" OR FABRICANTE.NOMBRE LIKE "Seagate";


SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE IN( "Asus", "Hewlett-Packard", "Seagate");


SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE '%e';


SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE '%w%';


SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE PRODUCTO.PRECIO >= 180 ORDER BY PRODUCTO.PRECIO DESC, PRODUCTO.NOMBRE ASC;


SELECT DISTINCT FABRICANTE.CODIGO, FABRICANTE.NOMBRE FROM FABRICANTE INNER JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


SELECT FABRICANTE.NOMBRE, PRODUCTO.NOMBRE FROM FABRICANTE LEFT JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


SELECT FABRICANTE.NOMBRE, PRODUCTO.NOMBRE FROM FABRICANTE LEFT JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE PRODUCTO.NOMBRE IS NULL;


SELECT PRODUCTO.NOMBRE FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = (SELECT FABRICANTE.CODIGO FROM FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo');


SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO WHERE PRODUCTO.PRECIO = (SELECT MAX(PRODUCTO.PRECIO) FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = (SELECT FABRICANTE.CODIGO FROM FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo'));


SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo' ORDER BY PRODUCTO.PRECIO DESC LIMIT 1;


SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Hewlett-Packard' ORDER BY PRODUCTO.PRECIO ASC LIMIT 1;


SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO WHERE PRODUCTO.PRECIO >= (SELECT PRODUCTO.PRECIO FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo' ORDER BY PRODUCTO.PRECIO DESC LIMIT 1);


SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE  FABRICANTE.NOMBRE LIKE 'Asus' AND PRODUCTO.PRECIO > (SELECT AVG(PRODUCTO.PRECIO) FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Asus');

