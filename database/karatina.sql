--create schema called karatina university database 
CREATE DATABASE karatina;
USE karatina;
--create a table called Borrower with the following fields borrower_id, borrower_name, borrower_address, borrower_phone, borrower_email, borrower_password, borrower_status and borrower_id set as primary key
CREATE TABLE Borrower(
borrower_id INT NOT NULL AUTO_INCREMENT,
borrower_name VARCHAR(50) NOT NULL,
borrower_address VARCHAR(50) NOT NULL,
borrower_phone VARCHAR(50) NOT NULL,
borrower_email VARCHAR(50) NOT NULL,
borrower_password VARCHAR(50) NOT NULL,
borrower_status VARCHAR(50) NOT NULL,
PRIMARY KEY(borrower_id)
);

-- add one column called statements

ALTER TABLE Borrower(
    
)