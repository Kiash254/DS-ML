CREATE TABLE `Customers Table`(
    `Customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Phone_number` INT NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `Items_Purchased` VARCHAR(255) NOT NULL,
    `Amout_paid` INT NOT NULL,
    `Serverd_by` VARCHAR(255) NOT NULL,
    `payment_method` INT NOT NULL
);

--inserting data into the table 
INSERT INTO `Customers Table`(`Customer_id`, `FirstName`, `LastName`, `Phone_number`, `Email`, `Items_Purchased`, `Amout_paid`, `Serverd_by`, `payment_method`) VALUES (1,'John','Doe',123456789,'
[...]
