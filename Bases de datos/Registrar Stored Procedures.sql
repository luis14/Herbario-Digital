DELIMITER $$
CREATE PROCEDURE sp_Insertar_PersonaUsuario(IN nombre_p VARCHAR(200), IN primerApellido_p VARCHAR(200), IN segundoApellido_p VARCHAR(200),IN contrasena_p VARCHAR(200), IN email_p VARCHAR(200))
BEGIN
INSERT INTO PERSONA(nombre,primerApellido,segundoApellido)
VALUES(nombre_p,primerApellido_p,segundoApellido_p);
SELECT @UltimoID := LAST_INSERT_ID();
CALL sp_Insertar_Usuario(contrasena_p,email_p,@UltimoID)
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_Insertar_Usuario(IN contrasena_p VARCHAR(200), IN email_p VARCHAR(200), IN personaID_p INT)
BEGIN
INSERT INTO USUARIO
VALUES(contrasena_p,email_p,personaID_p);
SELECT LAST_INSERT_ID();
END $$
DELIMITER ;

