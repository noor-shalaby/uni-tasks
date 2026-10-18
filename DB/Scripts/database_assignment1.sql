-- The First Database: world_one
CREATE DATABASE restaurant;
USE restaurant;


CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	role VARCHAR(255) NOT NULL,
	phone CHAR(11) UNIQUE NOT NULL,
	hire_date DATE NOT NULL,
	salary DECIMAL NOT NULL
);


CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	phone CHAR(11) UNIQUE NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	loyalty_points INT
);


CREATE TABLE menu (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	description TEXT,
	category VARCHAR(255) NOT NULL,
	price DECIMAL(5, 2) NOT NULL
);


CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
	customer_id INT NOT NULL,
	order_datetime TIMESTAMP,
	order_price DECIMAL NOT NULL,
	status VARCHAR(9) NOT NULL,
	
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);


CREATE TABLE order_items (
	order_item_id INT AUTO_INCREMENT PRIMARY KEY,
	order_id INT NOT NULL,
	dish_id INT NOT NULL,
	quantity INT DEFAULT 1,
	
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (dish_id) REFERENCES menu(id)
);



-- The Second Database: world_two
CREATE DATABASE university;
USE university;


CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	gpa DECIMAL(3, 2) CHECK (gpa BETWEEN 0.00 AND 4.00)
);


CREATE TABLE teachers (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age TINYINT NOT NULL,
	salary DECIMAL NOT NULL
);


CREATE TABLE classes (
	code CHAR(6) PRIMARY KEY,
	title VARCHAR(255) UNIQUE NOT NULL
);



-- The Third Database: world_three
CREATE DATABASE zoo;
USE zoo;


CREATE TABLE animals (
	name VARCHAR(255) UNIQUE NOT NULL,
	type VARCHAR(255) NOT NULL,
	location VARCHAR(255) DEFAULT 'Africa'
);


CREATE TABLE birds (
	name VARCHAR(255) UNIQUE NOT NULL,
	type VARCHAR(255) NOT NULL,
	location VARCHAR(255) DEFAULT 'Africa'
);