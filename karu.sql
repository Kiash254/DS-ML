--create table called Karatina University with the following fields admission_number,borrower,book,author,publisher and set admission_number as a primary key

CREATE TABLE Karatina_University(
admission_number INT NOT NULL PRIMARY KEY,
borrower VARCHAR(30) NOT NULL,
book VARCHAR(30) NOT NULL,
author VARCHAR(30) NOT NULL,
publisher VARCHAR(30) NOT NULL
);

--add 10 records to the table Karatina University
INSERT INTO Karatina_University(admission_number,borrower,book,author,publisher) VALUES
(1,'John','The Alchemist','Paulo Coelho','Harper Collins'),
(2,'Mary','The Power of Now','Eckhart Tolle','New World Library'),
(3,'Peter','The 48 Laws of Power','Robert Greene','Penguin Books'),
(5,'James','The 5 Love Languages','Gary Chapman','Northfield Publishing'),
(6,'Sarah','The 4-Hour Workweek','Timothy Ferriss','Crown Business'),
(7,'John','The 4-Hour Body','Timothy Ferriss','Crown Business'),
(8,'Mary','The 4-Hour Chef','Timothy Ferriss','Crown Business'),
(9,'Peter','The 4-Hour Workweek','Timothy Ferriss','Crown Business'),
(10,'Jane','The 4-Hour Body','Timothy Ferriss','Crown Business');
--add 5 more records to the table Karatina University
INSERT INTO Karatina_University(admission_number,borrower,book,author,publisher) VALUES
(11,'James','The 5 Love Languages','Gary Chapman','Northfield Publishing'),
(12,'Sarah','The 4-Hour Workweek','Timothy Ferriss','Crown Business'),
(13,'John','The 4-Hour Body','Timothy Ferriss','Crown Business'),
(14,'Mary','The 4-Hour Chef','Timothy Ferriss','Crown Business'),
(15,'Peter','The 4-Hour Workweek','Timothy Ferriss','Crown Business');
--add column called department to the table Karatina University
ALTER TABLE Karatina_University ADD department VARCHAR(30) NOT NULL;
--add records to the department column
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=1;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=2;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=3;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=4;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=5;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=6;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=7;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=8;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=9;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=10;
UPDATE Karatina_University SET department='Computer Science' WHERE admission_number=11;

