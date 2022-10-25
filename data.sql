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
