DROP DATABASE IF EXISTS opticaDatabase;
CREATE DATABASE opticaDatabase;
USE opticaDatabase;

CREATE TABLE suppliers (
supplierId TINYINT NOT NULL AUTO_INCREMENT,
supplierName VARCHAR(30) NOT NULL,
addressId TINYINT,
supplierTelephone VARCHAR(16),
supplierFax VARCHAR(16),
supplierNIF VARCHAR(16),
PRIMARY KEY(supplierId)
);
INSERT INTO suppliers
VALUES(supplierId, 'PincoPalla', 1, '+34 926 123 456', '+34 678 567 567', '567456N');

CREATE TABLE glasses (
    glassId TINYINT NOT NULL AUTO_INCREMENT,
    supplierId TINYINT NOT NULL,
    clientId TINYINT NOT NULL,
    employeeId TINYINT NOT NULL,
    glassBrand VARCHAR(30),
    glassGradue FLOAT,
    glassFrame VARCHAR(16),
    glassColorFrame VARCHAR(16),
    glassColorLens VARCHAR(16),
    price FLOAT,
    whenSell DATETIME,
    PRIMARY KEY(glassId)
);

INSERT INTO glasses
VALUES(glassId, 1 , 1, 1, 'rasband', 0.2, 'flotant', 'black', 'blue', 45.5, '2022-05-25 18:12:26');

CREATE TABLE clients (
    clientId INT NOT NULL AUTO_INCREMENT,
    addressId INT,
    clientName VARCHAR(30),
    clientTelephone VARCHAR(16),
    clientMail VARCHAR(16),
    clientDateRegister DATETIME,
    clientRecommendBy VARCHAR(16),
    PRIMARY KEY(clientId)
);

INSERT INTO clients
VALUES(clientid , 2, 'Nino Rota', '+34 926 127 569', 'fr@gm.com', '2022-05-25 18:12:26', 'Pinco');

CREATE TABLE addressPeople (
    addressId INT NOT NULL AUTO_INCREMENT,
    street VARCHAR(30),
    num VARCHAR(10),
    floor VARCHAR(10),
    door TINYINT,
    city VARCHAR(20),
    postalCode VARCHAR(10),
    country VARCHAR(20),
    PRIMARY KEY(addressId)
);

INSERT INTO addressPeople
VALUES(addressId , 'street1', '2a', '4', 3, 'Barcelona', '08001', 'Spain');
INSERT INTO addressPeople
VALUES(addressId , 'street2', '122','atico', 3, 'Barcelona', '08021', 'Spain');
INSERT INTO addressPeople
VALUES(addressId , 'street3', '12','5', 3, 'Barcelona', '08021', 'Spain');

CREATE TABLE employee (
    employeeId TINYINT NOT NULL AUTO_INCREMENT,
    addressId TINYINT,
    employeeName VARCHAR(30),
    employeeTelephone VARCHAR(16),
    PRIMARY KEY(employeeId)
);
INSERT INTO employee
VALUES(employeeId, 3, 'Pepe Pio', '+34 926 127 569' );

SELECT employeeName, whenSell, glassBrand FROM employee
INNER JOIN glasses
WHERE employeeId = glasses.employeeId;
