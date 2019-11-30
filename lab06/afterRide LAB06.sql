CREATE TABLE Miembro(id_ Number(38) not null,idt CHAR(2) NULL,idn NUMBER(15) NULL,pais VARCHAR(50) NULL ,correo VARCHAR(50) NULL);
CREATE TABLE Persona(miembro_id NUMBER(5) NOT NULL,nombre VARCHAR(50) NOT NULL);
CREATE TABLE Empresa(miembro_id NUMBER(5) NOT NULL,razonSocial VARCHAR(30) NOT NULL,representante_de NUMBER(5) NOT NULL);
CREATE TABLE Ciclista(persona_id NUMBER(5) NOT NULL,persona_nombre VARCHAR(50) NOT NULL, nacimiento VARCHAR(20) NOT NULL,categoria NUMBER(1)NOT NULL);

CREATE TABLE Punto(carrera_codigo VARCHAR(20) NOT NULL,orden NUMBER(2) NOT NULL,nombre VARCHAR(40) NOT NULL,tipo CHAR(1) NOT NULL,distancia NUMBER(8,2) NOT NULL, timpoLimite NUMBER(9) NOT NULL );
CREATE TABLE PropiedadDe(miembro_id NUMBER(5) NOT NULL,carrera_codigo VARCHAR(20) NOT NULL,porcentaje NUMBER(3) NOT NULL);
CREATE TABLE Carrera(codigo VARCHAR(20) NOT NULL,nombre VARCHAR(40) NOT NULL,pais VARCHAR(15)NOT NULL ,categoria NUMBER(1)NOT NULL, periodicidad CHAR(1) NULL);

CREATE TABLE Segmento(nombre VARCHAR(40) NOT NULL, FinalizaEn NUMBER(2) NOT NULL,IniciaEn NUMBER(2) NOT NULL, carrera_codigo VARCHAR(20) NOT NULL, nombre_version VARCHAR(40)NOT NULL, tipo CHAR(1) NOT NULL);
CREATE TABLE Version_(carrera_codigo VARCHAR(20) NOT NULL,nombre VARCHAR(40)NOT NULL, fecha DATE NOT NULL);
CREATE TABLE Participa(version_codigo VARCHAR(20), nombre_version VARCHAR(40) NOT NULL,ciclista_id1 NUMBER(5) NOT NULL);
CREATE TABLE EsOrganizador(empresa_id NUMBER(5) NOT NULL, nombre_version VARCHAR(40) NOT NULL, version_codigo VARCHAR(20) NOT NULL);
CREATE TABLE Registro(numero NUMBER(5) NOT NULL, codigo_carrera VARCHAR(20) NOT NULL, nombre_segmento VARCHAR(40) NOT NULL,nombre_version VARCHAR(40)NOT NULL,ciclista_id NUMBER(5) NOT NULL, fecha DATE NOT NULL, tiempo NUMBER(9) NOT NULL,posicion NUMBER(5) NOT NULL, revision VARCHAR(50) NULL, dificultad CHAR(1)NOT NULL, comentario VARCHAR(20) NULL );
CREATE TABLE Foto(numero_registro NUMBER(5) NOT NULL, codigo_carrera VARCHAR(20) NOT NULL,TFoto VARCHAR(50)NOT NULL);

INSERT INTO Miembro VALUES(id_consec.nextval,'CC',10752020778,'PANCHO',NULL);
INSERT INTO Miembro VALUES(3,'NT',10007194567,'COLOMBIA',NULL);
INSERT INTO Miembro VALUES(3,'CE',10038043941,'BRASIL',NULL);

INSERT INTO Ciclista VALUES(1,'Jaime Perez',TO_DATE('2000/11/19','YYYY/MM/DD'),5);
INSERT INTO Ciclista VALUES(3,'Alejandra Puertas',TO_DATE('2001/05/30','YYYY/MM/DD'),2);

INSERT INTO Persona VALUES(1,'Jaime Perez');
INSERT INTO Persona VALUES(3,'Alejandra Puertas');

INSERT INTO Empresa VALUES(2,'Harrys Bundle',3);


INSERT INTO Carrera VALUES('DCJCVH4P','TDC2019','COLOMBIA',5,'T');
INSERT INTO Carrera VALUES('VA85PDA2','VAB2019','COLOMBIA',1,'M');
INSERT INTO Carrera VALUES('Y874EBXV','GDSP2019','BRASIL',4,'A');

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


INSERT INTO Segmento VALUES('Linea del Brayan',1,2,'VA85PDA2','VAB2019','C');
INSERT INTO Segmento VALUES('Linea de la muerte',1,2,'DCJCVH4P','TDC2019','M');
INSERT INTO Segmento VALUES('Linea de la vida',2,3,'DCJCVH4P','TDC2019','M');
INSERT INTO Segmento VALUES('Linea de la Pinheiros',1,2,'Y874EBXV','GDSP2019','C');
INSERT INTO Segmento VALUES('Linea de la Itaim',2,3,'Y874EBXV','GDSP2019','C');

INSERT INTO Version_ VALUES('DCJCVH4P','TDC2019',TO_DATE('2019/12/19','YYYY/MM/DD')); 
INSERT INTO Version_ VALUES('VA85PDA2','VAB2019',TO_DATE('2019/05/01','YYYY/MM/DD'));
INSERT INTO Version_ VALUES('Y874EBXV','GDSP2019',TO_DATE('2019/07/09','YYYY/MM/DD'));

INSERT INTO Participa VALUES('DCJCVH4P', 'TDC2019',1);
INSERT INTO Participa VALUES('DCJCVH4P', 'TDC2019',3);
INSERT INTO Participa VALUES('VA85PDA2', 'VAB2019',1);
INSERT INTO Participa VALUES('VA85PDA2', 'VAB2019',3);
INSERT INTO Participa VALUES('Y874EBXV', 'GDSP2019',1);
INSERT INTO Participa VALUES('Y874EBXV', 'GDSP2019',3);

INSERT INTO EsOrganizador VALUES(2,'GDSP2019','Y874EBXV');
INSERT INTO EsOrganizador VALUES(2,'VAB2019','VA85PDA2');
INSERT INTO EsOrganizador VALUES(2,'TDC2019','DCJCVH4P');


INSERT INTO Registro VALUES(0, 'VA85PDA2', 'Linea del Brayan','VAB2019',1,TO_DATE('2019/05/01','YYYY/MM/DD'),30, 2, NULL, 'M', NULL);
INSERT INTO Registro VALUES(98149, 'DCJCVH4P', 'Linea de la muerte','TDC2019',1,TO_DATE('2019/12/19','YYYY/MM/DD'),1300, 1, NULL, 'A', NULL);
INSERT INTO Registro VALUES(13615, 'DCJCVH4P', 'Linea de la vida','TDC2019',1,TO_DATE('2019/12/19','YYYY/MM/DD'),146, 2, NULL, 'M', NULL);
INSERT INTO Registro VALUES(33119, 'Y874EBXV', 'Linea de la Pinheiros','GDSP2019',1,TO_DATE('2019/07/09','YYYY/MM/DD'),25, 2, NULL, 'M', NULL);
INSERT INTO Registro VALUES(11065, 'Y874EBXV', 'Linea de la Itaim','GDSP2019',1,TO_DATE('2019/07/09','YYYY/MM/DD'),21, 1, NULL, 'M', NULL);
INSERT INTO Registro VALUES(32920, 'VA85PDA2', 'Linea del Brayan','VAB2019',3,TO_DATE('2019/05/01','YYYY/MM/DD'),25, 1, NULL, 'B', NULL);
INSERT INTO Registro VALUES(67672, 'DCJCVH4P', 'Linea de la muerte','TDC2019',3,TO_DATE('2019/12/19','YYYY/MM/DD'),1376, 2, NULL, 'A', NULL);
INSERT INTO Registro VALUES(56111, 'DCJCVH4P', 'Linea de la vida','TDC2019',3,TO_DATE('2019/12/19','YYYY/MM/DD'),135, 1, NULL, 'M', NULL);
INSERT INTO Registro VALUES(68403, 'Y874EBXV', 'Linea de la Pinheiros','GDSP2019',3,TO_DATE('2019/07/09','YYYY/MM/DD'),18, 1, NULL, 'M', NULL);
INSERT INTO Registro VALUES(64031, 'Y874EBXV', 'Linea de la Itaim','GDSP2019',3,TO_DATE('2019/07/09','YYYY/MM/DD'),27, 2, NULL, 'M', NULL);

INSERT INTO Foto VALUES(88082, 'VA85PDA2','www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(98149, 'DCJCVH4P','www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(13615, 'DCJCVH4P','www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(33119, 'Y874EBXV','www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(11065, 'Y874EBXV','www.fotoregistro.com/participate1.pdf');
INSERT INTO Foto VALUES(32920, 'VA85PDA2','www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(67672, 'DCJCVH4P','www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(56111, 'DCJCVH4P','www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(68403, 'Y874EBXV','www.fotoregistro.com/participate2.pdf');
INSERT INTO Foto VALUES(64031, 'Y874EBXV','www.fotoregistro.com/participate2.pdf');

/* PoblarNoOK */
INSERT INTO Foto VALUES(48894,'fotoregistro.com/participate1.pdf'); /* No se permitirá por que el link debe empezar en www. PROTEGIDO CK_foto */
INSERT INTO Miembro VALUES(1,'1T',1075240440,'COLOMBIA',NULL); /* Solo se puede CC, NT, CE PROTEGIDO CK_miembro */
INSERT INTO Miembro VALUES(2,'NT',1000722771,'COLOMBIA','harryBmail.com'); /* El correo tiene una @ PROTEGIDO CK_miembro */
INSERT INTO Punto VALUES('VA85PDA2',1,'Bosa Centro','Z',0,0); /* TPunto solo puede ser P, L, H, A, M, V, C PROTEGIDO CK_punto */
INSERT INTO Registro VALUES(68403,'Linea de la Pinheiros','GDSP2019',2,TO_DATE('2019/07/09','YYYY/MM/DD'),18, 1, NULL, 'L', NULL); /* TDificultad solo puede ser A, M, B PROTEGIDO CK_registro */

INSERT INTO Foto VALUES('C1','www.fotoregistro.com/participate1.pdf'); /* numero_registro es un entero */
INSERT INTO EsOrganizador VALUES(2,2); /* nombre_version es una cadena de caracteres */
INSERT INTO Miembro VALUES(NULL,'CC',1075240440,'COLOMBIA',NULL); /* id no puede ser nulo */
INSERT INTO Punto VALUES('VA85PDA2',2,'Bosa San Jose','L',2.639,60); /* TDistancia tiene hasta dos decimales */
INSERT INTO Miembro VALUES(3,'CEDULA',1003804394,'BRASIL',NULL); /* tid es char(2) */

/* F. Construcción: nuevamente poblando */
INSERT INTO Miembro VALUES(4,'CC',107804394,'COLOMBIA',NULL);
INSERT INTO Persona VALUES(4,'Tin Tin');

INSERT INTO Carrera VALUES('J844EBUV','LaRutaSabana','COLOMBIA',4,'A');
INSERT INTO Version_ VALUES('J844EBUV','19CO',TO_DATE('2019/10/30','YYYY/MM/DD'));
INSERT INTO Punto VALUES('J844EBUV',1,'Sabana1','P',0,0);
INSERT INTO Punto VALUES('J844EBUV',2,'Sabana2','H',120.9,120);
INSERT INTO Segmento VALUES('Sisga',1,2,'J844EBUV','LaRutaSabana','C');

INSERT INTO Registro VALUES(78022,'Sisga','19CO',4,TO_DATE('2019/10/30','YYYY/MM/DD'),101, 1, NULL, 'M', 'Tiempo Record de la carrera');
/*------------------------------------------------------------------------------------------*/
INSERT INTO Miembro VALUES(5,'CC',107703184,'COLOMBIA',NULL);
INSERT INTO Persona VALUES(5,'Tovar');

INSERT INTO Carrera VALUES('J844EBUV','LaRutaSabana','COLOMBIA',5,'A');
INSERT INTO Version_ VALUES('J844EBUV','18CO',TO_DATE('2019/10/29','YYYY/MM/DD'));
INSERT INTO Punto VALUES('J844EBUV',3,'Sabana3','L',105.3,100);
INSERT INTO Segmento VALUES('LaCuchilla',2,3,'J844EBUV','LaRutaSabana','M');

INSERT INTO Registro VALUES(56027,'LaCuchilla','18CO',4,TO_DATE('2019/10/29','YYYY/MM/DD'),93, 2, NULL, 'M', 'Bajo observacion de doping');
/* D. Construcción: protegiendo */

/* Checks */

ALTER TABLE Carrera ADD CONSTRAINT CK_carrera_ CHECK(REGEXP_LIKE(codigo,'^([A-Z0-9]*)$')AND REGEXP_LIKE(pais,'^([A-Z]*)$') AND categoria>=1 AND categoria<=5 AND (periodicidad='A' OR periodicidad='S' OR periodicidad='T' OR periodicidad='B' OR periodicidad='M'));
ALTER TABLE Punto ADD CONSTRAINT CK_punto CHECK(UPPER(carrera_codigo)=carrera_codigo AND REGEXP_LIKE(carrera_codigo,'^([A-Z0-9]*)$') AND (tipo='P' OR tipo='L' OR tipo='H' OR tipo='A' OR tipo='M' OR tipo='V' OR tipo='C') AND timpoLimite>=0);
ALTER TABLE PropiedadDe ADD CONSTRAINT CK_propiedadde CHECK(miembro_id>=1 AND miembro_id<=99999 AND UPPER(carrera_codigo)=carrera_codigo AND REGEXP_LIKE(carrera_codigo,'^([A-Z0-9]*)$') AND porcentaje>=0 AND porcentaje<=100);

ALTER TABLE Version_ ADD CONSTRAINT CK_version CHECK(UPPER(carrera_codigo)=carrera_codigo AND REGEXP_LIKE(carrera_codigo,'^([A-Z0-9]*)$'));
ALTER TABLE Segmento ADD CONSTRAINT CK_segmento CHECK(UPPER(carrera_codigo)=carrera_codigo AND REGEXP_LIKE(carrera_codigo,'^([A-Z0-9]*)$') AND (tipo='C' OR tipo='M' OR tipo='L') AND UPPER(IniciaEn)=IniciaEn AND REGEXP_LIKE(IniciaEn,'^^([A-Z0-9]*)$') AND UPPER(FinalizaEn)=FinalizaEn AND REGEXP_LIKE(FinalizaEn,'^([A-Z0-9]*)$') );

ALTER TABLE Miembro ADD CONSTRAINT CK_miembro CHECK(id>=1 AND id<=99999 AND (idt='CC' OR idt='CE' OR idt='NT') AND idn>1111111111 AND REGEXP_LIKE(pais,'^([A-Z]*|\s)$') AND REGEXP_LIKE(correo,'^([a-zA-Z0-9]*)$+@+^([a-zA-Z0-9]*)$'));
ALTER TABLE Persona ADD CONSTRAINT CK_persona CHECK(miembro_id>=1 AND miembro_id<=99999);
ALTER TABLE Empresa ADD CONSTRAINT CK_empresa CHECK(miembro_id>=1 AND miembro_id<=99999 AND representante_de>=1 AND representante_de<=99999);
ALTER TABLE Ciclista ADD CONSTRAINT CK_ciclista CHECK(persona_id>=1 AND persona_id<=99999 AND categoria>=1 AND categoria<=5);
ALTER TABLE EsOrganizador ADD CONSTRAINT CK_esorganizador CHECK(empresa_id>=1 AND empresa_id<=99999 AND UPPER(version_codigo)=version_codigo);
ALTER TABLE Participa ADD CONSTRAINT CK_participa CHECK(ciclista_id1>=1 AND ciclista_id1<=99999 AND UPPER(version_codigo)=version_codigo);

ALTER TABLE Registro ADD CONSTRAINT CK_registro CHECK(numero>=1 AND numero<=99999 AND tiempo>0 AND (dificultad='A' OR dificultad='M' OR dificultad='B')  AND ciclista_id>=1 AND ciclista_id<=99999);
ALTER TABLE Foto ADD CONSTRAINT CK_foto CHECK(TFoto LIKE('www.%') AND (TFoto LIKE('%.gif') OR TFoto LIKE('%.pdf')));

/* Llaves */

ALTER TABLE Miembro ADD CONSTRAINT PK_miembro PRIMARY KEY (id);
ALTER TABLE Persona ADD CONSTRAINT PK_persona PRIMARY KEY (miembro_id);
ALTER TABLE Empresa ADD CONSTRAINT PK_empresa PRIMARY KEY (miembro_id);
ALTER TABLE Ciclista ADD CONSTRAINT PK_ciclista PRIMARY KEY (persona_id);
ALTER TABLE Carrera ADD CONSTRAINT PK_carrera PRIMARY KEY (codigo);
ALTER TABLE Punto ADD CONSTRAINT PK_puntos PRIMARY KEY (carrera_codigo,orden);
ALTER TABLE PropiedadDe ADD CONSTRAINT PK_porpiedadde PRIMARY KEY (miembro_id, carrera_codigo);
ALTER TABLE Segmento ADD CONSTRAINT PK_segmento PRIMARY KEY (carrera_codigo, nombre);
ALTER TABLE Version_ ADD CONSTRAINT PK_version PRIMARY KEY (carrera_codigo,nombre);
ALTER TABLE Participa ADD CONSTRAINT PK_participa PRIMARY KEY (ciclista_id1, nombre_version, version_codigo);
ALTER TABLE EsOrganizador ADD CONSTRAINT PK_esorganizador PRIMARY KEY (empresa_id, nombre_version, version_codigo);
ALTER TABLE Registro ADD CONSTRAINT PK_registro PRIMARY KEY (numero, codigo_carrera);
ALTER TABLE Foto ADD CONSTRAINT PK_foto PRIMARY KEY (numero_registro, codigo_carrera);

ALTER TABLE Miembro ADD CONSTRAINT UK_miembro UNIQUE (correo);
ALTER TABLE Registro ADD CONSTRAINT UK_registro UNIQUE (comentario);

ALTER TABLE Persona ADD CONSTRAINT FK_persona_1 FOREIGN KEY (miembro_id) REFERENCES Miembro(id);
ALTER TABLE Empresa ADD CONSTRAINT FK_empresa_1 FOREIGN KEY (miembro_id) REFERENCES Miembro(id);
ALTER TABLE Empresa ADD CONSTRAINT FK_empresa_2 FOREIGN KEY (representante_de) REFERENCES Persona(miembro_id);
ALTER TABLE Ciclista ADD CONSTRAINT FK_ciclista FOREIGN KEY (persona_id) REFERENCES Persona(miembro_id);
ALTER TABLE Punto ADD CONSTRAINT FK_punto FOREIGN KEY (carrera_codigo) REFERENCES Carrera(codigo);
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_propiedadde_1 FOREIGN KEY (miembro_id) REFERENCES Miembro(id);
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_propiedadde_2 FOREIGN KEY (carrera_codigo) REFERENCES Carrera(codigo);
ALTER TABLE Segmento ADD CONSTRAINT FK_segmento_1 FOREIGN KEY (carrera_codigo,FinalizaEn) REFERENCES Punto(carrera_codigo,orden);
ALTER TABLE Segmento ADD CONSTRAINT FK_segmento_2 FOREIGN KEY (carrera_codigo,IniciaEn) REFERENCES Punto(carrera_codigo,orden);
ALTER TABLE Segmento ADD CONSTRAINT FK_segmento_3 FOREIGN KEY (carrera_codigo) REFERENCES Carrera(codigo);
ALTER TABLE Version_ ADD CONSTRAINT FK_version FOREIGN KEY (carrera_codigo) REFERENCES Carrera(codigo);
ALTER TABLE Participa ADD CONSTRAINT FK_participa_1 FOREIGN KEY (version_codigo, nombre_version) REFERENCES Version_(carrera_codigo,nombre);
ALTER TABLE Participa ADD CONSTRAINT FK_participa_2 FOREIGN KEY (ciclista_id1) REFERENCES Ciclista(persona_id);
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_esorganizador_1 FOREIGN KEY (empresa_id) REFERENCES Empresa(miembro_id);
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_esorganizador_2 FOREIGN KEY (version_codigo,nombre_version) REFERENCES Version_(carrera_codigo,nombre);
ALTER TABLE Registro ADD CONSTRAINT FK_registro_1 FOREIGN KEY (codigo_carrera, nombre_segmento) REFERENCES Segmento(carrera_codigo, nombre);
ALTER TABLE Registro ADD CONSTRAINT FK_registro_2 FOREIGN KEY (codigo_carrera,nombre_version) REFERENCES Version_(carrera_codigo,nombre);
ALTER TABLE Registro ADD CONSTRAINT FK_registro_3 FOREIGN KEY (ciclista_id) REFERENCES Ciclista(persona_id);
ALTER TABLE Foto ADD CONSTRAINT FK_foto FOREIGN KEY (numero_registro, codigo_carrera) REFERENCES Registro(numero, codigo_carrera);

/* PoblarNoOK (2) */
INSERT INTO Miembro VALUES(4,'CC',107804394,'Colombia',NULL); /* PROTEGIDO CK_miembro */
INSERT INTO Miembro VALUES(3,'CD',1003804394,'BRASIL',NULL); /* PROTEGIDO CK_miembro */
INSERT INTO Foto VALUES(68403,'www.fotoregistro.com/participate2.jpg'); /* PROTEGIDO CK_fotos */
INSERT INTO Participa VALUES('2019GSP',0); /* PROTEGIDO CK_participa */
INSERT INTO Version_ VALUES('DCJCVH4P','2019tco',TO_DATE('2019/12/19','YYYY/MM/DD')); /* PROTEGIDO CK_version */

/* CICLO 1: Consultar el pais de una version de la carrera */
SELECT Version_.nombre, país FROM Carrera 
JOIN Version_ ON Carrera.codigo = Versión.codigo;

/* CICLO 1: Consultar segmentos de montaña con secciones de descenso */
SELECT nombre FROM Segmento
WHERE tipo ='M';

/* CICLO 1: Consultar los cinco segmentos con tiempos mas cortos */
SELECT Segmento.nombre FROM Segmento
JOIN Punto ON Punto.codigocarrera = Segmento.codigocarrera AND Segmento.punto=Punto.orden
ORDER BY tiempolimite;

/* CICLO 1: Consultar puntos de una carrera */
SELECT * FROM Punto
JOIN Carrera ON Carrera.codigo= Punto.carreracodigo 
GROUP BY Carrera.codigo;

/* CICLO 1: Consultar a que pais pertenecen los miembros de la version */
SELECT Miembro.pais FROM miembro 
JOIN Persona ON miembro.id=persona.miembroid
JOIN Ciclista ON persona.miembroid =Ciclista.personaid 
JOIN registro ON Ciclista.personaid = registro.ciclistaid
JOIN version ON versión.nombre= Registro.versionnombre 
GROUP BY Version_.nombre;

/* XPoblar */
DELETE FROM Miembro;
DELETE FROM Ciclista;
DELETE FROM Empresa;
DELETE FROM Persona;

DELETE FROM Carrera;
DELETE FROM Punto;
DELETE FROM PropiedadDe;

DELETE FROM Segmento;
DELETE FROM Version_;
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
DROP TABLE Version_;

/* -------------------------------
lab04 
PUNTO 1:
(1)Revise su modelo lógico y perfecciónenlo. ¿Cuáles fueron los cambios realizados? 
		Hubo cambios en las llaves foraneas por errores de entendimiento, por consecuencia cambiamos las primarias
	(2)Revise el código actual del sistema y perfecciónenlo. ¿Cuáles fueron los cambios realizados?
		Error de tipo y nombre solucionados y corregidos los cambios del logico al codigo
*/
CREATE OR REPLACE TRIGGER AutoGenerateIDmiembro
BEFORE INSERT ON miembro
FOR EACH ROW
DECLARE valor NUMBER;
BEGIN
    SELECT COUNT(*) INTO valor FROM miembro;
    :NEW.id_ := valor+1;
END AutoGenerateIDmiembro;

DROP TRIGGER AutoGenerateIDmiembro;
/* Registrar Resultado */

/* Solo se pueden registrar resultados de ciclistas que hayan participado en la version de la carrera a la que pertenece el segmento.*/
CREATE OR REPLACE TRIGGER T1_resultado_ciclista
BEFORE INSERT ON Registro
FOR EACH ROW
DECLARE
VECES NUMBER;
 BEGIN
  SELECT COUNT(*) INTO VECES FROM Registro, Participa WHERE :NEW.ciclista_id=ciclista_id1;
  IF VECES=0 THEN
  RAISE_APPLICATION_ERROR(-20010, 'El ciclista no participó');
  END IF;
END T1_resultado_ciclista;
/* Prueba */
INSERT INTO Registro VALUES(98149, 'DCJCVH4P', 'Linea de la muerte','TDC2019',2,TO_DATE('2019/12/19','YYYY/MM/DD'),1300, 1, NULL, 'A', NULL);

DROP TRIGGER T1_resultado_ciclista

/*El número y la fecha se asignan automáticamente*/
CREATE OR REPLACE TRIGGER T2_Registro
BEFORE INSERT ON Registro
REFERENCING NEW AS NEW FOR EACH ROW
DECLARE valor NUMBER;
BEGIN
SELECT COUNT(*) INTO valor FROM Registro;
:NEW.numero := valor+1;
:NEW.fecha := sysdate;
END T2_Registro;

/* Prueba */
INSERT INTO Registro VALUES(425, 'VA85PDA2', 'Prueba del Brayan','VAB2019',1,TO_DATE('2019/05/01','YYYY/MM/DD'),30, 2, NULL, 'M', NULL);

DROP TRIGGER T2_Registro

/* Un ciclista solo puede tener un único registro en un segmento. */
CREATE OR REPLACE TRIGGER T3_registro
BEFORE INSERT ON Registro
FOR EACH ROW
DECLARE
VECES1 NUMBER:=0;
BEGIN
    SELECT COUNT(*) INTO VECES1 FROM Registro
    WHERE :NEW.ciclista_id = ciclista_id OR :NEW.nombre_segmento=nombre_segmento;
    IF VECES1>0
    THEN 
    RAISE_APPLICATION_ERROR(-20004,'Ya existe resultado');
    END IF;
END T3_registro;
/* Prueba */
INSERT INTO Registro VALUES(0, 'VA85PDA2', 'Linea del','VAB2019',5,TO_DATE('2019/05/01','YYYY/MM/DD'),30, 1, NULL, 'M', NULL);
INSERT INTO Registro VALUES(0, 'VA85PDA3', 'Linea del Brayan','VB2019',1,TO_DATE('2019/05/01','YYYY/MM/DD'),30, 2, NULL, 'M', NULL);

DROP TRIGGER T3_registro


/* No pueden quedar dos ciclistas con la misma posición. */
CREATE OR REPLACE TRIGGER T4_registro
BEFORE INSERT ON Registro
FOR EACH ROW
DECLARE
VECES NUMBER:=0;
BEGIN
    SELECT COUNT(*) INTO VECES FROM Registro
    WHERE :NEW.posicion=posicion;
    IF VECES>0
    THEN 
    RAISE_APPLICATION_ERROR(-20004,'Ya existe posicion');
    END IF;
END T4_registro;

DROP TRIGGER T4_registro

/* Los datos a modificar son la revisión, las fotos y el comentario. */
CREATE OR REPLACE TRIGGER T5_mod_registro
BEFORE UPDATE OF numero, codigo_carrera, nombre_segmento, ciclista_id, fecha, tiempo, posicion, dificultad
ON Registro
BEGIN
    RAISE_APPLICATION_ERROR(-20004,'No es posible actualizar este dato');
END T5_mod_registro;

/* Prueba */
UPDATE Registro SET numero=5 WHERE numero=1;

DROP TRIGGER T5_mod_registro

/* Los datos a modificar son la revisión, las fotos y el comentario */
CREATE OR REPLACE TRIGGER T6_mod_registro
BEFORE UPDATE OF numero_registro, codigo_carrera ON Foto
BEGIN
    RAISE_APPLICATION_ERROR(-20009,'No es posible actualizar este dato');
END T6_mod_registro;
/* Prueba */
UPDATE Foto SET numero_registro=5 WHERE numero_registro=1;

DROP TRIGGER T6_mod_registro

/* Sólo es posible eliminar un registro si no ha pasado mas de un dia desde que se creo */
CREATE OR REPLACE TRIGGER t7_el_registro
BEFORE DELETE ON registro
FOR EACH ROW
DECLARE
X NUMBER;
BEGIN
    SELECT TO_DATE (sysdate) - TO_DATE (:OLD.fecha) INTO X FROM dual;
   -- SELECT datediff(DAY,sysdate,:OLD.fecha) INTO X FROM Dual;
    IF X>1
    THEN
    raise_application_error(-20049,'No es posible borrar este dato');
    END IF;
END t7_el_registro;

DROP TRIGGER t7_el_registro

/* Mantener Carreras */

/* El orden se debe generar automáticamente 1 … */
CREATE OR REPLACE TRIGGER T1_Carrera
BEFORE INSERT ON Punto
REFERENCING NEW AS NEW FOR EACH ROW
DECLARE valor NUMBER;
BEGIN
SELECT COUNT(*) INTO valor FROM Punto
WHERE :NEW.carrera_codigo=carrera_codigo;
:NEW.orden := valor+1;
END T1_Carrera;
/*Prueba*/
INSERT INTO Punto VALUES('VA85PDA2',1,'Bosa Centro2','P',0,0);

DROP TRIGGER T1_Carrera

/* El nombre del punto no se debe repetir dentro de una carrera */
CREATE OR REPLACE TRIGGER T2_Carrera
BEFORE INSERT ON Punto
FOR EACH ROW
DECLARE VECES NUMBER;
BEGIN
    SELECT COUNT(*) INTO VECES FROM Punto
    WHERE :NEW.nombre = nombre AND :NEW.carrera_codigo = carrera_codigo;
    IF VECES > 0
    THEN
    raise_application_error(-20049,'El nombre del punto ya existe');
    END IF;
END T2_Carrera;
/* Prueba */
INSERT INTO Punto VALUES('VA85PDA2',1,'Bosa Centro','P',0,0);

DROP TRIGGER T2_Carrera

/* Sólo debe existir un punto de partida y un punto de llegada. Si no se dice el tipo del punto se asume */
CREATE OR REPLACE TRIGGER T3_Carrera
BEFORE INSERT ON Punto
FOR EACH ROW
DECLARE VECES NUMBER;
BEGIN
SELECT COUNT(*) INTO VECES FROM Punto WHERE :NEW.carrera_codigo=carrera_codigo;
    IF VECES = 0
    THEN :NEW.tipo:= 'P';
    ELSIF VECES = 1
    THEN :NEW.tipo:= 'L';
    ELSE
    :NEW.tipo:='L';
    UPDATE Punto SET tipo = 'M' WHERE orden=VECES-1;
    END IF;
END T3_Carrera;
/* Prueba */
INSERT INTO Punto VALUES('DCJCVH4P',2,'Cartagen','A',1223.3,1200);

DROP TRIGGER T3_Carrera

/* La distancia siempre debe ser mayor a 1 km */
CREATE OR REPLACE TRIGGER T4_carrera
BEFORE INSERT ON Punto
FOR EACH ROW
BEGIN
    IF :NEW.distancia>0 AND :NEW.distancia<=1
    THEN
    raise_application_error(-20059,'La distancia debe ser mayor a 1km');
    END IF;
END T4_carrera;
/* Prueba */
INSERT INTO Punto VALUES('DCJCVH4P',2,'Cartgen','A',0.5,1200);

DROP TRIGGER T4_carrera

/* La velocidad máxima en cicla es de 100 km/hora */
CREATE OR REPLACE TRIGGER T5_carrera
BEFORE INSERT ON Punto
FOR EACH ROW
BEGIN
    IF :NEW.distancia/:NEW.timpolimite > 100 AND :NEW.timpolimite <> 0
    THEN
        raise_application_error(-20059,'La velocidad debe ser menor a 100km/h');
    END IF;
END T5_carrera;
/* Prueba */
INSERT INTO Punto VALUES('DCJCVH4P',2,'Cartagena','A',1223.3,11);

DROP TRIGGER T5_carrera

/* Si no se conoce la duración máxima se asume una velocidad de 60 km/hora */
--No puede ser nula, por lo tanto se asume

/* Los únicos datos que se pueden modificar son el tipo y la duración */ 
CREATE OR REPLACE TRIGGER T5_mod_carrera
BEFORE UPDATE OF carrera_codigo, orden, nombre, distancia
ON Punto
BEGIN
    RAISE_APPLICATION_ERROR(-20004,'No es posible actualizar este dato');
END T5_mod_carrera;
/* Prueba */ 
UPDATE Punto SET distancia=764 WHERE carrera_codigo='VA85PDA2' AND orden=2;

DROP TRIGGER T5_mod_carrera

/* Los puntos no se pueden eliminar */
CREATE OR REPLACE TRIGGER T6_el_carrera
BEFORE DELETE ON Punto
BEGIN
    RAISE_APPLICATION_ERROR(-20004,'No es posible eliminar');
END T6_el_carrera;
/* Prueba */
DELETE FROM Punto

DROP TRIGGER T6_el_carrera

/* Solo se puede actualizar el nombre de la version */
CREATE OR REPLACE TRIGGER T1_mod_version
BEFORE UPDATE OF carrera_codigo, fecha
ON Version_
BEGIN
    RAISE_APPLICATION_ERROR(-20004,'No es posible actualizar este dato');
END T1_mod_version;
/* Prueba */
UPDATE Version_ SET carrera_codigo='DCJCVH4P' WHERE carrera_codigo='VA85PDA2'

DROP TRIGGER T1_mod_version

/* Solo se puede actualizar el nombre del segmento */
CREATE OR REPLACE TRIGGER T2_mod_version
BEFORE UPDATE OF carrera_codigo, finalizaen, iniciaen, tipo
ON Segmento
BEGIN
    RAISE_APPLICATION_ERROR(-20004,'No es posible actualizar este dato');
END T2_mod_version;
/* Prueba */
UPDATE Segmento SET tipo='C' WHERE tipo='M'

DROP TRIGGER T2_mod_version

/* El nombre de la version debe ser distinto a sus segmentos */
CREATE OR REPLACE TRIGGER T3_version
BEFORE INSERT ON Segmento
FOR EACH ROW
BEGIN
    IF :NEW.nombre = :NEW.nombre_version
    THEN
    RAISE_APPLICATION_ERROR(-20001,'Nombre del segmento es igual a el de su version');
    END IF;
END T3_version;
/* Prueba */
INSERT INTO Segmento VALUES('Sisa',1,2,'J844EBUV','Sisa','C');

DROP TRIGGER T3_version

/* No se eliminar Version */
CREATE OR REPLACE TRIGGER T4_el_version
BEFORE DELETE ON Version_
BEGIN
    RAISE_APPLICATION_ERROR(-20004,'No es posible eliminar');
END T4_el_version;
/* Prueba */
DELETE FROM Version_

DROP TRIGGER T4_el_version

/* No se puede eliminar segmento */
CREATE OR REPLACE TRIGGER T5_el_version
BEFORE DELETE ON Segmento
BEGIN
    RAISE_APPLICATION_ERROR(-20004,'No es posible eliminar');
END T5_el_version;
/* Prueba */
DELETE FROM Segmento

DROP TRIGGER T5_el_version

/* Punto de inicio de un segmento no debe ser igual al final  */
CREATE OR REPLACE TRIGGER T6_version
BEFORE INSERT ON Segmento
FOR EACH ROW
BEGIN
    IF :NEW.FinalizaEn = :NEW.IniciaEn
    THEN
    RAISE_APPLICATION_ERROR(-20001,'Punto de inicio no puede ser igual al final');
    END IF;
END T6_version;
/* Prueba */
INSERT INTO Segmento VALUES('Sisga',1,1,'J844EBUV','RutaSabana','C');

DROP TRIGGER T6_version

/* LAB06 */

/*A. Consulte la información que actualmente está en el archivo*/
SELECT * FROM MBDA.miembros

/*B. Inclúyanse como ciclistas*/
INSERT INTO MBDA.miembros VALUES('CC','1000722771','Colombia','battimix191100@hotmail.com',null,'Ricardo Amaya',TO_DATE('2000-11-19','YYYY-MM-DD'),'5');
INSERT INTO MBDA.miembros VALUES('CC','1003804394','Colombia','javier200151@gmail.com',null,'Javier Lopez',TO_DATE('2001-05-30','YYYY-MM-DD'),'5');

/*C. Traten de modificarse o borrarse. ¿qué pasa?*/
DELETE FROM MBDA.miembros WHERE nombres='Ricardo Amaya';
UPDATE MBDA.miembros SET numero='1003804396' WHERE numero='1003804394';
/*No nos deja modificar y borrar por razones de seguridad, no hay privilegios necesarios para ello*/

/*D. Escriban la instrucción necesaria para lograr ese comportamiento. ¿quién la debería escribir?*/
GRANT UPDATE, DELETE ON MBDA.miembros TO bd2160666;
/*El administrador de la base de datos*/

/*E. Escriban las instrucciones necesarias para importar los datos de esa tabla a su base de datos.*/
DROP TABLE miembros;

CREATE SEQUENCE id_consec
START WITH 1
INCREMENT BY 1;

INSERT INTO Miembro 
SELECT  id_consec.nextval,tipo,numero, pais, correo FROM MBDA.miembros;

SELECT * FROM miembro
ORDER BY id_;

/*F. Para esta nueva funcionalidad, adicionen este nuevo caso de uso a funciones
COMO Administrador
QUIERO importar miembros de una fuente externa
PARA PODER contar con esta información
HECHO
*/

/*CRUDE*/
CREATE OR REPLACE PACKAGE PC_REGISTROS IS
    PROCEDURE AD_Registro (xcodigoCarrera IN VARCHAR, xnombreSegmento IN VARCHAR, xnombreVersion IN VARCHAR, xciclistaId IN NUMBER, tiempo IN NUMBER, xposicion IN NUMBER, xrevision IN VARCHAR, xdificultad IN VARCHAR, xcomentario IN VARCHAR);
    PROCEDURE MO_Registro (xnumero IN NUMBER, xcodigoCarrera IN VARCHAR, xrevision IN VARCHAR, xcomentario IN VARCHAR);
    PROCEDURE EL_Registro (xnumero IN NUMBER, xcodigoCarrera IN VARCHAR);
    PROCEDURE AD_Foto (xnumeroRegistro IN NUMBER, xcodigoCarrera IN VARCHAR, xTFoto IN VARCHAR);
    PROCEDURE MO_Foto (xnumeroRegistro IN NUMBER, xcodigoCarrera IN VARCHAR, xTFoto IN VARCHAR);
    
    FUNCTION CO_Registro RETURN SYS_REFCURSOR;
    FUNCTION CO_Foto RETURN SYS_REFCURSOR;
END PC_REGISTROS;

CREATE OR REPLACE PACKAGE PC_CARRERAS IS
    PROCEDURE AD_Punto (xcarreraCodigo IN VARCHAR, xorden IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER);
    PROCEDURE AD_Carrera (xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR); 
    PROCEDURE AD_PropiedadDe (xmiembroId IN NUMBER, xcarreraCodigo IN VARCHAR, xporcentaje IN VARCHAR);
    PROCEDURE MO_Punto (xcarreraCodigo IN VARCHAR, xtipo IN VARCHAR, xtiempoLimite IN NUMBER);
    PROCEDURE EL_Carrera (xCodigo IN VARCHAR);
    PROCEDURE EL_PropiedadDe (xmiembroId IN NUMBER, xcarreraCodigo IN VARCHAR);
    
    FUNCTION CO_Punto RETURN SYS_REFCURSOR;
    FUNCTION CO_Carrera  RETURN SYS_REFCURSOR;
    FUNCTION CO_PropiedadDe  RETURN SYS_REFCURSOR;
END PC_CARRERAS;

CREATE OR REPLACE PACKAGE PC_MIEMBROS IS
    PROCEDURE AD_Miembro (xidt IN VARCHAR, xidn IN NUMBER, xpais IN VARCHAR, xcorreo IN VARCHAR);
    PROCEDURE AD_Persona (xmiembroId IN NUMBER, xnombre IN VARCHAR);
    PROCEDURE AD_Empresa (xmiembroId IN NUMBER, xrazonSocial IN VARCHAR, xrepresentanteDe IN NUMBER);
    PROCEDURE AD_Ciclista (xpersonaId IN NUMBER, xpersonaNombre IN VARCHAR, xnacimiento IN DATE, xcategoria IN NUMBER);
    PROCEDURE MO_Miembro (xid_ IN NUMBER, xcorreo IN VARCHAR);
    PROCEDURE EL_Miembro (xid_ IN NUMBER);
    
    FUNCTION CO_Miembro RETURN SYS_REFCURSOR;
    FUNCTION CO_Persona RETURN SYS_REFCURSOR;
    FUNCTION CO_Empresa RETURN SYS_REFCURSOR;
    FUNCTION CO_Ciclista RETURN SYS_REFCURSOR;
END PC_MIEMBROS;

/*CRUDI*/
CREATE SEQUENCE SECUENCIA_AUTO3
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PACKAGE BODY PC_MIEMBROS IS
    PROCEDURE AD_Miembro (xidt IN VARCHAR, xidn IN NUMBER, xpais IN VARCHAR, xcorreo IN VARCHAR) IS
        BEGIN
          INSERT INTO Miembro (id_,idt,idn,pais,correo)VALUES(SECUENCIA_AUTO3.nextval,xidt,xidn,xpais,xcorreo);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar miembro.');
        END;
    PROCEDURE AD_Persona (xmiembroId IN NUMBER, xnombre IN VARCHAR) IS
        BEGIN
          INSERT INTO Persona (miembro_id,nombre)VALUES(xmiembroId, xnombre);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar persona.');
        END;
    PROCEDURE AD_Empresa (xmiembroId IN NUMBER, xrazonSocial IN VARCHAR, xrepresentanteDe IN NUMBER) IS
        BEGIN
            INSERT INTO Empresa (miembro_id,razonSocial,representante_de) VALUES (xmiembroId, xrazonSocial, xrepresentanteDe);
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar empresa.');
        END;
    PROCEDURE AD_Ciclista (xpersonaId IN NUMBER, xpersonaNombre IN VARCHAR, xnacimiento IN DATE, xcategoria IN NUMBER) IS
        BEGIN
            INSERT INTO Ciclista (persona_id,persona_nombre,nacimiento,categoria) VALUES (xpersonaId, xpersonaNombre, xnacimiento, xcategoria);
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar ciclista.');
        END;
    PROCEDURE MO_Miembro (xid_ IN NUMBER, xcorreo IN VARCHAR) IS
        BEGIN
            UPDATE Miembro SET correo=xcorreo WHERE xid_=id_;         
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar ciclista.');
        END;
    PROCEDURE EL_Miembro (xid_ IN NUMBER) IS
        BEGIN
            DELETE FROM Miembro WHERE xid_=id_;        
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar ciclista.');
        END;
    FUNCTION CO_Miembro RETURN SYS_REFCURSOR IS CO_MI SYS_REFCURSOR;
        BEGIN
            OPEN CO_MI FOR
                SELECT * FROM Miembro;
            RETURN CO_MI;
        END;
    FUNCTION CO_Persona RETURN SYS_REFCURSOR IS CO_PE SYS_REFCURSOR;
        BEGIN
            OPEN CO_PE FOR
                SELECT * FROM Persona;
            RETURN CO_PE;
        END;
    FUNCTION CO_Empresa RETURN SYS_REFCURSOR IS CO_EM SYS_REFCURSOR;
        BEGIN
            OPEN CO_EM FOR
                SELECT * FROM Empresa;
            RETURN CO_EM;
        END;
    FUNCTION CO_Ciclista RETURN SYS_REFCURSOR IS CO_CI SYS_REFCURSOR;
        BEGIN
            OPEN CO_CI FOR
                SELECT * FROM Ciclista;
            RETURN CO_CI;
        END;
END PC_MIEMBROS;

CREATE SEQUENCE SECUENCIA_AUTO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PACKAGE BODY PC_REGISTROS IS
    PROCEDURE AD_Registro (xcodigoCarrera IN VARCHAR, xnombreSegmento IN VARCHAR, xnombreVersion IN VARCHAR, xciclistaId IN NUMBER, tiempo IN NUMBER, xposicion IN NUMBER, xrevision IN VARCHAR, xdificultad IN VARCHAR, xcomentario IN VARCHAR) IS
        BEGIN
          INSERT INTO Registro (numero, codigo_carrera, nombre_segmento, nombre_version, ciclista_id, fecha, tiempo, posicion, revision, dificultad, comentario) VALUES (SECUENCIA_AUTO.nextval, xcodigoCarrera, xnombreSegmento, xnombreVersion, xciclistaId, SYSDATE, tiempo, xposicion, xrevision, xdificultad, xcomentario);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar registro.');
        END;
    PROCEDURE MO_Registro (xnumero IN NUMBER, xcodigoCarrera IN VARCHAR, xrevision IN VARCHAR, xcomentario IN VARCHAR) IS
        BEGIN
          UPDATE Registro SET revision = xrevision WHERE xnumero = numero AND xcodigoCarrera = codigo_carrera;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar registro.');
        END;
    PROCEDURE EL_Registro (xnumero IN NUMBER, xcodigoCarrera IN VARCHAR) IS
        BEGIN
          DELETE FROM Registro WHERE xnumero = numero AND xcodigoCarrera = codigo_carrera;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede eliminar registro.');
        END;
    PROCEDURE AD_Foto (xnumeroRegistro IN NUMBER, xcodigoCarrera IN VARCHAR, xTFoto IN VARCHAR) IS
        BEGIN
          INSERT INTO Foto (numero_registro, codigo_carrera, TFoto) VALUES (xnumeroRegistro, xcodigoCarrera, xTFoto);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede adicionar la foto.');
        END;
    PROCEDURE MO_Foto (xnumeroRegistro IN NUMBER, xcodigoCarrera IN VARCHAR, xTFoto IN VARCHAR) IS
        BEGIN
          UPDATE Foto SET TFoto=xTFoto WHERE xnumeroRegistro=numero_registro AND xcodigoCarrera=codigo_carrera;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar la foto.');
        END;
        
    FUNCTION CO_Registro RETURN SYS_REFCURSOR IS CO_RE SYS_REFCURSOR;
        BEGIN
            OPEN CO_RE FOR
                SELECT * FROM Registro;
            RETURN CO_RE;
        END;     
    FUNCTION CO_Foto RETURN SYS_REFCURSOR IS CO_FO SYS_REFCURSOR;
        BEGIN
            OPEN CO_FO FOR
                SELECT * FROM Foto;
            RETURN CO_FO;
        END;
END PC_REGISTROS;

CREATE SEQUENCE SECUENCIA_AUTO2
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE PACKAGE BODY PC_CARRERAS IS
    PROCEDURE AD_Punto (xcarreraCodigo IN VARCHAR, xorden IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER) IS
        BEGIN
          INSERT INTO Punto (carrera_codigo, orden, nombre, tipo, distancia, timpoLimite) VALUES (xcarreraCodigo, xorden, xnombre, xtipo, xdistancia, xtiempoLimite);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar punto.');
        END;
    PROCEDURE AD_Carrera (xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR) IS
        BEGIN
          INSERT INTO Carrera (codigo, nombre, pais, categoria, periodicidad) VALUES (SECUENCIA_AUTO2.nextval, xnombre, xpais, xcategoria, xperiodicidad);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar carrera.');
        END;
    PROCEDURE AD_PropiedadDe (xmiembroId IN NUMBER, xcarreraCodigo IN VARCHAR, xporcentaje IN VARCHAR) IS
        BEGIN
          INSERT INTO PropiedadDe (miembro_id,carrera_codigo,porcentaje) VALUES (xmiembroId, xcarreraCodigo, xporcentaje);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar una propiedad.');
        END;
    PROCEDURE MO_Punto (xcarreraCodigo IN VARCHAR, xtipo IN VARCHAR, xtiempoLimite IN NUMBER) IS
        BEGIN
          UPDATE Punto SET timpoLimite=xtiempoLimite WHERE xcarreraCodigo = carrera_codigo;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar el punto.');
        END;
    PROCEDURE EL_Carrera (xCodigo IN VARCHAR) IS
        BEGIN
            DELETE FROM Carrera WHERE xCodigo = codigo;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
                RAISE_APPLICATION_ERROR (-20039,'No se puede eliminar esta carrera.');   
        END;
    PROCEDURE EL_PropiedadDe (xmiembroId IN NUMBER, xcarreraCodigo IN VARCHAR) IS
        BEGIN
            DELETE FROM PropiedadDe WHERE xmiembroId = miembro_id AND xcarreraCodigo = carrera_codigo;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
                RAISE_APPLICATION_ERROR (-20039,'No se puede eliminar PropiedadDe.');
        END;
    FUNCTION CO_Punto RETURN SYS_REFCURSOR IS CO_PU SYS_REFCURSOR;
        BEGIN
            OPEN CO_PU FOR
                SELECT * FROM Punto;
            RETURN CO_PU;
        END;
    FUNCTION CO_Carrera RETURN SYS_REFCURSOR IS CO_CA SYS_REFCURSOR;
        BEGIN
            OPEN CO_CA FOR
                SELECT * FROM Carrera;
            RETURN CO_CA;
        END;
    FUNCTION CO_PropiedadDe RETURN SYS_REFCURSOR IS CO_PD SYS_REFCURSOR;
        BEGIN
            OPEN CO_PD FOR
                SELECT * FROM PropiedadDe;
            RETURN CO_PD;
        END;
END PC_CARRERAS;

/*CRUDOK*/
PA_ADMINISTRADOR.Ad_Carrera ('AndesRace','Colombia',2,'M');
PA_ADMINISTRADOR.EL_Carrera ('1');
PA_PARTICIPANTES.AD_Persona (1,'Javier');
PA_PARTICIPANTES.MO_Miembro (1,javier20@gmail.com);
PA_PARTICIPANTES.EL_Miembro (1);
/*CRUDNOOK*/
PA_ADMINISTRADOR.EL_Carrera (1,6); --Se eliminan de a uno
PA_PARTICIPANTES.EL_Registro ('1',2,'www.yahooblog.com/ciclista1/album'); --Actor no esta en crud Registrp
PA_ADMINISTRADOR.AD_Persona  (1,'Javier'); --Actor no esta en crud Miembro

/*ActoresE*/
CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR IS
    PROCEDURE AD_CARRERA(xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR);
    PROCEDURE AD_PUNTO(xcarreraCodigo IN VARCHAR, xorden IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER);
    PROCEDURE MO_PUNTO (xcarreraCodigo IN VARCHAR, xtipo IN VARCHAR, xtiempoLimite IN NUMBER);
    PROCEDURE EL_CARRERA(xcodigo IN VARCHAR);
END PA_ADMINISTRADOR;

CREATE OR REPLACE PACKAGE PA_PARTICIPANTES IS
    PROCEDURE AD_PERSONA (xmiembroId IN NUMBER, xnombre IN VARCHAR);
    PROCEDURE AD_EMPRESA (xmiembroId IN NUMBER, xrazonSocial IN VARCHAR, xrepresentanteDe IN NUMBER);
    PROCEDURE MO_MIEMBRO (xid_ IN NUMBER, xcorreo IN VARCHAR);
END PA_PARTICIPANTES;

/*ActoresI*/
CREATE OR REPLACE PACKAGE BODY PA_PARTICIPANTES IS
    PROCEDURE AD_PERSONA (xmiembroId IN NUMBER, xnombre IN VARCHAR) IS
        BEGIN
            PC_MIEMBROS.AD_Persona (xmiembroId, xnombre);
        END;
    PROCEDURE AD_EMPRESA (xmiembroId IN NUMBER, xrazonSocial IN VARCHAR, xrepresentanteDe IN NUMBER) IS
        BEGIN
            PC_MIEMBROS.AD_Empresa (xmiembroId, xrazonSocial,xrepresentanteDe);
        END;
    PROCEDURE MO_MIEMBRO (xid_ IN NUMBER, xcorreo IN VARCHAR) IS
        BEGIN
            PC_MIEMBROS.MO_Miembro (xid_, xcorreo);
        END;
END PA_PARTICIPANTES;
        
CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR IS
    PROCEDURE AD_CARRERA(xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR) IS
        BEGIN
            PC_CARRERAS.AD_Carrera (xnombre,xpais,xcategoria,xperiodicidad);
        END;
    PROCEDURE AD_PUNTO(xcarreraCodigo IN VARCHAR, xorden IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER) IS
        BEGIN
            PC_CARRERAS.AD_Punto (xcarreraCodigo,xorden,xnombre,xtipo,xdistancia,xtiempoLimite);
        END;
    PROCEDURE MO_PUNTO (xcarreraCodigo IN VARCHAR, xtipo IN VARCHAR, xtiempoLimite IN NUMBER) IS
        BEGIN
            PC_CARRERAS.MO_Punto (xcarreraCodigo,xtipo,xtiempoLimite);
        END;
    PROCEDURE EL_CARRERA(xcodigo IN VARCHAR) IS
        BEGIN
            PC_CARRERAS.EL_Carrera (xcodigo);
        END;
END PA_ADMINISTRADOR;

/*SEGURIDAD OK*/


/*SEGURIDAD NOOK*/
       
/* b */
GRANT EXECUTE ON PA_ADMINISTRADOR TO bd2162405; --Juan Pablo Espinosa

/*C*/
CREATE ROLE PARTICIPANTEAllow;
GRANT PARTICIPANTEAllow TO bd2162405; --Juan Pablo Espinosa
GRANT PARTICIPANTEAllow TO bd2159965; --Juan Pablo Contreras

GRANT EXECUTE ON PA_PARTICIPANTES TO PARTICIPANTEAllow;

DROP ROLE PARTICIPANTEAllow;

--ELIMINAR TODO
BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
