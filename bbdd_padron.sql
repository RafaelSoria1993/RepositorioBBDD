CREATE DATABASE IF NOT EXISTS BBDD_PADRON;

USE BBDD_PADRON;

create table T_MUNICIPIO(
	id_municipio int NOT NULL PRIMARY KEY,
	nombre varchar(20) NOT NULL
);

create table T_VIVIENDA(
	id_vivienda int NOT NULL PRIMARY KEY,
	direccion varchar(50) NOT NULL,
	id_municipio int NOT NULL,
	tipo enum('piso', 'apartamento', 'casa', 'estudio', 'vivienda general') NOT NULL,
	CONSTRAINT FK_idmunicipioVIVIENDA_MUNICIPIO
	FOREIGN KEY (id_municipio) REFERENCES T_MUNICIPIO(id_municipio)
);

create table T_PERSONA(
	DNI char(9) NOT NULL PRIMARY KEY, 
	nombre varchar(20) NOT NULL,
	apellidos varchar(80) NOT NULL, 
	id_vivienda int NOT NULL,
	CONSTRAINT FK_idviviendaPERSONA_VIVIENDA
	FOREIGN KEY (id_vivienda) REFERENCES T_VIVIENDA(id_vivienda)
);

create table T_PERSONA_tener_VIVIENDA(
	DNI char(9) NOT NULL,
	id_vivienda int NOT NULL,
	PRIMARY KEY (DNI, id_vivienda),
	CONSTRAINT FK_dniPERSONAtenerVIVIENDA_PERSONA
	FOREIGN KEY (DNI) REFERENCES T_PERSONA(DNI),
	CONSTRAINT FK_idviviendaPERSONAtenerVIVIENDA_PERSONA
	FOREIGN KEY (id_vivienda) REFERENCES T_VIVIENDA(id_vivienda)
);

create table T_PERSONA_PERSONA(
	DNI char(9) NOT NULL,
	DNI_responsable char(9) NOT NULL,
	PRIMARY KEY (DNI, DNI_responsable),
	CONSTRAINT FK_DNIPERSONAPERSONA_PERSONA
	FOREIGN KEY (DNI) REFERENCES T_PERSONA(DNI),
	CONSTRAINT FK_DNIresponsablePERSONAPERSONA_PERSONA
	FOREIGN KEY (DNI_responsable) REFERENCES T_PERSONA(DNI)
);
