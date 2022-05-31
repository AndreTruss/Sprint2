DROP DATABASE IF EXISTS restaurantDB;
CREATE DATABASE restaurantDB;
USE restaurantDB;

CREATE TABLE localitat (
    localitatId INT(5) NOT NULL AUTO_INCREMENT,
    localitatName VARCHAR(15) NOT NULL,
    PRIMARY KEY(localitatId)
);
INSERT INTO localitat (localitatName)
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

CREATE TABLE provincia (
    provinciaId INT(5) NOT NULL AUTO_INCREMENT,
    provinciaName VARCHAR(15) NOT NULL,
    localitatId INT(5) NOT NULL UNIQUE,
    PRIMARY KEY(provinciaId),
    FOREIGN KEY (localitatId) REFERENCES localitat(localitatId)
);
INSERT INTO provincia (provinciaName, localitatId)
SELECT 'Barcelona', localitatId FROM localitat WHERE localitatId BETWEEN 1 AND 3;
INSERT INTO provincia (provinciaName, localitatId)
SELECT 'Gerona', localitatId FROM localitat WHERE localitatId BETWEEN 4 AND 6;
INSERT INTO provincia (provinciaName, localitatId)
SELECT 'Lleida', localitatId FROM localitat WHERE localitatId BETWEEN 7 AND 9;
INSERT INTO provincia (provinciaName, localitatId)
SELECT 'Tarragona', localitatId FROM localitat WHERE localitatId BETWEEN 10 AND 12;

CREATE TABLE clients (
    clientId INT(5) NOT NULL AUTO_INCREMENT,
    clientName VARCHAR(15) NOT NULL,
    clientSurname VARCHAR(15) NOT NULL,
    clientAdress VARCHAR(30),
    localitatName VARCHAR(15),
    clientTelephone VARCHAR(15),
    PRIMARY KEY(clientId)
);
INSERT INTO clients(clientName, clientSurname, clientAdress, localitatName, clientTelephone)
VALUES
    ('Pepe', 'Carvalho', 'av. de la luz, 6', 'Barcelona', '+34 345 543 123'),
    ('Pepa', 'Flores', 'c/ del mar, 10', 'Palamos', '+34 123 456 789');

CREATE TABLE shop (
    shopId INT(5) NOT NULL AUTO_INCREMENT,
    shopAdress VARCHAR(30),
    shopPostalCode VARCHAR(10),
    localitatName VARCHAR(15),
    PRIMARY KEY(shopId)
);
INSERT INTO shop (shopAdress, shopPostalCode, localitatName)
VALUES
    ('av. Roma, 140', '12345', 'Barcelona'),
    ('c/ Marina, 67', '45678', 'Gerona');

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


CREATE TABLE orders (
    orderId INT(5) NOT NULL AUTO_INCREMENT,
    clientId INT(5),
    shopId INT(5) ,
    orderDate DATETIME,
    orderDelivery ENUM('Delivery at home', 'Pick up to store'),
    howmanyPizzas INT(5),
    howmanyHamburgers INT(5),
    howmanyDrinks INT(5),
    totalPrice FLOAT,
    PRIMARY KEY(orderId),
    FOREIGN KEY (clientId) REFERENCES clients(clientId),
    FOREIGN KEY (shopId) REFERENCES shop(shopId)
);
INSERT INTO orders (clientId, shopId, orderDate, orderDelivery)
VALUES
    (1, 1, NOW(), 'Delivery at home'),
    (1, 1, NOW(), 'Delivery at home'),
    (2, 2, NOW(), 'Pick up to store');

CREATE TABLE products (
    productId INT(5) NOT NULL AUTO_INCREMENT,
    productName VARCHAR(30) NOT NULL,
    productDescription VARCHAR(50),
    productImage BLOB,
    price FLOAT,
    productType ENUM('pizza', 'hamburger', 'drink'),
    PRIMARY KEY(productId)
);
INSERT INTO products(productName, productDescription, productImage, price, productType)
VALUES
    ('Pizza Margherita', 'tomate, mozzarella, albahaja', LOAD_FILE('/image_path/image_fileName.png'), 7.5, 'pizza'),
    ('Pizza 4 quesos', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'pizza'),
    ('Hamburger clasico', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'hamburger'),
    ('Hamburger con queso', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'hamburger'),
    ('Wine', 'White, Penedes 2016', LOAD_FILE('/image_path/image_fileName.png'), 8, 'drink'),
    ('Water', 'Bezoya', LOAD_FILE('/image_path/image_fileName.png'), 1.5, 'drink');

/* CREATE TABLE pizzas (
    SELECT productId, productName, productDescription, productImage, price FROM products
    WHERE productType LIKE 'pizza'
);

CREATE TABLE hamburgers (
    SELECT productId, productName, productDescription, productImage, price FROM products
    WHERE productType LIKE 'hamburger'
);

CREATE TABLE drinks (
    SELECT productId, productName, productDescription, productImage, price FROM products
    WHERE productType LIKE 'drink' 
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
WHERE productType LIKE 'pizza' AND productName LIKE '%Margherita';

CREATE TABLE orderList (
    orderListId INT(5) NOT NULL AUTO_INCREMENT,
    orderId INT(5),
    productId INT(5),
    PRIMARY KEY(orderListId),
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);
INSERT INTO orderList (orderId, productId)
VALUES
    (1, 1),
    (1, 3),
    (2, 5),
    (3, 2),
    (3, 4),
    (3, 6);


SET @howmanyPizzas1 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 1 AND 2 AND orderId = 1) ;
SET @howmanyHamburgers1 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 3 AND 4 AND orderId = 1) ;
SET @howmanyDrinks1 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 5 AND 6 AND orderId = 1) ;
SET @totalPrice1 = (SELECT SUM(products.price) FROM orderList INNER JOIN products ON orderList.productId = products.productId
WHERE  orderId = 1) ;

SET @howmanyPizzas2 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 1 AND 2 AND orderId = 2) ;
SET @howmanyHamburgers2 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 3 AND 4 AND orderId = 2) ;
SET @howmanyDrinks2 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 5 AND 6 AND orderId = 2) ;
SET @totalPrice2 = (SELECT SUM(products.price) FROM orderList INNER JOIN products ON orderList.productId = products.productId
WHERE  orderId = 2) ;

SET @howmanyPizzas3 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 1 AND 2 AND orderId = 3) ;
SET @howmanyHamburgers3 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 3 AND 4 AND orderId = 3) ;
SET @howmanyDrinks3 = (SELECT COUNT(productId) FROM orderList WHERE productId BETWEEN 5 AND 6 AND orderId = 3) ;
SET @totalPrice3 = (SELECT SUM(products.price) FROM orderList INNER JOIN products ON orderList.productId = products.productId
WHERE  orderId = 3) ;

UPDATE orders SET 
    howmanyPizzas = @howmanyPizzas1, 
    howmanyHamburgers = @howmanyHamburgers1, 
    howmanyDrinks = @howmanyDrinks1, 
    totalPrice = @totalPrice1
WHERE orderId = 1;
UPDATE orders SET 
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
WHERE orderId = 3;

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