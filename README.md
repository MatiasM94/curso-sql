# Este Repositorio incluira los archivos .sql de mi proyecto creado para el curso sql dictado por coderhouse.

## Inserción de datos con importación de archivos .csv

Para una correcta inserción de datos hay que seguir el siguiente orden(los archivos se encuentran en la carpeta csv).

### 1. Importar en la tabla parients el archivo **parients.csv**

> Revisar que la Dest column **number_health_insurance** tenga correctamente su dato(en ocasiones phone_number es default en esta columna).

### 2. Importar en la tabla medical_history el archivo **medical_history.csv**

### 3. Importar en la tabla medical_speciality el archivo **medical_history.csv**

### 4. Importar en la tabla medics el archivo **medics.csv**

### 5. Importar en la tabla medical_shift el archivo **medical_shift.csv**

## Ejemplo de consultas de datos

Una vez realizado las importaciones, puede realizar consultas como la siguiente:

```
SELECT medical_shift.shift_date, patients.first_name AS patient, medics.first_name AS medic
FROM medical_shift
INNER JOIN patients ON medical_shift.patient_id = patients.id
INNER JOIN medics ON medical_shift.medic_id = medics.id;
```
