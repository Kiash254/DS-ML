--create a database holding students and their grades and names
--create a table holding students and their grades and names

create table students(
    id int primary key,
    name varchar(50),
    grade int
);

--insert data into the table
insert into students values(1, 'John', 90);
insert into students values(2, 'Mary', 80);
insert into students values(3, 'Peter', 70);
insert into students values(4, 'Jane', 60);
insert into students values(5, 'Bob', 50);
insert into students values(6, 'Alice', 40);

--add a column to the table to hold the average grade of the student
alter table students add average_grade int;


--delete a column students tables

--update the average grade of the student
update students set average_grade = (grade + 10) / 2;
--and add data to the new column
update students set average_grade = 50 where id = 6;


--create a table called security to hold the username and password of the user
create table security(
    username varchar(50) primary key,
    password varchar(50)
);

--insert data into the table
insert into security values('admin', 'admin');
insert into security values('user', 'user');
insert into security values('guest', 'guest');

--create a table called user to hold the user's name and the user's role
create table user(
    name varchar(50) primary key,
    role varchar(50)
);
--create  tables employee and hold username,age,details,department,role,working hours and clossing time
create table employee(
    username varchar(50) primary key,
    age int,
    details varchar(50),
    department varchar(50),
    role varchar(50),
    working_hours int,
    closing_time int
);
--drop table employee;
--insert data into the table
insert into employee values('admin', 20, 'admin', 'admin', 'admin', 8, 5);
insert into employee values('user', 20, 'user', 'user', 'user', 8, 5);
insert into employee values('guest', 20, 'guest', 'guest', 'guest', 8, 5);
--add a column to the table to hold the sign in time of the user in employee table
alter table employee add sign_in_time int;
--insert data into the table of employee
insert into employee values('admin', 20, 'admin', 'admin', 'admin', 8, 5, 8);
insert into employee values('user', 20, 'user', 'user', 'user', 8, 5, 8);
insert into employee values('guest', 20, 'guest', 'guest', 'guest', 8, 5, 8);
--add a column to the table to hold the sign out time of the user in employee table
alter table employee add sign_out_time int;


