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