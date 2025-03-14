CREATE DATABASE HospitalDB;
USE HospitalDB;

drop database HospitalDB; 

-- Patient Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Address TEXT
);

-- Doctor Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15)
);
-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
-- Insert 20 records into Patients table
INSERT INTO Patients (Name, Age, Gender, ContactNumber, Address) VALUES
('John Doe', 30, 'Male', '1234567890', 'New York'),
('Jane Smith', 28, 'Female', '2345678901', 'Los Angeles'),
('Alice Johnson', 35, 'Female', '3456789012', 'Chicago'),
('Bob Brown', 40, 'Male', '4567890123', 'Houston'),
('Charlie White', 50, 'Male', '5678901234', 'Phoenix'),
('David Black', 45, 'Male', '6789012345', 'Philadelphia'),
('Emma Wilson', 32, 'Female', '7890123456', 'San Antonio'),
('George Hall', 38, 'Male', '8901234567', 'San Diego'),
('Hannah King', 29, 'Female', '9012345678', 'Dallas'),
('Ian Wright', 33, 'Male', '0123456789', 'San Jose'),
('Jackie Lopez', 27, 'Female', '1112223333', 'Austin'),
('Kevin Martinez', 36, 'Male', '2223334444', 'Jacksonville'),
('Laura Davis', 31, 'Female', '3334445555', 'San Francisco'),
('Michael Scott', 42, 'Male', '4445556666', 'Indianapolis'),
('Nancy Clark', 47, 'Female', '5556667777', 'Columbus'),
('Olivia Lewis', 26, 'Female', '6667778888', 'Fort Worth'),
('Paul Adams', 55, 'Male', '7778889999', 'Charlotte'),
('Quincy Baker', 39, 'Male', '8889990000', 'Detroit'),
('Rachel Green', 29, 'Female', '9990001111', 'El Paso'),
('Steve Rogers', 41, 'Male', '0001112222', 'Memphis');

-- Insert 20 records into Doctors table
INSERT INTO Doctors (Name, Specialization, ContactNumber) VALUES
('Dr. James', 'Cardiologist', '1111111111'),
('Dr. Maria', 'Dermatologist', '2222222222'),
('Dr. Henry', 'Neurologist', '3333333333'),
('Dr. Emma', 'Orthopedic', '4444444444'),
('Dr. Robert', 'Pediatrician', '5555555555'),
('Dr. Lucy', 'Dentist', '6666666666'),
('Dr. William', 'Surgeon', '7777777777'),
('Dr. Sophia', 'Gynecologist', '8888888888'),
('Dr. Jack', 'ENT Specialist', '9999999999'),
('Dr. Oliver', 'Oncologist', '1010101010'),
('Dr. Edward', 'Cardiologist', '1110001110'),
('Dr. Ava', 'Psychiatrist', '1212121212'),
('Dr. Mia', 'Endocrinologist', '1313131313'),
('Dr. Liam', 'Urologist', '1414141414'),
('Dr. Noah', 'Nephrologist', '1515151515'),
('Dr. Amelia', 'Hematologist', '1616161616'),
('Dr. Ethan', 'Anesthesiologist', '1717171717'),
('Dr. Lucas', 'Radiologist', '1818181818'),
('Dr. Benjamin', 'Gastroenterologist', '1919191919'),
('Dr. Charlotte', 'Pulmonologist', '2020202020');

-- Insert 20 records into Appointments table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, '2025-01-10', 'Completed'),
(2, 2, '2025-01-15', 'Pending'),
(3, 3, '2025-01-18', 'Completed'),
(4, 4, '2025-01-20', 'Cancelled'),
(5, 5, '2025-01-22', 'Pending'),
(6, 6, '2025-01-25', 'Completed'),
(7, 7, '2025-01-28', 'Completed'),
(8, 8, '2025-02-01', 'Pending'),
(9, 9, '2025-02-05', 'Completed'),
(10, 10, '2025-02-10', 'Cancelled'),
(11, 11, '2025-02-12', 'Pending'),
(12, 12, '2025-02-15', 'Completed'),
(13, 13, '2025-02-18', 'Completed'),
(14, 14, '2025-02-20', 'Cancelled'),
(15, 15, '2025-02-22', 'Pending'),
(16, 16, '2025-02-25', 'Completed'),
(17, 17, '2025-02-28', 'Completed'),
(18, 18, '2025-03-01', 'Pending'),
(19, 19, '2025-03-05', 'Completed'),
(20, 20, '2025-03-10', 'Cancelled');

-- Fetch all patients
SELECT * FROM Patients;

-- Fetch all doctors
SELECT * FROM Doctors;

-- Count total patients
SELECT COUNT(*) AS TotalPatients FROM Patients;

-- Find average age of patients
SELECT AVG(Age) AS AverageAge FROM Patients;

-- List all unique names from Patients and Doctors
SELECT Name FROM Patients
UNION
SELECT Name FROM Doctors;
-- Find patients whose names start with 'J'
SELECT * FROM Patients WHERE Name LIKE 'J%';

-- Find patients between ages 30 and 40
SELECT * FROM Patients WHERE Age BETWEEN 30 AND 40;
-- Inner Join (Patients with Appointments)
SELECT Patients.Name, Appointments.AppointmentDate, Appointments.Status
FROM Patients
INNER JOIN Appointments ON Patients.PatientID = Appointments.PatientID;

-- Left Join (All Patients, even those without appointments)
SELECT Patients.Name, Appointments.AppointmentDate, Appointments.Status
FROM Patients
LEFT JOIN Appointments ON Patients.PatientID = Appointments.PatientID;

-- Right Join (All Appointments, even if patient details are missing)
SELECT Patients.Name, Appointments.AppointmentDate, Appointments.Status
FROM Patients
RIGHT JOIN Appointments ON Patients.PatientID = Appointments.PatientID;

