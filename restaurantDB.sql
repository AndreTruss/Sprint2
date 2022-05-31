DROP DATABASE IF EXISTS restaurantDB;
CREATE DATABASE restaurantDB;
USE restaurantDB;

CREATE TABLE localitats (
    localitatId INT(5) NOT NULL AUTO_INCREMENT,
    localitatName VARCHAR(15) NOT NULL,
    PRIMARY KEY(localitatId)
);
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

CREATE TABLE provincias (
    provinciaId INT(5) NOT NULL AUTO_INCREMENT,
    provinciaName VARCHAR(15) NOT NULL,
    localitatId INT(5) NOT NULL UNIQUE,
    PRIMARY KEY(provinciaId),
    FOREIGN KEY (localitatId) REFERENCES localitats(localitatId)
);
INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Barcelona', localitatId FROM localitats WHERE localitatId BETWEEN 1 AND 3;
INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Gerona', localitatId FROM localitats WHERE localitatId BETWEEN 4 AND 6;
INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Lleida', localitatId FROM localitats WHERE localitatId BETWEEN 7 AND 9;
INSERT INTO provincias (provinciaName, localitatId)
SELECT 'Tarragona', localitatId FROM localitats WHERE localitatId BETWEEN 10 AND 12;

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
INSERT INTO clients(clientName, clientSurname, clientAdress, localitatId, clientTelephone)
VALUES
    ('Pepe', 'Carvalho', 'av. de la luz, 6', 2, '+34 345 543 123'),
    ('Pepa', 'Flores', 'c/ del mar, 10', 6, '+34 123 456 789');

CREATE TABLE shop (
    shopId INT(5) NOT NULL AUTO_INCREMENT,
    shopAdress VARCHAR(30),
    shopPostalCode VARCHAR(10),
    localitatId INT(5),
    PRIMARY KEY(shopId),
    FOREIGN KEY (localitatId) REFERENCES localitats(localitatId)
);
INSERT INTO shop (shopAdress, shopPostalCode, localitatId)
VALUES
    ('av. Roma, 140', '12345', 2),
    ('c/ Marina, 67', '45678', 4);

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
INSERT INTO employees (employeeName, employeeSurname, employeeNIF, employeeTelephone, employeeRule, shopId)
VALUES
    ('Pino', 'Scaccia', '34856404K', '+34 678 854 023','Cuiner', 1),
    ('Ava', 'Farina', '34856404K', '+34 678 854 023','Cuiner', 2),
    ('Isolda', 'Nero', '34856404K', '+34 678 854 023','Repartidor', 1),
    ('Alex', 'Zana', '74216404K', '+34 478 254 923','Repartidor', 2);

CREATE TABLE products (
    productId INT(5) NOT NULL,
    productName VARCHAR(30) NOT NULL,
    productDescription VARCHAR(50),
    productImage BLOB,
    price FLOAT,
    productType ENUM('pizza', 'hamburger', 'drink'),
    PRIMARY KEY(productId)
);
INSERT INTO products(productId, productName, productDescription, productImage, price, productType)
VALUES
    (100, 'Pizza Margherita', 'tomate, mozzarella, albahaja', LOAD_FILE('/img/img.jpg'), 7.5, 'pizza'),
    (101, 'Pizza 4 quesos', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'pizza'),
    (200, 'Hamburger clasico', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'hamburger'),
    (201, 'Hamburger con queso', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'hamburger'),
    (300, 'Wine', 'White, Penedes 2016', LOAD_FILE('/image_path/image_fileName.png'), 8, 'drink'),
    (301, 'Water', 'Bezoya', LOAD_FILE('/image_path/image_fileName.png'), 1.5, 'drink');

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
	categoryId INT(5) NOT NULL AUTO_INCREMENT,
    categoryName VARCHAR(30) NOT NULL,
    productId INT(5) UNIQUE,
    PRIMARY KEY(categoryId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);
INSERT INTO categoryPizzas (categoryName, productId)
SELECT 'Category Mare', productId FROM products
WHERE productId = 100;

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
INSERT INTO orders (clientId, shopId, orderDate, orderDelivery)
VALUES
    (1, 1, NOW(), 'Delivery at home'),
    (1, 1, NOW(), 'Delivery at home'),
    (2, 2, NOW(), 'Pick up to store');

CREATE TABLE orderMenu (
    orderMenuId INT(5) NOT NULL AUTO_INCREMENT,
    orderId INT(5),
    productId INT(5),
    howmanyPizzas INT(5) DEFAULT 0,
    howmanyHamburgers INT(5) DEFAULT 0,
    howmanyDrinks INT(5) DEFAULT 0,
    PRIMARY KEY(orderMenuId),
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);
INSERT INTO orderMenu (orderId, productId)
VALUES
    (1, 100),
    (1, 200),
    (2, 300),
    (3, 100),
    (3, 101),
    (3, 201),
    (3, 301);


/* SET @howmanyPizzas1 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 100 AND 199 AND orderId = 1) ;
SET @howmanyHamburgers1 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 200 AND 299 AND orderId = 1) ;
SET @howmanyDrinks1 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 300 AND 399 AND orderId = 1) ;
SET @totalPrice1 = (SELECT SUM(products.price) FROM orderMenu INNER JOIN products ON orderMenu.productId = products.productId
WHERE  orderId = 1) ;

SET @howmanyPizzas2 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 100 AND 199 AND orderId = 2) ;
SET @howmanyHamburgers2 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 200 AND 299 AND orderId = 2) ;
SET @howmanyDrinks2 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 300 AND 399 AND orderId = 2) ;
SET @totalPrice2 = (SELECT SUM(products.price) FROM orderMenu INNER JOIN products ON orderMenu.productId = products.productId
WHERE  orderId = 2) ;

SET @howmanyPizzas3 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 100 AND 199 AND orderId = 3) ;
SET @howmanyHamburgers3 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 200 AND 299 AND orderId = 3) ;
SET @howmanyDrinks3 = (SELECT COUNT(productId) FROM orderMenu WHERE productId BETWEEN 300 AND 399 AND orderId = 3) ;
SET @totalPrice3 = (SELECT SUM(products.price) FROM orderMenu INNER JOIN products ON orderMenu.productId = products.productId
WHERE  orderId = 3) ; */
/* SET @howmanyPizzas = SELECT IF (productId BETWEEN 100 AND 199, howmanyPizzas + 1, howmanyPizzas) FROM orderMenu;
UPDATE orders SET 
    howmanyPizzas = @howmanyPizzas; */ 
 UPDATE orderMenu SET
    howmanyPizzas = IF(productId BETWEEN 100 AND 199, howmanyPizzas + 1, howmanyPizzas), 
    howmanyHamburgers = IF(productId BETWEEN 200 AND 299, howmanyHamburgers + 1, howmanyHamburgers),
    howmanyDrinks = IF(productId BETWEEN 300 AND 399, howmanyDrinks + 1, howmanyDrinks);

SELECT clientName, clientSurname, SUM(products.price) AS 'Total Price' FROM orderMenu 
INNER JOIN products 
ON orderMenu.productId = products.productId
INNER JOIN orders 
ON orderMenu.orderId = orders.orderId
INNER JOIN clients 
ON clients.clientId = orders.clientId
GROUP BY clients.clientId; 
/* UPDATE orders SET 
    howmanyPizzas = @howmanyPizzas2, 
    howmanyHamburgers = @howmanyHamburgers2, 
    howmanyDrinks = @howmanyDrinks2, 
    totalPrice = @totalPrice2
WHERE orderId = 2;
UPDATE orders SET 
    howmanyPizzas = @howmanyPizzas3, 
    howmanyHamburgers = @howmanyHamburgers3, 
    howmanyDrinks = @howmanyDrinks3, 
    totalPrice = @totalPrice3
WHERE orderId = 3; */

CREATE TABLE orderDelivery (
    orderDeliveryId INT(5) NOT NULL AUTO_INCREMENT,
    orderDeliveryTime DATETIME,
    employeeId INT(5),
    orderId INT(5),
    PRIMARY KEY(orderDeliveryId),
    FOREIGN KEY (employeeId) REFERENCES employees(employeeId),
    FOREIGN KEY (orderId) REFERENCES orders(orderId)
);
INSERT INTO orderDelivery (orderDeliveryTime, employeeId, orderId)
SELECT NOW(), employeeId, orderId FROM orders
INNER JOIN employees
ON employees.shopId = orders.shopId
WHERE orders.orderDelivery LIKE 'Delivery at home' AND employees.employeeRule LIKE 'Repartidor';

SELECT clientName, SUM(howmanyPizzas) FROM orderMenu
INNER JOIN orders
ON orders.orderId = orderMenu.orderId
INNER JOIN clients
ON orders.clientId = clients.clientId
GROUP BY clients.clientId;

SELECT localitatName, SUM(howmanyDrinks) FROM orderMenu
INNER JOIN orders
ON orders.orderId = orderMenu.orderId
INNER JOIN clients
ON orders.clientId = clients.clientId
INNER JOIN localitats
ON clients.localitatId = localitats.localitatId
GROUP BY clients.clientId;

SELECT employeeName, COUNT(orderId) FROM orders
INNER JOIN employees
ON orders.shopId = employees.shopId
GROUP BY employees.employeeName;
