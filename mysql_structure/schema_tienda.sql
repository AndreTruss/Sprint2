

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


-- 1. Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM producto;

-- 2. Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;

-- 3. Llista totes les columnes de la taula producto.
SELECT * FROM producto;

-- 4. Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, TRUNCATE((precio * 1.07), 2) AS 'precio USD dolars' FROM producto;

-- 5. Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
SELECT nombre AS 'nom del producto', precio AS 'euros', TRUNCATE((precio * 1.07), 2) AS 'dolars' FROM producto;

-- 6. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre) AS 'NOM DEL PRODUCTO', UPPER(precio) AS 'EUROS' FROM producto;

-- 7. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre) AS 'NOM DEL PRODUCTO', LOWER(precio) AS 'EUROS' FROM producto;

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, LEFT(UPPER(nombre), 2) FROM FABRICANTE;

-- 9. Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre AS 'NOM DEL PRODUCTO', ROUND(precio) AS 'EUROS' FROM producto;

-- 10. Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre AS 'NOM DEL PRODUCTO', TRUNCATE(precio, 0) AS 'EUROS' FROM producto;

-- 11. Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT FABRICANTE.CODIGO FROM FABRICANTE INNER JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;

-- 12. Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT FABRICANTE.CODIGO FROM FABRICANTE INNER JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;

-- 13. Llista els noms dels fabricants ordenats de manera ascendent.
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE ASC;

-- 14. Llista els noms dels fabricants ordenats de manera descendent.
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;

-- 15. Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT NOMBRE FROM PRODUCTO ORDER BY NOMBRE ASC;
SELECT NOMBRE FROM PRODUCTO ORDER BY PRECIO DESC;

-- 16. Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT * FROM FABRICANTE LIMIT 5;

-- 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM FABRICANTE WHERE CODIGO BETWEEN 4 AND 5;

-- 18. Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO ASC LIMIT 1;

-- 19. Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO DESC LIMIT 1;

-- 20. Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT PRODUCTO.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.CODIGO = 2;

-- 21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;

-- 22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE ORDER BY FABRICANTE.NOMBRE ASC;

-- 23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, FABRICANTE.CODIGO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;

-- 24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE ORDER BY PRODUCTO.precio ASC LIMIT 1;

-- 25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE ORDER BY PRODUCTO.precio DESC LIMIT 1;

-- 26. Retorna una llista de tots els productes del fabricador Lenovo.
SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE "Lenovo";

-- 27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE "Crucial" AND PRODUCTO.PRECIO > 200;

-- 28. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE "Asus" OR FABRICANTE.NOMBRE LIKE "Hewlett-Packard" OR FABRICANTE.NOMBRE LIKE "Seagate";

-- 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l'operador IN. 
SELECT PRODUCTO.NOMBRE, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE IN( "Asus", "Hewlett-Packard", "Seagate");

-- 30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE '%e';

-- 31. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE '%w%';

-- 32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE PRODUCTO.PRECIO >= 180 ORDER BY PRODUCTO.PRECIO DESC;
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE PRODUCTO.PRECIO >= 180 ORDER BY PRODUCTO.NOMBRE ASC;

-- 33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT FABRICANTE.CODIGO, FABRICANTE.NOMBRE FROM FABRICANTE INNER JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;

-- 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT FABRICANTE.NOMBRE, PRODUCTO.NOMBRE FROM FABRICANTE LEFT JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;

-- 35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT FABRICANTE.NOMBRE, PRODUCTO.NOMBRE FROM FABRICANTE LEFT JOIN PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE PRODUCTO.NOMBRE IS NULL;

-- 36. Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT PRODUCTO.NOMBRE FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = (SELECT FABRICANTE.CODIGO FROM FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo');

-- 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO WHERE PRODUCTO.PRECIO = (SELECT MAX(PRODUCTO.PRECIO) FROM PRODUCTO WHERE PRODUCTO.CODIGO_FABRICANTE = (SELECT FABRICANTE.CODIGO FROM FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo'));

-- 38. Llista el nom del producte més car del fabricador Lenovo.
SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo' ORDER BY PRODUCTO.PRECIO DESC LIMIT 1;

-- 39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Hewlett-Packard' ORDER BY PRODUCTO.PRECIO ASC LIMIT 1;

-- 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO WHERE PRODUCTO.PRECIO >= (SELECT PRODUCTO.PRECIO FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Lenovo' ORDER BY PRODUCTO.PRECIO DESC LIMIT 1);

-- 41. Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE  FABRICANTE.NOMBRE LIKE 'Asus' AND PRODUCTO.PRECIO > (SELECT AVG(PRODUCTO.PRECIO) FROM PRODUCTO LEFT JOIN FABRICANTE ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE WHERE FABRICANTE.NOMBRE LIKE 'Asus');

