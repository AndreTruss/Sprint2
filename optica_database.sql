=======
DROP DATABASE IF EXISTS opticaDatabase ;
CREATE DATABASE opticaDatabase;
USE opticaDatabase;

CREATE TABLE suppliers (
supplierId INT NOT NULL AUTO_INCREMENT,
supplierName VARCHAR(30) NOT NULL,
addressId INT NOT NULL,
supplierTelephone VARCHAR(16) NOT NULL,
supplierFax VARCHAR(16) NULL,
supplierNIF VARCHAR(16) NOT NULL,
PRIMARY KEY(supplierId)
);
INSERT INTO suppliers
VALUES(supplierId ,'PincoPalla', 1, '+34 926 123 456', '+34 678 567 567', '567456N');

CREATE TABLE glasses (
    supplierId INT NOT NULL,
    clientId INT NOT NULL,
    glassBrand VARCHAR(30) NULL,
    glassGradue INT NULL,
    glassFrame VARCHAR(16) NULL,
    glassColorFrame VARCHAR(16) NULL,
    glassColorLens VARCHAR(16) NULL,
    price FLOAT NULL,
    PRIMARY KEY(supplierId, clientId)
);

INSERT INTO glasses
VALUES(1 , 1, 'brand', 4, 'hard', 'black', 'blue', 45.5);

CREATE TABLE clients (
    clientId INT NOT NULL AUTO_INCREMENT,
    addressId INT NOT NULL,
    clientName VARCHAR(30) NULL,
    clientTelephone VARCHAR(16) NULL,
    clientMail VARCHAR(16) NULL,
    clientDateRegister DATETIME NULL,
    clientRecommendBy VARCHAR(16) NULL,
    PRIMARY KEY(clientId)
);

INSERT INTO glasses
VALUES(clientid , 2, 'name', '+34 926 127 569', 'fr@gm.com', 2022-05-16 12:15:00, 'Pinco');

CREATE TABLE addressPeople (
    addressId INT NOT NULL AUTO_INCREMENT,
    street VARCHAR(30) NULL,
    num VARCHAR(10) NULL,
    floor VARCHAR(10) NULL,
    door INT NULL,
    city VARCHAR(20) NULL,
    postalCode VARCHAR(10) NULL,
    country VARCHAR(20) NULL,
    PRIMARY KEY(addressId)
);

INSERT INTO addressPeople
VALUES(addressId , 'street1', '2a', '4', 3, 'Barcelona', '08001', 'Spain');
VALUES(addressId , 'street2', '122','atico', 3, 'Barcelona', '08021', 'Spain');

