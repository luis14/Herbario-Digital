CREATE TABLE BITACORA(
    bitacoraID INT NOT NULL auto_increment,
    nombreComun VARCHAR(200),
    nombreCientifico VARCHAR(200),
    fecha DATE,
    lugar VARCHAR(2000),
    observacionFuste VARCHAR(2000),
    observacionHoja VARCHAR(2000),
    observacionSemilla VARCHAR(2000),
    observacionFlor VARCHAR(2000),
    observacionExtra VARCHAR(2000),
    f_personaID INT,
    flagFavorito CHAR(1),
    FOREIGN KEY bitacora_persona(f_personaID) REFERENCES PERSONA(personaID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (bitacoraID)
)Engine=InnoDB;

CREATE TABLE FOTOPORBITACORA(
    FotoID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    urlServer VARCHAR(1000),
    descripcion VARCHAR(2000),
    f_bitacoraID INT,
    FOREIGN KEY fotoporbitacora_bitacora(f_bitacoraID) REFERENCES BITACORA(bitacoraID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (FotoID)
)Engine=InnoDB;

CREATE TABLE PERSONASXGIRA(
    personaID INT,
    giraID INT,
    FOREIGN KEY personaxgira_personaID(personaID) REFERENCES PERSONA(personaID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY personaxgira_giraID(piraID) REFERENCES GIRA(giraID) ON DELETE SET NULL ON UPDATE CASCADE,
)Engine=InnoDB;

DELIMITER $$
    CREATE PROCEDURE sp_Insertar_Bitacora(IN nombreComun_p VARCHAR(200), IN nombreCientifico_p VARCHAR(200), IN fecha_p DATE, IN lugar_p VARCHAR(200), 
    IN observacionFuste_p VARCHAR(200), IN observacionHoja_p VARCHAR(200), IN observacionSemilla_p VARCHAR(200), IN observacionFlor_p VARCHAR(200),
    IN observacionExtra_p VARCHAR(200), IN f_personaID_p INT, IN flagfavorito_p CHAR(1), OUT UltimoID INT)
    BEGIN
    INSERT INTO BITACORA(nombreComun,nombreCientifico,fecha,lugar,observacionFuste,observacionHoja,observacionSemilla,observacionFlor,observacionExtra,
    f_personaID,flagFavorito)
    VALUES(nombreComun_p, nombreCientifico_p, fecha_p, lugar_p, observacionFuste_p, observacionHoja_p, observacionSemilla_p, observacionFlor_p,
    observacionExtra_p, f_personaID_p, flagfavorito_p);
    SET UltimoID = LAST_INSERT_ID();
    END $$
DELIMITER ;

DELIMITER $$
    CREATE PROCEDURE sp_Insertar_FOTOPORBITACORA(IN nombre_p VARCHAR(200), IN urlServer_p VARCHAR(1000),IN descripcion_p VARCHAR(2000), IN f_bitacoraID_p VARCHAR(200))
    BEGIN
    INSERT INTO FOTOPORBITACORA(nombre,urlServer,descripcion,f_bitacoraID)
    VALUES(nombre_p, urlServer_p, descripcion_p, f_bitacoraID_p);
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_Get_InfoBitacora()
BEGIN
SELECT nombreComun,nombreCientifico,fecha,lugar,observacionFuste,observacionHoja,observacionSemilla,observacionFlor,observacionExtra,flagFavorito,
urlServer,descripcion
FROM BITACORA
INNER JOIN FOTOPORBITACORA ON BITACORA.bitacoraID = FOTOPORBITACORA.f_bitacoraID
END $$
DELIMITER ;