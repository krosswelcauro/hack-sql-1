create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table roles(
  id_role serial primary key,
  name varchar(50) not null  
);

create table taxes(
  id_tax serial primary key,
  percentage float not null
);

create table offers(
  id_offer serial primary key,
  status BOOLEAN
);

create table discounts(
  id_discount serial primary key,
  status BOOLEAN,
  percentage float not null
);

create table payments(
  id_payment serial primary key,
  type VARCHAR(50) not null
);

create table customers(
  email VARCHAR(80) primary key,
  id_country INTEGER not null,
  id_role INTEGER not null,
  name varchar(50) not null,
  age INTEGER not NULL,
  password VARCHAR(50),
  physical_address VARCHAR(100),
  foreign key (id_country) references countries (id_country),
  foreign key (id_role) references roles (id_role)
);

create table invoice_status(
  id_invoice_status serial primary key,
  status BOOLEAN
);

create table products(
  id_product serial primary key,
  id_discount INTEGER not NULL,
  id_offer INTEGER not NULL,
  id_tax INTEGER not NULL,
  name varchar(50) not null,
  details varchar(150),
  minimum_stock INTEGER not null,
  maximum_stock INTEGER not null,
  current_stock INTEGER not null,
  price float NOT null,
  price_with_tax float,
  
  foreign key (id_discount) references discounts (id_discount),
  foreign key (id_offer) references offers (id_offer),
  foreign key (id_tax) references taxes (id_tax)
);

CREATE table product_customers(
  id_product INTEGER not NULL,
  id_customer VARCHAR(80) not NULL,
  foreign key (id_product) references products (id_product),
  foreign key (id_customer) references customers (email)
);

CREATE table invoices(
  id_invoice serial PRIMARY KEY,
  id_customer VARCHAR(80) not NULL,
  id_payment INTEGER NOT NULL,
  id_invoice_status INTEGER NOT NULL,
  date date,
  total_to_pay FLOAT NOT NULL,
  
  foreign key (id_customer) references customers (email),
  foreign key (id_payment) references payments (id_payment),
  foreign key (id_invoice_status) references invoice_status (id_invoice_status)
);

CREATE TABLE orders (
  id_order serial PRIMARY key,
  id_invoice  INTEGER NOT NULL,
  id_product  INTEGER NOT NULL,
  details VARCHAR(100),
  amount FLOAT,
  price FLOAT,
  
  foreign key (id_invoice) references invoices (id_invoice),
  foreign key (id_product) references products (id_product)
);