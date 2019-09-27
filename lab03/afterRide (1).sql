CREATE TABLE Miembro(id NUMBER(5) NOT NULL,idt CHAR(2)NOT NULL,idn NUMBER(15)NOT NULL,pais VARCHAR(15)NOT NULL ,correo VARCHAR(15) NULL);
CREATE TABLE Persona(miembro_id NUMBER(5) NOT NULL,nombre VARCHAR(50) NOT NULL);
CREATE TABLE Empresa(miembro_id NUMBER(5) NOT NULL,razonSocial VARCHAR(30) NOT NULL,representante_de NUMBER(5) NOT NULL);
CREATE TABLE Ciclista(persona_id NUMBER(5) NOT NULL,persona_nombre VARCHAR(50) NOT NULL, nacimiento DATE NOT NULL,categoria NUMBER(1)NOT NULL);

CREATE TABLE Punto(carrera_codigo VARCHAR(20) NOT NULL,orden NUMBER(2) NOT NULL,nombre VARCHAR(40) NOT NULL,tipo CHAR(1) NOT NULL,distancia NUMBER(8,2) NOT NULL, timpoLimite NUMBER(9) NOT NULL );
CREATE TABLE PropiedadDe(miembro_id NUMBER(5) NOT NULL,carrera_codigo VARCHAR(20) NOT NULL,porcentaje NUMBER(3) NOT NULL);
CREATE TABLE Carrera(codigo VARCHAR(20) NOT NULL,nombre VARCHAR(40) NOT NULL,pais VARCHAR(15)NOT NULL ,categoria NUMBER(1)NOT NULL, periodicidad NUMBER(1) NOT NULL);

CREATE TABLE Segmento(nombre VARCHAR(40) NOT NULL,FinalizaEn VARCHAR(20) NOT NULL,IniciaEn VARCHAR(20) NOT NULL, carrera_codigo VARCHAR(20) NOT NULL, nombre_version VARCHAR(40)NOT NULL, tipo CHAR(1) NOT NULL);
CREATE TABLE Version(carrera_codigo VARCHAR(20) NOT NULL,nombre VARCHAR(40)NOT NULL, fecha DATE NOT NULL);
CREATE TABLE Participa(nombre_version VARCHAR(40)NOT NULL, ciclista_id NUMBER(5) NOT NULL);
CREATE TABLE EsOrganizador(empresa_id NUMBER(5) NOT NULL,nombre_version VARCHAR(40)NOT NULL);

CREATE TABLE Registro(numero NUMBER(5) NOT NULL, nombre_segmento VARCHAR(40) NOT NULL,nombre_version VARCHAR(40)NOT NULL,ciclista_id NUMBER(5) NOT NULL, fecha DATE NOT NULL, tiempo NUMBER(9) NOT NULL,posicion NUMBER(5) NOT NULL, revision VARCHAR(50) NULL, dificultad CHAR(1)NOT NULL, comentario VARCHAR(20) NULL );
CREATE TABLE Foto(numero_registro NUMBER(5) NOT NULL,TFoto VARCHAR(50)NOT NULL);


INSERT INTO Miembro VALUES(1,'CC',1075240440,'COLOMBIA',NULL);
INSERT INTO Miembro VALUES(2,'NT',1000722771,'COLOMBIA','harryB@mail.com');
INSERT INTO Miembro VALUES(3,'CE',1003804394,'BRASIL',NULL);

INSERT INTO Ciclista VALUES(1,'Jaime Perez',TO_DATE('2000/11/19','YYYY/MM/DD'),5);
INSERT INTO Ciclista VALUES(3,'Alejandra Puertas',TO_DATE('2001/05/30','YYYY/MM/DD'),2);

INSERT INTO Persona VALUES(1,'Jaime Perez');
INSERT INTO Persona VALUES(3,'Alejandra Puertas');

INSERT INTO Empresa VALUES(2,'Harrys Bundle',3);


INSERT INTO Carrera VALUES('DCJCVH4P','Tour de Colombia','COLOMBIA',5,3);
INSERT INTO Carrera VALUES('VA85PDA2','Vuelta a Bosa','COLOMBIA',1,1);
INSERT INTO Carrera VALUES('Y874EBXV','Giro de São Paulo','BRASIL',4,2);

INSERT INTO Punto VALUES('VA85PDA2',1,'Bosa Centro','P',0,0);
INSERT INTO Punto VALUES('VA85PDA2',2,'Bosa San Jose','L',2.9,60);
INSERT INTO Punto VALUES('DCJCVH4P',1,'Neiva','P',0,0);
INSERT INTO Punto VALUES('DCJCVH4P',2,'Cartagena','A',1223.3,1200);
INSERT INTO Punto VALUES('DCJCVH4P',3,'Sierra Nevada de Santa Marta','L',201,180);
INSERT INTO Punto VALUES('Y874EBXV',1,'Centro','P',0,0);
INSERT INTO Punto VALUES('Y874EBXV',2,'Pinheiros','H',8.5,60);
INSERT INTO Punto VALUES('Y874EBXV',3,'Itaim Bibi','L',4.3,60);

INSERT INTO PropiedadDe VALUES(2,'VA85PDA2',100);
INSERT INTO PropiedadDe VALUES(2,'DCJCVH4P',100);
INSERT INTO PropiedadDe VALUES(2,'Y874EBXV',100);


INSERT INTO Segmento VALUES('Linea del Brayan',1,2,'VA85PDA2','Vuelta a Bosa 2019','C');
INSERT INTO Segmento VALUES('Linea de la muerte',1,2,'DCJCVH4P','Tour de Colombia 2019','M');
INSERT INTO Segmento VALUES('Linea de la vida',2,3,'DCJCVH4P','Tour de Colombia 2019','M');
INSERT INTO Segmento VALUES('Linea de la Pinheiros',1,2,'Y874EBXV','Giro de São Paulo 2019','C');
INSERT INTO Segmento VALUES('Linea de la Itaim',2,3,'Y874EBXV','Giro de São Paulo 2019','C');

INSERT INTO Version VALUES('DCJCVH4P','2019TCO',TO_DATE('2019/12/19','YYYY/MM/DD'));
INSERT INTO Version VALUES('VA85PDA2','2019BO',TO_DATE('2019/05/01','YYYY/MM/DD'));
INSERT INTO Version VALUES('Y874EBXV','2019GSP',TO_DATE('2019/07/09','YYYY/MM/DD'));

INSERT INTO Participa VALUES('2019TCO',1);
INSERT INTO Participa VALUES('2019TCO',3);
INSERT INTO Participa VALUES('2019BO',1);
INSERT INTO Participa VALUES('2019BO',3);
INSERT INTO Participa VALUES('2019GSP',1);
INSERT INTO Participa VALUES('2019GSP',3);

INSERT INTO EsOrganizador VALUES(2,'Giro de São Paulo 2019');
INSERT INTO EsOrganizador VALUES(2,'2019BO');
INSERT INTO EsOrganizador VALUES(2,'Tour de Colombia 2019');


INSERT INTO Registro VALUES(88082,'Linea del Brayan','2019BO',1,TO_DATE('2019/05/01','YYYY/MM/DD'),30, 2, NULL, 'M', NULL);
INSERT INTO Registro VALUES(98149,'Linea de la muerte','2019TCO',1,TO_DATE('2019/12/19','YYYY/MM/DD'),1300, 1, NULL, 'A', NULL);
INSERT INTO Registro VALUES(13615,'Linea de la vida','2019TCO',1,TO_DATE('2019/12/19','YYYY/MM/DD'),146, 2, NULL, 'M', NULL);
INSERT INTO Registro VALUES(33119,'Linea de la Pinheiros','2019GSP',1,TO_DATE('2019/07/09','YYYY/MM/DD'),25, 2, NULL, 'M', NULL);
INSERT INTO Registro VALUES(11065,'Linea de la Itaim','2019GSP',1,TO_DATE('2019/07/09','YYYY/MM/DD'),21, 1, NULL, 'M', NULL);
INSERT INTO Registro VALUES(32920,'Linea del Brayan','2019BO',2,TO_DATE('2019/05/01','YYYY/MM/DD'),25, 1, NULL, 'B', NULL);
INSERT INTO Registro VALUES(67672,'Linea de la muerte','2019TCO',2,TO_DATE('2019/12/19','YYYY/MM/DD'),1376, 2, NULL, 'A', NULL);
INSERT INTO Registro VALUES(56111,'Linea de la vida','2019TCO',2,TO_DATE('2019/12/19','YYYY/MM/DD'),135, 1, NULL, 'M', NULL);
INSERT INTO Registro VALUES(68403,'Linea de la Pinheiros','2019GSP',2,TO_DATE('2019/07/09','YYYY/MM/DD'),18, 1, NULL, 'M', NULL);
INSERT INTO Registro VALUES(64031,'Linea de la Itaim','2019GSP',2,TO_DATE('2019/07/09','YYYY/MM/DD'),27, 2, NULL, 'M', NULL);

INSERT INTO Foto VALUES(88082,'www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(98149,'www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(13615,'www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(33119,'www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(11065,'www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(32920,'www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(67672,'www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(56111,'www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(68403,'www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(64031,'www.fotoregistro.com/participate2.pdf');

/* PoblarNoOK */
INSERT INTO Foto VALUES(48894,'fotoregistro.com/participate1.pdf'); /* No se permitirá por que el link debe empezar en www. PROTEGIDO CK_foto */
INSERT INTO Miembro VALUES(1,'1T',1075240440,'COLOMBIA',NULL); /* Solo se puede CC, NT, CE PROTEGIDO CK_miembro */
INSERT INTO Miembro VALUES(2,'NT',1000722771,'COLOMBIA','harryBmail.com'); /* El correo tiene una @ PROTEGIDO CK_miembro */
INSERT INTO Punto VALUES('VA85PDA2',1,'Bosa Centro','Z',0,0); /* TPunto solo puede ser P, L, H, A, M, V, C PROTEGIDO CK_punto */
INSERT INTO Registro VALUES(68403,'Linea de la Pinheiros','Giro de São Paulo 2019',2,TO_DATE('2019/07/09','YYYY/MM/DD'),18, 1, NULL, 'L', NULL); /* TDificultad solo puede ser A, M, B PROTEGIDO CK_registro */

INSERT INTO Foto VALUES('C1','www.fotoregistro.com/participate1.pdf'); /* numero_registro es un entero */
INSERT INTO EsOrganizador VALUES(2,2); /* nombre_version es una cadena de caracteres */
INSERT INTO Miembro VALUES(NULL,'CC',1075240440,'COLOMBIA',NULL); /* id no puede ser nulo */
INSERT INTO Punto VALUES('VA85PDA2',2,'Bosa San Jose','L',2.639,60); /* TDistancia tiene hasta dos decimales */
INSERT INTO Miembro VALUES(3,'CEDULA',1003804394,'BRASIL',NULL); /* tid es char(2) */

/* F. Construcción: nuevamente poblando */
INSERT INTO Miembro VALUES(4,'CC',107804394,'COLOMBIA',NULL);
INSERT INTO Persona VALUES(4,'Tin Tin');

INSERT INTO Carrera VALUES('J844EBUV','LaRutaSabana','COLOMBIA',4,1);
INSERT INTO Version VALUES('J844EBUV','19CO',TO_DATE('2019/10/30','YYYY/MM/DD'));
INSERT INTO Punto VALUES('J844EBUV',1,'Sabana1','P',0,0);
INSERT INTO Punto VALUES('J844EBUV',2,'Sabana2','H',120.9,120);
INSERT INTO Segmento VALUES('Sisga',1,2,'J844EBUV','LaRutaSabana','C');

INSERT INTO Registro VALUES(78022,'Sisga','19CO',4,TO_DATE('2019/10/30','YYYY/MM/DD'),101, 1, NULL, 'M', 'Tiempo Record de la carrera');
/*------------------------------------------------------------------------------------------*/
INSERT INTO Miembro VALUES(5,'CC',107703184,'COLOMBIA',NULL);
INSERT INTO Persona VALUES(5,'Tovar');

INSERT INTO Carrera VALUES('J844EBUV','LaRutaSabana','COLOMBIA',5,1);
INSERT INTO Version VALUES('J844EBUV','18CO',TO_DATE('2019/10/29','YYYY/MM/DD'));
INSERT INTO Punto VALUES('J844EBUV',3,'Sabana3','L',105.3,100);
INSERT INTO Segmento VALUES('LaCuchilla',2,3,'J844EBUV','LaRutaSabana','M');

INSERT INTO Registro VALUES(56027,'LaCuchilla','18CO',4,TO_DATE('2019/10/29','YYYY/MM/DD'),93, 2, NULL, 'M', 'Bajo observacion de doping');
/* D. Construcción: protegiendo */

/* Checks */

ALTER TABLE Carrera ADD CONSTRAINT CK_carrera CHECK(REGEXP_LIKE(codigo,'^([A-Z0-9]*)$')AND REGEXP_LIKE(pais,'^([A-Z]*|\s)$') AND (pais LIKE('% %') OR pais NOT LIKE('% %')) AND categoria>=1 AND categoria<=5 AND (periodicidad='A' OR periodicidad='S' OR periodicidad='T' OR periodicidad='B'));
ALTER TABLE Punto ADD CONSTRAINT CK_punto CHECK(UPPER(carrera_codigo)=carrera_codigo AND REGEXP_LIKE(carrera_codigo,'^([A-Z0-9]*)$') AND (tipo='P' OR tipo='L' OR tipo='H' OR tipo='A' OR tipo='M' OR tipo='V' OR tipo='C') AND timpoLimite>0);
ALTER TABLE PropiedadDe ADD CONSTRAINT CK_propiedadde CHECK(miembro_id>=1 AND miembro_id<=99999 AND UPPER(carrera_codigo)=carrera_codigo AND REGEXP_LIKE(carrera_codigo,'^([A-Z0-9]*)$') AND porcentaje>=0 AND porcentaje<=100);

ALTER TABLE Version ADD CONSTRAINT CK_version CHECK(UPPER(carrera_codigo)=carrera_codigo AND REGEXP_LIKE(carrera_codigo,'^([A-Z0-9]*)$'));
ALTER TABLE Segmento ADD CONSTRAINT CK_segmento CHECK(UPPER(codigo_carrera)=codigo_carrera AND REGEXP_LIKE(codigo_carrera,'^([A-Z0-9]*)$') AND (tipo='C' OR tipo='M' OR tipo='L') AND UPPER(IniciaEn)=IniciaEn AND REGEXP_LIKE(IniciaEn,'^^([A-Z0-9]*)$') AND UPPER(FinalizaEn)=FinalizaEn AND REGEXP_LIKE(FinalizaEn,'^([A-Z0-9]*)$') );

ALTER TABLE Miembro ADD CONSTRAINT CK_miembro CHECK(id>=1 AND id<=99999 AND (idt='CC' OR idt='CE' OR idt='NT') AND idn>1111111111 AND REGEXP_LIKE(pais,'^([A-Z]*|\s)$') AND REGEXP_LIKE(correo,'^([a-zA-Z0-9]*)$+@+^([a-zA-Z0-9]*)$'));
ALTER TABLE Persona ADD CONSTRAINT CK_persona CHECK(miembro_id>=1 AND miembro_id<=99999);
ALTER TABLE Empresa ADD CONSTRAINT CK_empresa CHECK(miembro_id>=1 AND miembro_id<=99999 AND represetante_De>=1 AND represetante_De<=99999);
ALTER TABLE Ciclista ADD CONSTRAINT CK_ciclista CHECK(persona_id>=1 AND persona_id<=99999 AND categoria>=1 AND categoria<=5);
ALTER TABLE EsOrganizador ADD CONSTRAINT CK_esorganizador CHECK(empresa_id>=1 AND empresa_id<=99999 AND UPPER(nombre_version)=nombre_version AND REGEXP_LIKE(nombre_version,'^([A-Z0-9]*)$'));
ALTER TABLE Participa ADD CONSTRAINT CK_participa CHECK(ciclista_id>=1 AND ciclista_id<=99999 AND UPPER(version_nombre)=version_nombre AND REGEXP_LIKE(version_nombre,'^([A-Z0-9]*)$'));

ALTER TABLE Registro ADD CONSTRAINT CK_registro CHECK(numero>=1 AND numero<=99999 AND tiempo>0 AND (dificultad='A' OR dificultad='M' OR dificultad='B')  AND ciclista_id>=1 AND ciclista_id<=99999);
ALTER TABLE Foto ADD CONSTRAINT CK_foto CHECK(TFoto LIKE('www.%') AND (TFoto LIKE('%.gif') OR TFoto LIKE('%.pdf')));

/* Llaves */

ALTER TABLE Miembro ADD CONSTRAINT PK_miembro PRIMARY KEY (id);
ALTER TABLE Miembro ADD CONSTRAINT UK_miembro UNIQUE (correo);

ALTER TABLE Persona ADD CONSTRAINT PK_persona PRIMARY KEY (miembro_id);
ALTER TABLE Persona ADD CONSTRAINT FK_persona_1 FOREIGN KEY (miembro_id) REFERENCES Miembro(id);

ALTER TABLE Empresa ADD CONSTRAINT PK_empresa PRIMARY KEY (miembro_id);
ALTER TABLE Empresa ADD CONSTRAINT FK_empresa_1 FOREIGN KEY (miembro_id) REFERENCES Miembro(id);
ALTER TABLE Empresa ADD CONSTRAINT FK_empresa_2 FOREIGN KEY (representante_de) REFERENCES Persona(miembro_id);

ALTER TABLE Ciclista ADD CONSTRAINT PK_ciclista PRIMARY KEY (persona_id, persona_nombre);
ALTER TABLE Ciclista ADD CONSTRAINT FK_ciclista FOREIGN KEY (persona_id) REFERENCES Persona(miembro_id);


ALTER TABLE Punto ADD CONSTRAINT PK_punto PRIMARY KEY (carrera_codigo);
ALTER TABLE Punto ADD CONSTRAINT FK_punto FOREIGN KEY (carrera_codigo) REFERENCES Carrera(codigo);

ALTER TABLE PropiedadDe ADD CONSTRAINT PK_porpiedadde PRIMARY KEY (miembro_id, carrera_codigo);
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_propiedadde_1 FOREIGN KEY (miembro_id) REFERENCES Miembro(id);
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_propiedadde_2 FOREIGN KEY (carrera_codigo) REFERENCES Carrera(codigo);

ALTER TABLE Carrera ADD CONSTRAINT PK_carrera PRIMARY KEY (codigo);


ALTER TABLE Segmento ADD CONSTRAINT PK_segmento PRIMARY KEY (carrera_codigo,nombre);
ALTER TABLE Segmento ADD CONSTRAINT FK_segmento_1 FOREIGN KEY (FinalizaEn) REFERENCES Punto(orden);
ALTER TABLE Segmento ADD CONSTRAINT FK_segmento_2 FOREIGN KEY (IniciaEn) REFERENCES Punto(orden);
ALTER TABLE Segmento ADD CONSTRAINT FK_segmento_3 FOREIGN KEY (carrera_codigo) REFERENCES Carrera(codigo);

ALTER TABLE Version ADD CONSTRAINT PK_version PRIMARY KEY (carrera_codigo, nombre);
ALTER TABLE Version ADD CONSTRAINT FK_version FOREIGN KEY (carrera_codigo) REFERENCES Carreara(codigo);

ALTER TABLE Participa ADD CONSTRAINT PK_participa PRIMARY KEY (version_nombre, ciclista_id);
ALTER TABLE Participa ADD CONSTRAINT FK_participa_1 FOREIGN KEY (version_nombre) REFERENCES Version(nombre);
ALTER TABLE Participa ADD CONSTRAINT FK_participa_2 FOREIGN KEY (ciclista_id) REFERENCES Ciclista(persona_nombre);

ALTER TABLE EsOrganizador ADD CONSTRAINT PK_esorganizador PRIMARY KEY (empresa_id,nombre_version);
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_esorganizador_1 FOREIGN KEY (empresa_id) REFERENCES Empresa(miembro_id);
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_esorganizador_2 FOREIGN KEY (nombre_version) REFERENCES Version(nombre);

ALTER TABLE Registro ADD CONSTRAINT PK_registro PRIMARY KEY (numero);
ALTER TABLE Registro ADD CONSTRAINT UK_registro UNIQUE (comentario);
ALTER TABLE Registro ADD CONSTRAINT FK_registro_1 FOREIGN KEY (nombre_segmento) REFERENCES Segmento(nombre);
ALTER TABLE Registro ADD CONSTRAINT FK_registro_2 FOREIGN KEY (nombre_version) REFERENCES Version(nombre);
ALTER TABLE Registro ADD CONSTRAINT FK_registro_3 FOREIGN KEY (ciclista_id) REFERENCES Ciclista(persona_id);

ALTER TABLE Foto ADD CONSTRAINT PK_foto PRIMARY KEY (numero_registro, TFoto);
ALTER TABLE Foto ADD CONSTRAINT FK_foto FOREIGN KEY (numero_registro) REFERENCES Registro(numero);

/* PoblarNoOK (2) */
INSERT INTO Miembro VALUES(4,'CC',107804394,'Colombia',NULL); /* PROTEGIDO CK_miembro */
INSERT INTO Miembro VALUES(3,'CD',1003804394,'BRASIL',NULL); /* PROTEGIDO CK_miembro */
INSERT INTO Foto VALUES(68403,'www.fotoregistro.com/participate2.jpg'); /* PROTEGIDO CK_fotos */
INSERT INTO Participa VALUES('2019GSP',0); /* PROTEGIDO CK_participa */
INSERT INTO Version VALUES('DCJCVH4P','2019tco',TO_DATE('2019/12/19','YYYY/MM/DD')); /* PROTEGIDO CK_version */

/* CICLO 1: Consultar el pais de una version de la carrera */
SELECT Version.nombre, país FROM Carrera 
JOIN Version ON Carrera.codigo = Versión.codigo

/* CICLO 1: Consultar segmentos de montaña con secciones de descenso */
SELECT nombre FROM Segmento
WHERE tipo ='M'

/* CICLO 1: Consultar los cinco segmentos con tiempos mas cortos */
SELECT Segmento.nombre FROM Segmento
JOIN Punto ON Punto.codigocarrera = Segmento.codigocarrera AND Segmento.punto=Punto.orden
ORDER BY tiempolimite

/* CICLO 1: Consultar puntos de una carrera */
SELECT * FROM Punto 
JOIN Carrera ON Carrera.codigo= Punto.carreracodigo 
GROUP BY Carrera.codigo

/* CICLO 1: Consultar a que pais pertenecen los miembros de la version */
SELECT Miembro.pais FROM miembro 
JOIN Persona ON miembro.id=persona.miembroid
JOIN Ciclista ON persona.miembroid =Ciclista.personaid 
JOIN registro ON Ciclista.personaid = registro.ciclistaid
JOIN version ON versión.nombre= Registro.versionnombre 
GROUP BY version.nombre

/* XPoblar */
DELETE FROM Miembro;
DELETE FROM Ciclista;
DELETE FROM Empresa;
DELETE FROM Persona;

DELETE FROM Carrera;
DELETE FROM Punto;
DELETE FROM PropiedadDe;

DELETE FROM Segmento;
DELETE FROM Version;
DELETE FROM Participa;
DELETE FROM EsOrganizador;

DELETE FROM Registro;
DELETE FROM Foto;

DROP TABLE Carrera;
DROP TABLE Ciclista;
DROP TABLE Empresa;
DROP TABLE Persona;
DROP TABLE EsOrganizador;
DROP TABLE Foto;
DROP TABLE Miembro;
DROP TABLE Participa;
DROP TABLE Persona;
DROP TABLE PropiedadDe;
DROP TABLE Punto;
DROP TABLE Registro;
DROP TABLE Segmento;
DROP TABLE Version;