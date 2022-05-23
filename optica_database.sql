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