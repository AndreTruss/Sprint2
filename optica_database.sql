=======
DROP DATABASE IF EXISTS opticaDatabase ;
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
    supplierId TINYINT,
    clientId TINYINT,
    employeeId TINYINT,
    glassBrand VARCHAR(30),
    glassGradue FLOAT,
    glassFrame VARCHAR(16),
    glassColorFrame VARCHAR(16),
    glassColorLens VARCHAR(16),
    price FLOAT,
    PRIMARY KEY(glassId)
);

INSERT INTO glasses
VALUES(glassId, 1 , NULL, NULL, 'brand', 0.2, 'flotant', 'black', 'blue', 45.5);

CREATE TABLE clients (
    clientId INT NOT NULL AUTO_INCREMENT,
    addressId INT,
    clientName VARCHAR(30),
    clientTelephone VARCHAR(16),
    clientMail VARCHAR(16),
    clientDateRegister "on update" CURRENT_TIMESTAMP,
    clientRecommendBy VARCHAR(16),
    PRIMARY KEY(clientId)
);

INSERT INTO clients
VALUES(clientid , 2, 'name', '+34 926 127 569', 'fr@gm.com', CURRENT_TIMESTAMP, 'Pinco');

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
    glassId TINYINT,
    clientId TINYINT,
    addressId TINYINT,
    employeeName VARCHAR(30),
    employeeTelephone VARCHAR(16),
    whenSell "on update" CURRENT_TIMESTAMP,
    PRIMARY KEY(employeeId)
);
INSERT INTO employee
VALUES(employeeId, 1, 1, 3, 'name employe', '+34 926 127 569', CURRENT_TIMESTAMP);