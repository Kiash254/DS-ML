--create a table called shipping with shipping id,company name and phone
create table shipping
(
shipping_id int not null,
company_name varchar(50) not null,
phone varchar(50) not null,
primary key (shipping_id)
);

--create table called orders with order id customer id employer id orderdate,required date, shipping date,shipvia,freight,shipname,shipaddress,shipcity, shipregion,shippostalcode,shipcountry

create table orders
(
order_id int not null,
customer_id varchar(50) not null,
employee_id int not null,
order_date datetime not null,
required_date datetime not null,
shipped_date datetime not null,
ship_via int not null,
freight decimal(10,2) not null,
ship_name varchar(50) not null,
ship_address varchar(50) not null,
ship_city varchar(50) not null,
ship_region varchar(50) not null,
ship_postal_code varchar(50) not null,
ship_country varchar(50) not null,
primary key (order_id)
);
--create a table called employee with employer id last name,firstname,title, title of courtesy, birthdate, hiredate,address,city,region,postal code,country,home phone,extension,photo,notes,reports to,photo path
create table employee
(
employee_id int not null,
last_name varchar(50) not null,
first_name varchar(50) not null,
title varchar(50) not null,
title_of_courtesy varchar(50) not null,
birth_date datetime not null,
hire_date datetime not null,
address varchar(50) not null,
city varchar(50) not null,
region varchar(50) not null,
postal_code varchar(50) not null,
country varchar(50) not null,
home_phone varchar(50) not null,
extension varchar(50) not null,
photo varchar(50) not null,
notes varchar(50) not null,
reports_to int not null,
photo_path varchar(50) not null,
primary key (employee_id)
);
--create a table called customer with customer id,company name,contact name,contact title,address,city,region,postal code,country,phone,fax
create table customer
(
customer_id varchar(50) not null,
company_name varchar(50) not null,
contact_name varchar(50) not null,
contact_title varchar(50) not null,
address varchar(50) not null,
city varchar(50) not null,
region varchar(50) not null,
postal_code varchar(50) not null,
country varchar(50) not null,
phone varchar(50) not null,
fax varchar(50) not null,
primary key (customer_id)
);
--create a table called category with category id,category name,description,picture
create table category
(
category_id int not null,
category_name varchar(50) not null,
description varchar(50) not null,
picture varchar(50) not null,
primary key (category_id)
);
--create a table called employee_territory with employee id,territory id
create table employee_territory
(
employee_id int not null,
territory_id varchar(50) not null,
primary key (employee_id)
);
--create a table called territory with territory id,territory description,region id
create table territory
(
territory_id varchar(50) not null,
territory_description varchar(50) not null,
region_id int not null,
primary key (territory_id)
);

--create a table called order details with order id,product id,unit price,quantity,discount
create table order_details
(
order_id int not null,
product_id int not null,
unit_price decimal(10,2) not null,

quantity int not null,
discount decimal(10,2) not null,
primary key (order_id)
);
--creata a table called region with region id,region description
create table region
(
region_id int not null,
region_description varchar(50) not null,
primary key (region_id)
);
--create a table called supplier with supplier id,company name,contact name,contact title,address,city,region,postal code,country,phone,fax,home page
create table supplier
(
supplier_id int not null,
company_name varchar(50) not null,
contact_name varchar(50) not null,
contact_title varchar(50) not null,
address varchar(50) not null,
city varchar(50) not null,
region varchar(50) not null,
postal_code varchar(50) not null,
country varchar(50) not null,
phone varchar(50) not null,
fax varchar(50) not null,
home_page varchar(50) not null,
primary key (supplier_id)
);

--create a table called product with product id,product name,supplier id,category id,quantity per unit,unit price,units in stock,units on order,reorder level,discontinued
create table product
(
product_id int not null,
product_name varchar(50) not null,
supplier_id int not null,
category_id int not null,
quantity_per_unit varchar(50) not null,
unit_price decimal(10,2) not null,
units_in_stock int not null,
units_on_order int not null,
reorder_level int not null,
discontinued int not null,
primary key (product_id)
);

--create a table called customer customer demo with customer id,customer type id
create table customer_customer_demo
(
customer_id varchar(50) not null,
customer_type_id varchar(50) not null,
primary key (customer_id)
);
--create a table called customer demography with customer type id,customer desc
create table customer_demography
(
customer_type_id varchar(50) not null,
customer_desc varchar(50) not null,
primary key (customer_type_id)
);

