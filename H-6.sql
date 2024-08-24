insert into countries (name) values ('argentina') , ('colombia'),('chile');
select * from countries;

insert into roles (name) values ('admin'),('seller'),('client');
select * from roles;

insert into taxes (percentage) values (16),(12),(10);
select * from taxes;

insert into  offers (status) values ('false'),('true');
select * from offers;

insert into  discounts (status, percentage) values ('true', 10),('true', 5), ('true', 15);
select * from discounts;

insert into  payments (type) values ('efectivo'),('tarjeta de credito'),('pago movil');
select * from payments;

insert into  customers (email, id_country, id_role, name, age, password, physical_address) values 
('alfa@correo.com', 1, 1, 'alfa', 28, 'alfa123', 'av alfa calle azul'),
('delta@correo.com', 2, 2, 'delta', 25, 'delta123', 'av delta calle amarillo'),
('bravo@correo.com', 3, 3, 'bravo', 22, 'bravo123', 'av bravo calle gris');
select * from customers;

INSERT into invoice_status (status) VALUES ('true'),('false');
select * from invoice_status;

INSERT into products (id_discount, id_offer, id_tax, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax) VALUES 
(1, 2, 1, 'computador', 'pc gamer', 1, 100, 80, 15.5, 16),
(2, 2, 1, 'equipo de sonido', 'samsumg', 1, 200, 150, 12, 16),
(3, 2, 1, 'televisor', 'lg', 1, 100, 70, 12, 16);
select * from products;

INSERT INTO product_customers (id_product, id_customer) VALUES (1, 'alfa@correo.com'), (2, 'delta@correo.com'), (3, 'bravo@correo.com');
select * from product_customers;

INSERT into invoices (id_customer, id_payment, id_invoice_status, date, total_to_pay) VALUES
('alfa@correo.com', 1, 1, '2024-08-24', 1),
('delta@correo.com', 2, 1, '2024-08-20', 2),
('bravo@correo.com', 3, 1, '2024-08-15', 1);
select * from invoices;

INSERT into orders (id_invoice, id_product, details, amount, price) VALUES 
(1, 1, 'Lorem Ipsum is simply dummy', 20, 33.3),
(2, 2, 'Lorem Ipsum is simply dummy', 20, 28.5),
(3, 3, 'Lorem Ipsum is simply dummy', 20, 28.5);
select * from orders;

-- Tuve que elimnar en cascada para poder eliminar el primer customer
DELETE from product_customers WHERE id_customer = 'alfa@correo.com';
select * from product_customers;
DELETE from orders WHERE id_invoice = 1;
select * from orders;
DELETE from invoices WHERE id_customer = 'alfa@correo.com';
select * from invoices;
DELETE from customers WHERE email = 'alfa@correo.com';
select * from customers;

update customers set name = 'bravooo', age = 25 where email = 'bravo@correo.com';
update taxes set percentage = 17 where id_tax = 1;
update taxes set percentage = 13 where id_tax = 2;
update taxes set percentage = 11 where id_tax = 3;
update products set price = 16 where id_product = 1;
update products set price = 13 where id_product = 2;
update products set price = 13 where id_product = 3;

-- Many To Many: esta tabla ya fue creada en el hack 5
create table products_customers (
    id_customer integer,
    id_product integer,
    foreign key (id_customer) references customers (id_customer),
    foreign key (id_product) references products (id_product),
    PRIMARY KEY (id_customer, id_product)
);