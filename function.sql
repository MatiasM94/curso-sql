DELIMITER $$

CREATE FUNCTION calcular_dias_restantes(turno_fecha DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE dias_restantes INT;

    SET dias_restantes = DATEDIFF(turno_fecha, CURDATE());

    IF dias_restantes < 0 THEN
        SET dias_restantes = 0;
    END IF;

    RETURN dias_restantes;
END$$

DELIMITER ;

SELECT calcular_dias_restantes('2023-11-20') AS dias_restantes;

DELIMITER $$
CREATE FUNCTION medic_with_more_patients(id_medic_con_mas_pacientes INT) RETURNS VARCHAR(50)
READS SQL DATA
BEGIN
    DECLARE medic_con_mas_pacientes INT;
    DECLARE medic_name VARCHAR(50);
    DECLARE medic_last_name VARCHAR(50);

    SELECT first_name, last_name INTO medic_name, medic_last_name
    FROM medics
    WHERE id = id_medic_con_mas_pacientes;

    RETURN concat(medic_name," ",medic_last_name);
END$$

DELIMITER ;

SELECT medic_with_more_patients(medic_id), COUNT(*) FROM medical_shift GROUP BY medic_id ORDER BY COUNT(*) DESC LIMIT 1;

