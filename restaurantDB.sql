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
    orderId INT(5) NOT NULL,
    productName VARCHAR(30) NOT NULL,
    productDescription VARCHAR(50),
    productImage BLOB,
    price FLOAT,
    productType ENUM('pizza', 'hamburger', 'drink'),
    PRIMARY KEY(productId),
    FOREIGN KEY (orderId) REFERENCES orders(orderId)
);
INSERT INTO products(orderId, productName, productDescription, productImage, price, productType)
VALUES
    (1, 'Pizza Margherita', 'tomate, mozzarella, albahaja', LOAD_FILE('/image_path/image_fileName.png'), 7.5, 'pizza'),
    (3, 'Pizza 4 quesos', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'pizza'),
    (1, 'Hamburger clasico', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'hamburger'),
    (3, 'Hamburger con queso', 'tomate, mozzarella, fontina, grana, gorgonzola', LOAD_FILE('/image_path/image_fileName.png'), 10, 'hamburger'),
    (2, 'Wine', 'White, Penedes 2016', LOAD_FILE('/image_path/image_fileName.png'), 8, 'drink'),
    (3, 'Water', 'Bezoya', LOAD_FILE('/image_path/image_fileName.png'), 1.5, 'drink');

CREATE TABLE pizzas (
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
);

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

SET @howmanyPizzas = (SELECT COUNT(productType) FROM products WHERE productType LIKE 'pizza' AND orderId = 1) ;
UPDATE orders 
SET howmanyPizzas = @howmanyPizzas
WHERE orderId = 1;

(Select clientName, sum(price), COUNT(productType) from products 
inner join orders
on orders.orderId = products.orderId
inner join clients
on orders.clientId = clients.clientId
WHERE productType LIKE 'pizza' 
group by clients.clientId);

