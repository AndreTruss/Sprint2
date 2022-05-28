DROP DATABASE IF EXISTS restaurantDB;
CREATE DATABASE restaurantDB;
USE restaurantDB;

CREATE TABLE localitat (
    localitatId INT(5) NOT NULL AUTO_INCREMENT,
    localitatName VARCHAR(15) NOT NULL,
    PRIMARY KEY(localitatId)
);

CREATE TABLE provincia (
    provinciaId INT(5) NOT NULL AUTO_INCREMENT,
    localitatId INT(5) NOT NULL UNIQUE,
    provinciaName VARCHAR(15) NOT NULL,
    PRIMARY KEY(provinciaId),
    FOREIGN KEY (localitatId) REFERENCES localitat(localitatId)
);

CREATE TABLE clients (
    clientId INT(5) NOT NULL AUTO_INCREMENT,
    clientName VARCHAR(15) NOT NULL,
    clientSurname VARCHAR(15) NOT NULL,
    clientAdress VARCHAR(15),
    localitatId INT(5),
    provinciaId INT(5),
    clientTelephone VARCHAR(15),
    PRIMARY KEY(clientId),
    FOREIGN KEY (localitatId) REFERENCES localitat(localitatId),
    FOREIGN KEY (provinciaId) REFERENCES provincia(provinciaId)
);

CREATE TABLE products (
    productId INT(5) NOT NULL AUTO_INCREMENT,
    productName VARCHAR(15),
    productDescription VARCHAR(30),
    productImage BLOB,
    price FLOAT,
    PRIMARY KEY(orderId),
    FOREIGN KEY (clientId) REFERENCES client(clientId)
);

CREATE TABLE pizzas (
    SELECT productId, productName, productDescription, productImage, price FROM products
    WHERE productName LIKE 'pizza%'
);

CREATE TABLE employee (
    employeeId INT(5) NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(15) NOT NULL,
    employeeSurname VARCHAR(15) NOT NULL,
    employeeNIF VARCHAR(9),
    employeeTelephone VARCHAR(15),
    employeeRule VARCHAR(15),
    PRIMARY KEY(orderId),
    FOREIGN KEY (clientId) REFERENCES client(clientId)
);

CREATE TABLE shop (
    shopId INT(5) NOT NULL AUTO_INCREMENT,
    shopAdress VARCHAR(30),
    shopPostalCode VARCHAR(10),
    localitatId INT(5),
    provinciaId INT(5),
    employeeId INT(5) UNIQUE,
    PRIMARY KEY(orderId),
    FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);

CREATE TABLE orders (
    orderId INT(5) NOT NULL AUTO_INCREMENT,
    clientId INT(5) NOT NULL,
    orderDate DATETIME,
    orderDelivery INT(5),
    productsQuantity INT(5),
    totalPrice FLOAT,
    PRIMARY KEY(orderId),
    FOREIGN KEY (clientId) REFERENCES client(clientId)
);