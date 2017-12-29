
CREATE DATABASE BITACORADIGITAL;
USE BITACORADIGITAL;

CREATE TABLE PERSONA(
    personaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    primerApellido VARCHAR(200),
    segundoApellido VARCHAR(200),
    acronimo VARCHAR(200),
    PRIMARY KEY (personaID)
)Engine=InnoDB;

CREATE TABLE USUARIO(
    usuarioID INT NOT NULL auto_increment,
    nombreUsuario VARCHAR(200),
    contrasena VARCHAR(200),
    email VARCHAR(200),
    f_personaID INT,
    FOREIGN KEY  (f_personaID) REFERENCES PERSONA(personaID),
    PRIMARY KEY (usuarioID)
)Engine=InnoDB;

CREATE TABLE GIRA(
    giraID INT NOT NULL auto_increment,
    fecha DATE,
    nombre VARCHAR(200),
    PRIMARY KEY (giraID)
)Engine=InnoDB;
CREATE TABLE RECOLECTA(
    recolectaID INT NOT NULL auto_increment,
    zonaVida VARCHAR(200),
    coberturaTierra VARCHAR(200),
    fuente VARCHAR(100),
    fechaRecoleccion DATE,
    f_personaID INT,
    f_giraID INT,
    FOREIGN KEY (f_personaID) REFERENCES PERSONA(personaID),
    FOREIGN KEY (f_giraID) REFERENCES GIRA(giraID),
    PRIMARY KEY (recolectaID)
)Engine=InnoDB;
CREATE TABLE MUESTRABITACORA(
    muestraBitacoraID INT NOT NULL auto_increment,
    fecha DATE,
    f_recolectaID INT,
    f_especieID INT,
    FOREIGN KEY (f_recolectaID) REFERENCES RECOLECTA(recolectaID),
    FOREIGN KEY (f_especieID) REFERENCES ESPECIE(especieID),
    PRIMARY KEY (muestraBitacoraID)
)Engine=InnoDB;

CREATE TABLE IMAGENBITACORA(
    imagenBitacoraID INT NOT NULL auto_increment,
    imagenURL VARCHAR(200),
    f_muestraBitacoraID INT,
    FOREIGN KEY (f_muestraBitacoraID) REFERENCES MUESTRABITACORA(muestraBitacoraID),
    PRIMARY KEY (imagenBitacoraID)
)Engine=InnoDB;

CREATE TABLE UBICACIONGPSBITACORA(
    ubicaciongGpsBitacoraID INT NOT NULL auto_increment,
    latitud VARCHAR(100),
    longitud VARCHAR(100),
    f_muestraBitacoraID INT,
    FOREIGN KEY (f_muestraBitacoraID) REFERENCES MUESTRABITACORA(muestraBitacoraID),
    PRIMARY KEY (ubicaciongGpsID)
)Engine=InnoDB;
