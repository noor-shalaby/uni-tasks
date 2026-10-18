-- Case Study #1: Hospital
CREATE DATABASE Hospital;
USE Hospital;


CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age TINYINT NOT NULL,
    Gender CHAR(1) NOT NULL
);


CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Specialization VARCHAR(255) NOT NULL
);


CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATETIME NOT NULL,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);


CREATE TABLE Treatments (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    Description TEXT,
    Cost DECIMAL(8, 2) NOT NULL,
    
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);


INSERT INTO Patients (PatientID, Name, Age, Gender) VALUES 
(1, 'James Wilson', 30, 'M'),
(2, 'Mary Johnson', 26, 'F'),
(3, 'Robert Miller', 40, 'M'),
(4, 'Emily Davis', 5, 'F'),
(5, 'Michael Brown', 30, 'M');

INSERT INTO Doctors (DoctorID, Name, Specialization) VALUES 
(1, 'Dr. Sarah Adams', 'Emergency Medic'),
(2, 'Dr. David Clark', 'Pediatrician'),
(3, 'Dr. Susan Wright', 'Orthopedic Surgeon'),
(4, 'Dr. Mark Thompson', 'Cardiothoracic Surgeon'),
(5, 'Dr. Karen Hill', 'Anesthesiologist');

INSERT INTO Appointments (AppointmentID, Date, PatientID, DoctorID) VALUES 
(1, '2026-04-01', 1, 1),
(2, '2026-04-03', 2, 2),
(3, '2026-04-05', 3, 3),
(4, '2026-04-07', 4, 4),
(5, '2026-04-09', 5, 5);

INSERT INTO Treatments (TreatmentID, AppointmentID, Description, Cost) VALUES 
(1, 1, 'General Consultation', 50.00),
(2, 2, 'Pediatric Checkup', 40.00),
(3, 3, 'Prosthetic Fitting', 500.00),
(4, 4, 'Heart Valve Screening', 300.00),
(5, 5, 'Pre-op Anesthesia Prep', 150.00);


-- Queries for Case Study #1
SELECT * FROM Patients;
SELECT Name, Specialization FROM Doctors;
SELECT * FROM Patients WHERE Age > 25;
SELECT DISTINCT Specialization FROM Doctors;
SELECT * FROM Patients ORDER BY Age ASC;
SELECT * FROM Doctors ORDER BY Name DESC;
SELECT * FROM Treatments ORDER BY Cost;


UPDATE Doctors SET Specialization = 'Prosthetics Specialist' WHERE DoctorID = 3;
UPDATE Patients SET Age = 27 WHERE PatientID = 1;

DELETE FROM Treatments WHERE TreatmentID = 5;
DELETE FROM Appointments WHERE PatientID = 5;
DELETE FROM Patients WHERE PatientID = 5;
DELETE FROM Treatments WHERE TreatmentID = 2;



-- Case Study #2: Pharmacy
CREATE DATABASE Pharmacy;
USE Pharmacy;


CREATE TABLE Medicines (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(255) NOT NULL,
    Price DECIMAL(8, 2) NOT NULL,
    Quantity INT NOT NULL
);


CREATE TABLE Pharmacists (
    PharmacistID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    PhoneNumber CHAR(11) NOT NULL
);


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age TINYINT NOT NULL
);


CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineID INT NOT NULL,
    CustomerID INT NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Medicines (MedicineID, MedicineName, Price, Quantity) VALUES 
(1, 'Panadol Advance', 25.50, 100),
(2, 'Augmentin 1g', 120.00, 50),
(3, 'Ozempic 1mg', 1500.00, 10),
(4, 'Atorvastatin 20mg', 85.75, 200),
(5, 'Controloc 40mg', 95.00, 75);

INSERT INTO Pharmacists (PharmacistID, Name, PhoneNumber) VALUES 
(1, 'Thomas Moore', '01012345678'),
(2, 'Karen Taylor', '01123456789'),
(3, 'Brian White', '01234567890'),
(4, 'Lisa Anderson', '01545678901'),
(5, 'Paul Harris', '01098765432');

INSERT INTO Customers (CustomerID, Name, Age) VALUES 
(1, 'Linda Harris', 15),
(2, 'Steven King', 15),
(3, 'Barbara Young', 35),
(4, 'Richard Scott', 38),
(5, 'Nancy Green', 36);

INSERT INTO Sales (SaleID, MedicineID, CustomerID, Date) VALUES 
(1, 1, 1, '2026-03-18'),
(2, 2, 2, '2026-03-19'),
(3, 3, 3, '2026-03-21'),
(4, 4, 4, '2026-03-23'),
(5, 5, 5, '2026-03-24');


-- Queries for Case Study #2
SELECT * FROM Medicines;
SELECT Name FROM Pharmacists;
SELECT * FROM Medicines ORDER BY Price;
SELECT DISTINCT MedicineName FROM Medicines;


UPDATE Medicines SET Quantity = 50 WHERE MedicineID = 1;

DELETE FROM Sales WHERE SaleID = 5;