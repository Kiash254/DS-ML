-- create table called karatina library  to hold the borrower,book,author,publisher 
create table karatina_library(
    borrower varchar(50) primary key,
    book varchar(50),
    author varchar(50),
    publisher varchar(50)
);
--insert data into the table
insert into karatina_library values('admin', 'admin', 'admin', 'admin');
insert into karatina_library values('user', 'user', 'user', 'user');
insert into karatina_library values('guest', 'guest', 'guest', 'guest');
insert into karatina_library values('vin', 'kip', 'che', 'by');
