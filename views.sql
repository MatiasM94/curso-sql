USE medical_clinic;

CREATE OR REPLACE VIEW patients_personal_information AS
	(SELECT first_name AS nombre, last_name as apellido, document_type, document_number, number_healt_insurance AS seguro_medico 
    FROM patients);
    
SELECT * FROM patients_personal_information;

CREATE OR REPLACE VIEW patients_treatments_history AS
	(SELECT patients.first_name, patients.last_name, patients.document_type, patients.document_number, medical_history.medical_treatment
    FROM medical_history
    INNER JOIN patients ON medical_history.patient_id = patients.id);
    
SELECT * FROM patients_treatments_history;

CREATE OR REPLACE VIEW medical_specialitys AS
	(SELECT medics.first_name, medics.last_name, medical_speciality.medical_area, medical_speciality.speciality, medics.medical_license
    FROM medics
    INNER JOIN medical_speciality ON medics.speciality_id = medical_speciality.id);

SELECT * FROM medical_specialitys;

CREATE OR REPLACE VIEW medical_shift_info AS
	(SELECT medical_shift.shift_date, medical_shift.place, patients.first_name, patients.last_name, medics.first_name AS medic_name, medics.last_name AS medic_last_name
    FROM medical_shift
    INNER JOIN patients ON medical_shift.patient_id = patients.id
    INNER JOIN medics ON medical_shift.medic_id = medics.id);

SELECT * FROM medical_shift_info;

CREATE OR REPLACE VIEW patients_consultations_history AS
	(SELECT patients.first_name, patients.last_name, patients.document_type, patients.document_number, medical_history.medical_consultations
    FROM medical_history
    INNER JOIN patients ON medical_history.patient_id = patients.id);
    
SELECT * FROM patients_consultations_history;