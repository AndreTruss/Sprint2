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
INSERT INTO provincia (localitatId, provinciaName)
SELECT 'Gerona', localitatId FROM localitat WHERE localitatId BETWEEN 4 AND 6;
INSERT INTO provincia (localitatId, provinciaName)
SELECT 'Lleida', localitatId FROM localitat WHERE localitatId BETWEEN 7 AND 9;
INSERT INTO provincia (localitatId, provinciaName)
SELECT 'Tarragona', localitatId FROM localitat WHERE localitatId BETWEEN 10 AND 12;

CREATE TABLE clients (
    clientId INT(5) NOT NULL AUTO_INCREMENT,
    clientName VARCHAR(15) NOT NULL,
    clientSurname VARCHAR(15) NOT NULL,
    clientAdress VARCHAR(15),
    localitatId INT(5),
    clientTelephone VARCHAR(15),
    PRIMARY KEY(clientId),
    FOREIGN KEY (localitatId) REFERENCES localitat(localitatId)
);
INSERT INTO clients(clientName, clientSurname, clientAdress, localitatId, provinciaId, clientTelephone)
VALUES
    ('Pepe', 'Carvalho', 'av. de la luz, 6', 3),
    ('Pepa', 'Flores', 'c/ del mar, 10', 10);

CREATE TABLE products (
    productId INT(5) NOT NULL AUTO_INCREMENT,
    productName VARCHAR(15),
    productDescription VARCHAR(30),
    productImage BLOB,
    price FLOAT,
    productType ENUM('pizza', 'hamburger', 'drink')
    PRIMARY KEY(productId)
);
INSERT INTO clients(productName, productDescription, productImage, price, productType)
VALUES
    ('Pizza Margherita', 'tomate, mozzarella, albahaja', , 7.5, 'pizza'),
    ('Pizza 4 quesos', 'tomate, mozzarella, fontina, grana, gorgonzola', , 10, 'pizza'),
    ('Hamburger clasico', 'tomate, mozzarella, fontina, grana, gorgonzola', , 10, 'hamburger'),
    ('Hamburger con queso', 'tomate, mozzarella, fontina, grana, gorgonzola', , 10, 'hamburger'),
    ('Wine', 'White, Penedes 2016', , 8, 'drink'),
    ('Water', 'Bezoya', , 1.5, 'drink');

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
    categoryName VARCHAR(15) NOT NULL,
    productId INT(5) UNIQUE,
    PRIMARY KEY(categoryId),
    FOREIGN KEY (productId) REFERENCES pizzas(productId)
);

CREATE TABLE employee (
    employeeId INT(5) NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(15) NOT NULL,
    employeeSurname VARCHAR(15) NOT NULL,
    employeeNIF VARCHAR(9),
    employeeTelephone VARCHAR(15),
    employeeRule ENUM('Cuiner', 'Repartidor'),
    PRIMARY KEY(employeeId),
);

CREATE TABLE shop (
    shopId INT(5) NOT NULL AUTO_INCREMENT,
    shopAdress VARCHAR(30),
    shopPostalCode VARCHAR(10),
    localitatId INT(5),
    provinciaId INT(5),
    employeeId INT(5) UNIQUE,
    PRIMARY KEY(shopId),
    FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);


CREATE TABLE orders (
    orderId INT(5) NOT NULL AUTO_INCREMENT,
    clientId INT(5) NOT NULL,
    orderDate DATETIME,
    orderDelivery ENUM('Delivery at home', 'Pick up to store'),
    productsQuantity INT(5),
    totalPrice FLOAT,
    PRIMARY KEY(orderId),
    FOREIGN KEY (clientId) REFERENCES clients(clientId),
    FOREIGN KEY (deliveryId) REFERENCES delivery(deliveryId)
);