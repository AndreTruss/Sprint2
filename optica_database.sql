CREATE DATABASE opticaDatabase;
USE opticaDatabase;
IF EXISTS ALTER TABLE suppliers DROP;
CREATE TABLE suppliers(
    supplierId INT NOT NULL AUTO_INCREMENT,
    supplierName VARCHAR(30) NOT NULL,
    addressId INT NOT NULL AUTO_INCREMENT,
    supplierTelephone VARCHAR(16) NOT NULL,
    supplierFax VARCHAR(16),
    supplierNIF VARCHAR(16) NOT NULL,
);