CREATE DATABASE HERBARIODIGITAL;
/*
CREATE TABLE Vineyard (
    VineyardID smallint auto_increment,
    VineyardName VARCHAR(45) NOT NULL,
    FarmerID    smallint,
    GrapeID smallint,
    ComeFrom    varchar(45) NOT NULL,
    HarvestedAmount int,
    RipenessPercent int,
    PRIMARY KEY (VineyardID),
    FOREIGN KEY (FarmerID) REFERENCES Worker(WorkerID)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (GrapeID) REFERENCES Grape(GrapeID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
)Engine=InnoDB;

*/
USE HERBARIODIGITAL;

CREATE TABLE PROCEDENCIA(
    procedenciaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (procedenciaID)
)Engine=InnoDB;

CREATE TABLE GENERO(
    generoID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (generoID)
)Engine=InnoDB;

CREATE TABLE FAMILIA(
    familiaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (familiaID)
)Engine=InnoDB;

CREATE TABLE SAVIACOLOR(
    saviaColorID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (saviaColorID)
)Engine=InnoDB;

CREATE TABLE SAVIATEXTURA(
    saviaTexturaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (saviaTexturaID)
)Engine=InnoDB;

CREATE TABLE FORMAHOJA(
    formaHojaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (formaHojaID)
)Engine=InnoDB;

CREATE TABLE POSICIONHOJA(
    posicionHojaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (posicionHojaID)
)Engine=InnoDB;

CREATE TABLE UBICACION(
    ubicacionID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (ubicacionID)
)Engine=InnoDB;

CREATE TABLE FLORCOLOR(
    florColorID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (florColorID)
)Engine=InnoDB;
CREATE TABLE FLORSIMETRIA(
    florSimetriaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    PRIMARY KEY (florSimetriaID)
)Engine=InnoDB;
CREATE TABLE ESPECIE(
    especieID INT NOT NULL auto_increment,
    pubescencia VARCHAR(10),
    yemaFloral VARCHAR(10),
    nombreComun VARCHAR(100),
    nombreCientifico VARCHAR(100),
    descripcion VARCHAR(2000),
    imagenURL VARCHAR(300),
    f_procedenciaID INT,
    f_generoID INT,
    f_familiaID INT,
    f_saviaColorID INT,
    f_saviaTexturaID INT,
    f_formaHojaID INT,
    f_posicionHojaID INT,
    f_ubicacionID INT,
    f_florColorID INT,
    f_florSimetriaID INT,
    FOREIGN KEY especie_procedenciaID(f_procedenciaID) REFERENCES PROCEDENCIA(procedenciaID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_generoID (f_generoID) REFERENCES GENERO(generoID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_familiaID (f_familiaID) REFERENCES FAMILIA(familiaID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_saviaColorID (f_saviaColorID) REFERENCES SAVIACOLOR(saviaColorID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_saviaTexturaID (f_saviaTexturaID) REFERENCES SAVIATEXTURA(saviaTexturaID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_formaHojaID (f_formaHojaID) REFERENCES FORMAHOJA(formaHojaID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_posicionHojaID (f_posicionHojaID) REFERENCES POSICIONHOJA(posicionHojaID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_ubicacionID (f_ubicacionID) REFERENCES UBICACION(ubicacionID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_florColorID (f_florColorID) REFERENCES FLORCOLOR(florColorID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY especie_florSimetriaID (f_florSimetriaID) REFERENCES FLORSIMETRIA(florSimetriaID)ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (especieID)
)Engine=InnoDB;

CREATE TABLE UBICACIONGPS(
    ubicacionGpsID INT NOT NULL auto_increment,
    latitud VARCHAR(100),
    longitud VARCHAR(100),
    f_especieID INT,
    FOREIGN KEY ubicacionGPS_especieID(f_especieID) REFERENCES ESPECIE(especieID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (ubicacionGpsID)
)Engine=InnoDB;

CREATE TABLE CARACTERISTICA(
    caracteristicaID INT NOT NULL auto_increment,
    nombre VARCHAR(200),
    resumen VARCHAR(2000),
    imagenURL VARCHAR(300),
    f_especieID INT,
    FOREIGN KEY caracteristica_especieID (f_especieID) REFERENCES ESPECIE(especieID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (caracteristicaID)
)Engine=InnoDB;

CREATE TABLE MUESTRAVERDE(
    muestraVerdeID INT NOT NULL auto_increment,
    imagenURL VARCHAR(300),
    f_especieID INT,
    FOREIGN KEY muestraVerde_especieID(f_especieID) REFERENCES ESPECIE(especieID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (muestraVerdeID)
)Engine=InnoDB;

CREATE TABLE MUESTRA(
    muestraID INT NOT NULL auto_increment,
    nombreIdentificador VARCHAR(300),
    nombreColector VARCHAR(300),
    fuente VARCHAR(300),
    fechaRecoleccion DATE,
    imagenURL VARCHAR(300),
    f_especieID INT,
    FOREIGN KEY muestra_especieID (f_especieID) REFERENCES ESPECIE(especieID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (muestraID)
)Engine=InnoDB;

CREATE TABLE ITEMGLOSARIO(
    itemGlosarioID INT NOT NULL auto_increment,
    nombre VARCHAR(300),
    definicion VARCHAR(2000),
    PRIMARY KEY (itemGlosarioID)
)Engine=InnoDB;


CREATE TABLE IMAGENESTIPOS(
    imagenesTiposID INT NOT NULL auto_increment,
    imagenURL VARCHAR(300),
    f_itemGlosarioID INT,
    FOREIGN KEY imagenesTipos_itemGlosarioID(f_itemGlosarioID) REFERENCES ITEMGLOSARIO(itemGlosarioID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (imagenesTiposID)
)Engine=InnoDB;

CREATE TABLE IMAGENESEJEMLOS(
    imagenesEjemplosID INT NOT NULL auto_increment,
    imagenURL VARCHAR(300),
    f_itemGlosarioID INT,
    FOREIGN KEY imagenesEjemplos_itemGlosarioID(f_itemGlosarioID) REFERENCES ITEMGLOSARIO(itemGlosarioID) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY (imagenesEjemplosID)
)Engine=InnoDB;
