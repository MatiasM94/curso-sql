CREATE SCHEMA medical_clinic;
USE medical_clinic;

CREATE TABLE patients(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    document_type VARCHAR(10) NOT NULL,
    document_number INT NOT NULL UNIQUE,
    phone_number INT NOT NULL,
    number_healt_insurance INT UNIQUE,
    province varchar(100),
    city varchar(100),
    address_line varchar(100),
    cp varchar(20)
    );
    
CREATE TABLE medical_history(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    medical_consultations VARCHAR(200),
    medical_treatment VARCHAR(200),
    emergencies VARCHAR(200),
    patient_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE medical_speciality(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    medical_area VARCHAR(200) NOT NULL,
    speciality VARCHAR(200) NOT NULL
);

CREATE TABLE medics(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    document_type VARCHAR(10) NOT NULL,
    document_number INT NOT NULL UNIQUE,
    phone_number INT NOT NULL,
    address_line varchar(100),
    cp varchar(20),
    medical_license INT NOT NULL UNIQUE,
    speciality_id INT NOT NULL,
    FOREIGN KEY (speciality_id) REFERENCES medical_speciality(id)
);

CREATE TABLE medical_shift(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    shift_date DATE NOT NULL,
    place VARCHAR(200) NOT NULL,
    reason VARCHAR(200) NOT NULL,
    patient_id INT NOT NULL,
    medic_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (medic_id) REFERENCES medics(id)
);