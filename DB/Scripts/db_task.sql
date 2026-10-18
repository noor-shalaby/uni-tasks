create database pharma;
use pharma;

create table medicine (
    drug_code int primary key,
    drug_title varchar(255) not null,
    unit_price decimal(5, 2),
    stock_count int
);

create table pharmacists (
    worker_id int primary key,
    worker_fullname varchar(255) not null,
    contact_phone varchar(13) unique
);

create table customers (
    client_id int primary key,
    client_fullname varchar(255) not null,
    client_age int
);

create table sales (
    invoice_id int primary key,
    drug_code int,
    client_id int,
    invoice_date date default "2026-01-02",
    
    foreign key (drug_code) references medicine (drug_code),
	foreign key (client_id) references customers (client_id)
);

alter table sales add
foreign key (drug_code) references medicine (drug_code),
add foreign key (client_id) references customers (client_id);

insert into medicine values
(1, "Aspirin", 17.50, 130),
(2, "Panadol", 65.75, 100),
(3, "Zinctron", 25.50, 220),
(4, "Comtrex", 67.00, 170),
(5, "Milga", 99.99, 250);

insert into pharmacists values
(1, "Ahmed Mohamed", "+201113141161"),
(2, "Sama Ali", "+201227224223"),
(3, "Mohamed Khaled", "+201363359333"),
(4, "Sara Ashraf", "+201448424144"),
(5, "Youssef Hussein", "+201565545545");

insert into customers values
(1, "Karim Mohamed", 28),
(2, "Nour Ahmed", 34),
(3, "Mona Mahmoud", 19),
(4, "Tarek Tarek", 45),
(5, "Reem Samir", 23);

insert into sales(invoice_id, drug_code, client_id) values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

select * from medicine;
select * from pharmacists;
select * from customers;
select * from sales;

select * from medicine order by unit_price asc;

delete from sales where client_id = 305;
delete from medicine where drug_code = 105;
delete from customers where client_id = 305;