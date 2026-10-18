-- Case Study #1: Hospital
CREATE DATABASE hospital;
USE hospital;


CREATE TABLE patients (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age TINYINT NOT NULL,
	gender CHAR(1) NOT NULL
);


CREATE TABLE doctors (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	specialization VARCHAR(255) NOT NULL
);


CREATE TABLE appointments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	patient_id INT,
    doctor_id INT,
	
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE SET NULL,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE SET NULL
);


CREATE TABLE treatments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	appointment_id INT,
	description TEXT,
	cost DECIMAL(8, 2) NOT NULL,
	
	FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE SET NULL
);


INSERT INTO patients (id, name, age, gender) VALUES
(1, 'Maes Hughes', 30, 'M'),
(2, 'Trisha Elric', 26, 'F'),
(3, 'Van Hohenheim', 40, 'M'),
(4, 'Nina Tucker', 5, 'F'),
(5, 'Solf J. Kimblee', 30, 'M');

INSERT INTO doctors (id, name, specialization) VALUES
(1, 'Edward Elric', 'Emergency Medic'),
(2, 'Alphonse Elric', 'Pediatrician'),
(3, 'Winry Rockbell', 'Orthopedic Surgeon'),
(4, 'Roy Mustang', 'Cardiothoracic Surgeon'),
(5, 'Riza Hawkeye', 'Anesthesiologist');

INSERT INTO appointments (id, date_time, patient_id, doctor_id) VALUES
(1, '2026-04-01', 1, 1),
(2, '2026-04-03', 2, 2),
(3, '2026-04-05', 3, 3),
(4, '2026-04-07', 4, 4),
(5, '2026-04-09', 5, 5);

INSERT INTO treatments (id, appointment_id, description, cost) VALUES
(1, 1, 'General Consultation', 50.00),
(2, 2, 'Pediatric Checkup', 40.00),
(3, 3, 'Prosthetic Fitting', 500.00),
(4, 4, 'Heart Valve Screening', 300.00),
(5, 5, 'Pre-op Anesthesia Prep', 150.00);

SELECT * FROM patients;
SELECT name, specialization FROM doctors;
SELECT * FROM patients WHERE age > 24;
SELECT DISTINCT specialization FROM doctors;
SELECT * FROM patients ORDER BY age ASC;
SELECT * FROM doctors ORDER BY name DESC;
SELECT * FROM treatments ORDER BY cost;


UPDATE doctors SET specialization = 'Prosthetics Specialist' WHERE id = 3;
UPDATE patients SET age = 28 WHERE id = 1;

DELETE FROM patients WHERE id = 5;
DELETE FROM treatments WHERE id = 2;



-- Case Study #2: Pharmacy
CREATE DATABASE pharmacy;
USE pharmacy;


CREATE TABLE medicines (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	price DECIMAL(8, 2) NOT NULL,
	quantity INT NOT NULL
);


CREATE TABLE pharmacists (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	phone CHAR(11) NOT NULL
);


CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age TINYINT NOT NULL
);


CREATE TABLE sales (
	id INT AUTO_INCREMENT PRIMARY KEY,
	medicine_id INT,
	customer_id INT,
	date DATE NOT NULL,
	
	FOREIGN KEY (medicine_id) REFERENCES medicines(id) ON DELETE SET NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);


INSERT INTO medicines (id, name, price, quantity) VALUES
(1, 'Panadol Advance', 25.50, 100),
(2, 'Augmentin 1g', 120.00, 50),
(3, 'Ozempic 1mg', 1500.00, 10),
(4, 'Atorvastatin 20mg', 85.75, 200),
(5, 'Controloc 40mg', 95.00, 75);

INSERT INTO pharmacists (id, name, phone) VALUES
(1, 'Roy Mustang', '01012345678'),
(2, 'Riza Hawkeye', '01123456789'),
(3, 'Jean Havoc', '01234567890'),
(4, 'Heymans Breda', '01545678901'),
(5, 'Vato Falman', '01098765432');

INSERT INTO customers (id, name, age) VALUES
(1, 'Ling Yao', 15),
(2, 'Lan Fan', 15),
(3, 'Olivier Mira Armstrong', 35),
(4, 'Alex Louis Armstrong', 38),
(5, 'Izumi Curtis', 36);

INSERT INTO sales (id, medicine_id, customer_id, date) VALUES
(1, 1, 1, '2026-03-18'),
(2, 2, 2, '2026-03-19'),
(3, 3, 3, '2026-03-21'),
(4, 4, 4, '2026-03-23'),
(5, 5, 5, '2026-03-24');


SELECT * FROM medicines;
SELECT name FROM pharmacists;
SELECT * FROM medicines ORDER BY price;
SELECT DISTINCT name FROM medicines;


UPDATE medicines SET quantity = 50 WHERE id = 1;

DELETE FROM sales WHERE id = 5;