DROP DATABASE IF EXISTS restaurantDB;
CREATE DATABASE restaurantDB CHARACTER SET utf8mb4;
USE restaurantDB;

CREATE TABLE localitats (
    localitatId INT(5) NOT NULL AUTO_INCREMENT,
    localitatName VARCHAR(15) NOT NULL,
    PRIMARY KEY(localitatId)
);

CREATE TABLE provincias (
    provinciaId INT(5) NOT NULL AUTO_INCREMENT,
    provinciaName VARCHAR(15) NOT NULL,
    localitatId INT(5) NOT NULL UNIQUE,  -- unica localitat per provincia
    PRIMARY KEY(provinciaId),
    FOREIGN KEY (localitatId) REFERENCES localitats(localitatId)
);

CREATE TABLE clients (
    clientId INT(5) NOT NULL AUTO_INCREMENT,
    clientName VARCHAR(15) NOT NULL,
    clientSurname VARCHAR(15) NOT NULL,
    clientAdress VARCHAR(30),
    localitatId INT(5),
    clientTelephone VARCHAR(15),
    PRIMARY KEY(clientId),
    FOREIGN KEY (localitatId) REFERENCES localitats(localitatId)
);

CREATE TABLE shop (
    shopId INT(5) NOT NULL AUTO_INCREMENT,
    shopAdress VARCHAR(30),
    shopPostalCode VARCHAR(10),
    localitatId INT(5),
    PRIMARY KEY(shopId),
    FOREIGN KEY (localitatId) REFERENCES localitats(localitatId)
);

CREATE TABLE employees (
    employeeId INT(5) NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(30) NOT NULL,
    employeeSurname VARCHAR(30) NOT NULL,
    employeeNIF VARCHAR(9),
    employeeTelephone VARCHAR(15),
    employeeRule ENUM('Cuiner', 'Repartidor'),
    shopId INT(5) NOT NULL,  
    PRIMARY KEY(employeeId),
    FOREIGN KEY (shopId) REFERENCES shop(shopId) 
);

CREATE TABLE products (
    productId INT(5) NOT NULL,
    productName VARCHAR(30) NOT NULL,
    productDescription VARCHAR(50),
    productImage VARCHAR(255),
    price FLOAT,
    PRIMARY KEY(productId)
);

/* CREATE TABLE pizzas (
    SELECT productId, productName, productDescription, productImage, price FROM products
    WHERE productId BETWEEN 100 AND 199
);

CREATE TABLE hamburgers (
    SELECT productId, productName, productDescription, productImage, price FROM products
    WHERE productId BETWEEN 200 AND 299
);

CREATE TABLE drinks (
    SELECT productId, productName, productDescription, productImage, price FROM products
    WHERE productId BETWEEN 300 AND 399 
); */

CREATE TABLE categoryPizzas (
    categoryName VARCHAR(30) NOT NULL,
    productId INT(5) UNIQUE,  -- Una pizza només pot estar dins d'una categoria, però una categoria pot tenir moltes pizzes.
    FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE orders (
    orderId INT(5) NOT NULL AUTO_INCREMENT,
    clientId INT(5),
    shopId INT(5),
    orderDate DATETIME,
    orderDelivery ENUM('Delivery at home', 'Pick up to store'),
    PRIMARY KEY(orderId),
    FOREIGN KEY (clientId) REFERENCES clients(clientId), 
    FOREIGN KEY (shopId) REFERENCES shop(shopId) 
);

CREATE TABLE orderMenu (
    orderId INT(5),
    productId INT(5),  
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE orderDelivery (
    orderDeliveryTime DATETIME,
    employeeId INT(5),
    orderId INT(5),
    FOREIGN KEY (employeeId) REFERENCES employees(employeeId),
    FOREIGN KEY (orderId) REFERENCES orders(orderId)
);

-- INSERT INTO

INSERT INTO localitats (localitatName)
VALUES 
    ('Arenys de Mar'),
    ('Barcelona'),
    ('Canet de Mar'),
    ('Gerona'),
    ('Figueras'),
    ('Palamós'),
    ('Alfarràs'),
    ('Lleida'),
    ('Verdú'),
    ('Reus'),
    ('Tarragona'),
    ('Vila-Seca');


INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Barcelona', localitatId FROM localitats WHERE localitatId BETWEEN 1 AND 3;
INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Gerona', localitatId FROM localitats WHERE localitatId BETWEEN 4 AND 6;
INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Lleida', localitatId FROM localitats WHERE localitatId BETWEEN 7 AND 9;
INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Tarragona', localitatId FROM localitats WHERE localitatId BETWEEN 10 AND 12;


INSERT INTO clients(clientName, clientSurname, clientAdress, localitatId, clientTelephone)
VALUES
    ('Pepe', 'Carvalho', 'av. de la luz, 6', 2, '+34 345 543 123'),
    ('Pepa', 'Flores', 'c/ del mar, 10', 6, '+34 123 456 789');


INSERT INTO shop (shopAdress, shopPostalCode, localitatId)
VALUES
    ('av. Roma, 140', '12345', 2),
    ('c/ Marina, 67', '45678', 4);


INSERT INTO employees (employeeName, employeeSurname, employeeNIF, employeeTelephone, employeeRule, shopId) -- En una botiga poden treballar molts empleats i un empleat només pot treballar en una botiga
VALUES
    ('Pino', 'Scaccia', '34856404K', '+34 678 854 023','Cuiner', 1),
    ('Ava', 'Farina', '34856404K', '+34 678 854 023','Cuiner', 2),
    ('Isolda', 'Nero', '34856404K', '+34 678 854 023','Repartidor', 1),
    ('Alex', 'Zana', '74216404K', '+34 478 254 923','Repartidor', 2);


INSERT INTO products(productId, productName, productDescription, productImage, price)
VALUES
    (100, 'Pizza Margherita', 'tomate, mozzarella, albahaja', './img/img.jpg', 7.5),
    (101, 'Pizza 4 quesos', 'tomate, mozzarella, fontina, grana, gorgonzola', './img/img.jpg', 10),
    (200, 'Hamburger clasico', 'tomate, mozzarella, fontina, grana, gorgonzola', './img/img.jpg', 10),
    (201, 'Hamburger con queso', 'tomate, mozzarella, fontina, grana, gorgonzola', './img/img.jpg', 10),
    (300, 'Wine', 'White, Penedes 2016', './img/img.jpg', 8),
    (301, 'Water', 'Bezoya', './img/img.jpg', 1.5);


INSERT INTO categoryPizzas (categoryName, productId)
SELECT 'Category Mare', productId FROM products
WHERE productId = 100;


INSERT INTO orders (clientId, shopId, orderDate, orderDelivery) -- Un client pot realitzar moltes comandes, però una única comanda només pot ser realitzat per un únic client.
VALUES                                                          -- Una comanda és gestionada per una única botiga i una botiga pot gestionar moltes comandes.
    (1, 1, NOW(), 'Delivery at home'),
    (1, 1, NOW(), 'Delivery at home'),
    (2, 2, NOW(), 'Pick up to store');


INSERT INTO orderMenu (orderId, productId) -- Una comanda pot constar d'un o diversos productes.
VALUES
    (1, 100),
    (1, 200),
    (2, 300),
    (3, 100),
    (3, 101),
    (3, 201),
    (3, 301);


INSERT INTO orderDelivery (orderDeliveryTime, employeeId, orderId)
SELECT NOW(), employeeId, orderId FROM orders
INNER JOIN employees
ON employees.shopId = orders.shopId
WHERE orders.orderDelivery LIKE 'Delivery at home' AND employees.employeeRule LIKE 'Repartidor';


-- QUERY
-- quantitat de productes que s'han seleccionat de cada tipus

SELECT clientName, clientSurname, COUNT(orderMenu.productId) AS 'Number of pizza' FROM orderMenu
INNER JOIN orders
ON orders.orderId = orderMenu.orderId
INNER JOIN clients
ON orders.clientId = clients.clientId
WHERE orderMenu.productId BETWEEN 100 AND 199
GROUP BY clients.clientId;

SELECT clientName, clientSurname, COUNT(orderMenu.productId) AS 'Number of hamburger' FROM orderMenu
INNER JOIN orders
ON orders.orderId = orderMenu.orderId
INNER JOIN clients
ON orders.clientId = clients.clientId
WHERE orderMenu.productId BETWEEN 200 AND 299
GROUP BY clients.clientId;

SELECT clientName, clientSurname, COUNT(orderMenu.productId) AS 'Number of drink' FROM orderMenu
INNER JOIN orders
ON orders.orderId = orderMenu.orderId
INNER JOIN clients
ON orders.clientId = clients.clientId
WHERE orderMenu.productId BETWEEN 300 AND 399
GROUP BY clients.clientId;

-- preu total per cada client
SELECT clientName, clientSurname, SUM(products.price) AS 'Total Price' FROM orderMenu 
INNER JOIN products 
ON orderMenu.productId = products.productId
INNER JOIN orders 
ON orderMenu.orderId = orders.orderId
INNER JOIN clients 
ON clients.clientId = orders.clientId
GROUP BY clients.clientId; 

-- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat
SELECT localitatName, COUNT(orderMenu.productId) AS 'Number of drink' FROM orderMenu
INNER JOIN orders
ON orders.orderId = orderMenu.orderId
INNER JOIN clients
ON orders.clientId = clients.clientId
INNER JOIN localitats
ON clients.localitatId = localitats.localitatId
WHERE orderMenu.productId BETWEEN 300 AND 399
GROUP BY clients.clientId;

-- Llista quantes comandes ha efectuat un determinat empleat
SELECT employeeName, employeeSurname, employeeRule, COUNT(orderId) AS 'Number of orders' FROM employees
INNER JOIN orders
ON orders.shopId = employees.shopId
GROUP BY employees.employeeId;
