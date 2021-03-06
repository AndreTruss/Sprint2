DROP DATABASE IF EXISTS opticadatabase;
CREATE DATABASE opticadatabase CHARACTER SET utf8mb4;
USE opticadatabase;

CREATE TABLE suppliers (
supplierId INT(5) NOT NULL AUTO_INCREMENT,
supplierName VARCHAR(30) NOT NULL,
supplierTelephone VARCHAR(16),
supplierFax VARCHAR(16),
supplierNIF VARCHAR(9),
PRIMARY KEY(supplierId)
);

CREATE TABLE clients (
    clientId INT(5) NOT NULL AUTO_INCREMENT,
    clientName VARCHAR(30) NOT NULL,
    clientTelephone VARCHAR(16),
    clientMail VARCHAR(16),
    clientDateRegister DATE,
    clientRecommendBy INT(5),
    PRIMARY KEY(clientId),
    FOREIGN KEY (clientRecommendBy) REFERENCES clients(clientId)
);

CREATE TABLE employees (
    employeeId INT(5) NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(30) NOT NULL,
    employeeTelephone VARCHAR(16),
    employeeMail VARCHAR(16),
    PRIMARY KEY(employeeId)
);

CREATE TABLE glasses (
    glassId INT(5) NOT NULL AUTO_INCREMENT,
    supplierId INT(5) NOT NULL,
    clientId INT(5) NOT NULL,
    employeeId INT(5) NOT NULL,
    glassBrand VARCHAR(30) NOT NULL,
    glassGradue FLOAT,
    glassFrame ENUM('Flotant', 'Pasta', 'Metallica'),
    glassColorFrame VARCHAR(16),
    glassColorLens VARCHAR(16),
    price FLOAT,
    whenSell DATE,
    PRIMARY KEY(glassId),
    FOREIGN KEY (supplierId) REFERENCES suppliers(supplierId),
    FOREIGN KEY (clientId) REFERENCES clients(clientId),
    FOREIGN KEY (employeeId) REFERENCES employees(employeeId)
);

CREATE TABLE addressPeople (
    addressId INT(5) NOT NULL AUTO_INCREMENT,
    supplierId INT(5),
    clientId INT(5),
    employeeId INT(5),
    street VARCHAR(30),
    num VARCHAR(10),
    floors VARCHAR(10),
    door INT(3),
    city VARCHAR(20),
    postalCode VARCHAR(10),
    country VARCHAR(20),
    PRIMARY KEY(addressId),
    FOREIGN KEY(supplierId) REFERENCES suppliers(supplierId),
    FOREIGN KEY(clientId) REFERENCES clients(clientId),
    FOREIGN KEY(employeeId) REFERENCES employees(employeeId)
);


-- INSERT INTO

INSERT INTO suppliers(supplierName, supplierTelephone, supplierFax, supplierNIF)
VALUES
    ('PincoPalla', '+34 926 123 456', '+34 678 567 567', '56748956N'),
    ('DiboDabo', '+34 865 987 234', '+34 865 987 234', '12345656P');


INSERT INTO clients(clientName, clientTelephone, clientMail, clientDateRegister, clientRecommendBy)
VALUES
    ('Nino Rota', '+34 926 127 569', 'fr@gm.com', '2022-02-22', NULL),
    ('Nina Nera', '+34 912 765 324', 'rom@gm.com', '2022-03-12', 1);


INSERT INTO employees(employeeName, employeeTelephone, employeeMail)
VALUES
    ('Pepe Pio', '+34 926 127 569', 'afd@df.com' ),
    ('Pepa Mia', '+34 934 567 904', 'gfd@df.com' );


INSERT INTO glasses(supplierId, clientId, employeeId, glassBrand, glassGradue, glassFrame, glassColorFrame, glassColorLens, price, whenSell)
VALUES
    (1, 1, 1, 'rasband', 0.2, 'Flotant', 'black', 'blue', 45.5, '2020-02-22'),
    (1, 2, 2, 'armadi', 0.1, 'Metallica', 'brown', 'red', 82.5, '2021-03-12'),
    (2, 1, 1, 'cuore', 0.3, 'Flotant', 'white', 'clear', 35.5, '2022-04-04'),
    (1, 2, 2, 'rufus', 0.1, 'Pasta', 'green', 'yellow', 65.5, '2022-05-02'),
    (2, 1, 2, 'valens', 0.2, 'Metallica', 'black', 'clear', 55.5, NOW());


INSERT INTO addressPeople(supplierId, clientId, employeeId, street, num, floors, door, city, postalCode, country)
VALUES
    (1, NULL, NULL, 'street1', '2a', '4', 3, 'Barcelona', '08001', 'Spain'),
    (NULL, 1, NULL, 'street2', '122','atico', 2, 'Barcelona', '08021', 'Spain'),
    (NULL, NULL, 1, 'street3', '36b','1', 4, 'Barcelona', '08121', 'Spain'),
    (NULL, NULL, 2, 'street4', '312','principal', 1, 'Barcelona', '08050', 'Spain'),
    (2, NULL, NULL, 'street5', '63','5', 2, 'Barcelona', '08032', 'Spain'),
    (NULL, 2, NULL, 'street6', '31','3', 6, 'Barcelona', '08231', 'Spain');

-- QUERY
-- El nostre sistema haur?? d???indicar qui ha sigut l???empleat que ha venut cada ullera i quan.
SELECT employeeName, whenSell, glassBrand FROM employees
INNER JOIN glasses
ON employees.employeeId = glasses.employeeId;

-- Llista el total de compres d'un client
SELECT clientName, COUNT(glasses.clientId) AS 'Total compras' FROM clients
INNER JOIN glasses
ON clients.clientId = glasses.clientId
GROUP BY clients.clientId; 

-- Llista les diferents ulleres que ha venut un empleat durant un any
SELECT employeeName, glassBrand, whenSell FROM employees
INNER JOIN glasses
ON employees.employeeId = glasses.employeeId
WHERE glasses.whenSell LIKE '2022%';

-- Llista els diferents prove??dors que han subministrat ulleres venudes amb ??xit per l'??ptica
SELECT supplierName, glassBrand, whenSell FROM suppliers
INNER JOIN glasses
ON suppliers.supplierId = glasses.supplierId; 

