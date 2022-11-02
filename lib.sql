--create a databese  called karatina library with the following table books which has the following fields book_id,book_name,author,publisher and set book_id as a primary key and set book_id as an auto increment
CREATE DATABASE karatina_library;
USE karatina_library;
CREATE TABLE books(
book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
book_name VARCHAR(30) NOT NULL,
author VARCHAR(30) NOT NULL,
publisher VARCHAR(30) NOT NULL
);
--add 10 records to the table books
INSERT INTO books(book_name,author,publisher) VALUES
('The Alchemist','Paulo Coelho','Harper Collins'),
('The Power of Now','Eckhart Tolle','New World Library'),
('The 48 Laws of Power','Robert Greene','Penguin Books'),
('The 5 Love Languages','Gary Chapman','Northfield Publishing'),
('The 4-Hour Workweek','Timothy Ferriss','Crown Business'),
('The 4-Hour Body','Timothy Ferriss','Crown Business'),
('The 4-Hour Chef','Timothy Ferriss','Crown Business'),
('The 4-Hour Workweek','Timothy Ferriss','Crown Business'),
('The 4-Hour Body','Timothy Ferriss','Crown Business'),
('The 4-Hour Chef','Timothy Ferriss','Crown Business');
--create a table called borrower with the following fields borrower_id,borrower_name,book_id and set borrower_id as a primary key and set borrower_id as an auto increment
CREATE TABLE borrower(
borrower_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
borrower_name VARCHAR(30) NOT NULL,
book_id INT NOT NULL
);
--add 10 records to the table borrower
INSERT INTO borrower(borrower_name,book_id) VALUES
('John',1),
('Mary',2),
('Peter',3),
('James',4),
('Sarah',5),
('John',6),
('Mary',7),
('Peter',8),
('Jane',9),
('James',10);
--create a table called author with the following fields author_id,author_name,book_id and set author_id as a primary key and set author_id as an auto increment
CREATE TABLE author(
author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR(30) NOT NULL,
book_id INT NOT NULL
);
--add 10 records to the table author
INSERT INTO author(author_name,book_id) VALUES
('Paulo Coelho',1),
('Eckhart Tolle',2),
('Robert Greene',3),
('Gary Chapman',4),
('Timothy Ferriss',5),
('Timothy Ferriss',6),
('Timothy Ferriss',7),
('Timothy Ferriss',8),
('Timothy Ferriss',9),
('Gary Chapman',10);
--create a table called publisher with the following fields publisher_id,publisher_name,book_id and set publisher_id as a primary key and set publisher_id as an auto increment
CREATE TABLE publisher(
publisher_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
publisher_name VARCHAR(30) NOT NULL,
book_id INT NOT NULL
);
--add 10 records to the table publisher
INSERT INTO publisher(publisher_name,book_id) VALUES
('Harper Collins',1),
('New World Library',2),
('Penguin Books',3),
('Northfield Publishing',4),
('Crown Business',5),
('Crown Business',6),
('Crown Business',7),
('Crown Business',8),
('Crown Business',9),
('Northfield Publishing',10);