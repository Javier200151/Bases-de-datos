CREATE TABLE musician(m_no NUMBER(15) NOT NULL,m_name VARCHAR(30),born DATE,died DATE,born_in NUMBER(15),living_in NUMBER(15));
CREATE TABLE band(band_no NUMBER(15) NOT NULL,band_name VARCHAR(30),band_home NUMBER(15) NOT NULL,band_type VARCHAR(10),b_date DATE,band_contact NUMBER(15) NOT NULL);
CREATE TABLE composer(comp_no NUMBER(15) NOT NULL,comp_is NUMBER(15) NOT NULL,comp_type VARCHAR(10));
CREATE TABLE performer(perf_no NUMBER(15) NOT NULL,perf_is NUMBER(15),instrument VARCHAR(10) NOT NULL,perf_type VARCHAR(10));
CREATE TABLE performance(pfrmnc_no NUMBER(15) NOT NULL,gave NUMBER(15),performed NUMBER(11),conducted_by NUMBER(11),performed_in NUMBER(11));
CREATE TABLE concert(concert_no	NUMBER(15) NOT NULL,concert_venue	varchar(30),concert_in	NUMBER(11) NOT NULL,con_date DATE,concert_orgniser NUMBER(11));
CREATE TABLE composition(c_no NUMBER(15) NOT NULL,comp_date DATE,c_title VARCHAR(40) NOT NULL,c_in NUMBER(11));
CREATE TABLE place(place_no	NUMBER(15) NOT NULL,place_town VARCHAR(30),place_country VARCHAR(30));
CREATE TABLE has_composed(cmpr_no NUMBER(15) NOT NULL,cmpn_no NUMBER(11) NOT NULL);
CREATE TABLE plays_in(player NUMBER(15)	NOT NULL,band_id NUMBER(11) NOT NULL);

ALTER TABLE musician ADD CONSTRAINT PK_musician PRIMARY KEY(m_no);
ALTER TABLE musician ADD CONSTRAINT FK_musician_place FOREIGN KEY(born_in) REFERENCES place(place_no);
ALTER TABLE musician ADD CONSTRAINT FK_musician_place1 FOREIGN KEY(living_in) REFERENCES place(place_no);

ALTER TABLE band ADD  CONSTRAINT  PK_band  PRIMARY KEY(band_no);
ALTER TABLE band ADD CONSTRAINT UK_band_band_name UNIQUE (band_name);
ALTER TABLE band ADD CONSTRAINT FK_band_place FOREIGN KEY(band_home) REFERENCES place(place_no);
ALTER TABLE band ADD CONSTRAINT FK_band_musician  FOREIGN KEY(band_contact) REFERENCES musician(m_no);

ALTER TABLE composer ADD CONSTRAINT PK_composer PRIMARY KEY(comp_no);
ALTER TABLE composer ADD CONSTRAINT FK_composer_musician FOREIGN KEY(comp_is) REFERENCES musician(m_no);

ALTER TABLE composition ADD CONSTRAINT PK_composition PRIMARY KEY(c_no);
ALTER TABLE composition ADD CONSTRAINT UK_composition_c_title UNIQUE (c_title);
ALTER TABLE composition ADD CONSTRAINT FK_compostion_place FOREIGN KEY(c_in) REFERENCES place(place_no);

ALTER TABLE concert ADD CONSTRAINT PK_concert PRIMARY KEY(concert_no);
ALTER TABLE concert ADD CONSTRAINT FK_concert_performance FOREIGN KEY(concert_in) REFERENCES place(place_no);
ALTER TABLE concert ADD CONSTRAINT FK_concert_musician FOREIGN KEY(concert_orgniser) REFERENCES musician(m_no);

ALTER TABLE performance ADD CONSTRAINT PK_performance PRIMARY KEY(pfrmnc_no);
ALTER TABLE performance ADD CONSTRAINT FK_performance_band FOREIGN KEY(gave) REFERENCES band(band_no);
ALTER TABLE performance ADD CONSTRAINT FK_performance_composition FOREIGN KEY(performed) REFERENCES composition(c_no);
ALTER TABLE performance ADD CONSTRAINT FK_performance_musician FOREIGN KEY(conducted_by) REFERENCES musician(m_no);
ALTER TABLE performance ADD CONSTRAINT FK_performance_concert FOREIGN KEY(performed_in) REFERENCES concert(concert_no);

ALTER TABLE performer ADD CONSTRAINT PK_performer PRIMARY KEY(perf_no);
ALTER TABLE performer ADD CONSTRAINT FK_performer_musician FOREIGN KEY(perf_is) REFERENCES musician(m_no);

ALTER TABLE place ADD CONSTRAINT PK_place PRIMARY KEY(place_no);
ALTER TABLE place ADD CONSTRAINT UK_place_place_town UNIQUE (place_town);

ALTER TABLE has_composed ADD CONSTRAINT PK_has_composed PRIMARY KEY(cmpn_no,cmpr_no);
ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composer FOREIGN KEY (cmpr_no) REFERENCES composer(comp_no);
ALTER TABLE has_composed ADD CONSTRAINT FK_has_composed_composition FOREIGN KEY (cmpn_no) REFERENCES composition(c_no);

ALTER TABLE plays_in ADD CONSTRAINT PK_plays_in PRIMARY KEY(player,band_id);
ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_band FOREIGN KEY(band_id) REFERENCES band(band_no);
ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_performer FOREIGN KEY(player) REFERENCES performer(perf_no); 

/*musician*/
/*SELECT CONCAT('INSERT INTO musician VALUES(',m_no,',',m_name,',','TO_DATE(',REPLACE(born,'-','/'),', yyyy/mm/dd)',',',CASE WHEN died IS NULL THEN 'null'  ELSE CONCAT('TO_DATE(',REPLACE(died,'-','/'),', yyyy/mm/dd)') END, ',',born_in,',',living_in,');') FROM musician*/
INSERT INTO musician VALUES(1,'Fred Bloggs',TO_DATE('1948/01/02','YYYY/MM/DD'),null,1,2);
INSERT INTO musician VALUES(2,'John Smith',TO_DATE('1950/03/03','YYYY/MM/DD'),null,3,4);
INSERT INTO musician VALUES(3,'Helen Smyth',TO_DATE('1948/08/08','YYYY/MM/DD'),null,4,5);
INSERT INTO musician VALUES(4,'Harriet Smithson',TO_DATE('1909/05/09','YYYY/MM/DD'),TO_DATE('1980/09/20','YYYY/MM/DD'),5,6);
INSERT INTO musician VALUES(5,'James First',TO_DATE('1965/06/10','YYYY/MM/DD'),null,7,7);
INSERT INTO musician VALUES(6,'Theo Mengel',TO_DATE('1948/08/12','YYYY/MM/DD'),null,7,1);
INSERT INTO musician VALUES(7,'Sue Little',TO_DATE('1945/02/21','YYYY/MM/DD'),null,8,9);
INSERT INTO musician VALUES(8,'Harry Forte',TO_DATE('1951/02/28','YYYY/MM/DD'),null,1,8);
INSERT INTO musician VALUES(9,'Phil Hot',TO_DATE('1942/06/30','YYYY/MM/DD'),null,2,7);
INSERT INTO musician VALUES(10,'Jeff Dawn',TO_DATE('1945/12/12','YYYY/MM/DD'),null,3,6);
INSERT INTO musician VALUES(11,'Rose Spring',TO_DATE('1948/05/25','YYYY/MM/DD'),null,4,5);
INSERT INTO musician VALUES(12,'Davis Heavan',TO_DATE('1975/10/03','YYYY/MM/DD'),null,5,4);
INSERT INTO musician VALUES(13,'Lovely Time',TO_DATE('1948/12/28','YYYY/MM/DD'),null,6,3);
INSERT INTO musician VALUES(14,'Alan Fluff',TO_DATE('1935/01/15','YYYY/MM/DD'),TO_DATE('1997/05/15','YYYY/MM/DD'),7,2);
INSERT INTO musician VALUES(15,'Tony Smythe',TO_DATE('1932/04/02','YYYY/MM/DD'),null,8,1);
INSERT INTO musician VALUES(16,'James Quick',TO_DATE('1924/08/08','YYYY/MM/DD'),null,9,2);
INSERT INTO musician VALUES(17,'Freda Miles',TO_DATE('1920/07/04','YYYY/MM/DD'),null,9,3);
INSERT INTO musician VALUES(18,'Elsie James',TO_DATE('1947/05/06','YYYY/MM/DD'),null,8,5);
INSERT INTO musician VALUES(19,'Andy Jones',TO_DATE('1958/10/08','YYYY/MM/DD'),null,7,6);
INSERT INTO musician VALUES(20,'Louise Simpson',TO_DATE('1948/01/10','YYYY/MM/DD'),TO_DATE('1998/02/11','YYYY/MM/DD'),6,6);
INSERT INTO musician VALUES(21,'James Steeple',TO_DATE('1947/01/10','YYYY/MM/DD'),null,5,6);
INSERT INTO musician VALUES(22,'Steven Chaytors',TO_DATE('1956/03/11','YYYY/MM/DD'),null,6,7);

/*place*/
/*SELECT CONCAT('INSERT INTO place VALUES(',place_no,',',place_town,',',place_country,');') FROM place*/
INSERT INTO place VALUES(1,'Manchester','England');
INSERT INTO place VALUES(2,'Edinburgh','Scotland');
INSERT INTO place VALUES(3,'Salzburg','Austria');
INSERT INTO place VALUES(4,'New York','USA');
INSERT INTO place VALUES(5,'Birmingham','England');
INSERT INTO place VALUES(6,'Glasgow','Scotland');
INSERT INTO place VALUES(7,'London','England');
INSERT INTO place VALUES(8,'Chicago','USA');
INSERT INTO place VALUES(9,'Amsterdam','Netherlands');

/*performer*/
/*SELECT CONCAT('INSERT INTO performer VALUES(',perf_no,',',perf_is,',',instrument,',',perf_type,');') FROM performer*/
INSERT INTO performer VALUES(1,2,'violin','classical');
INSERT INTO performer VALUES(2,4,'viola','classical');
INSERT INTO performer VALUES(3,6,'banjo','jazz');
INSERT INTO performer VALUES(4,8,'violin','classical');
INSERT INTO performer VALUES(5,12,'guitar','jazz');
INSERT INTO performer VALUES(6,14,'violin','classical');
INSERT INTO performer VALUES(7,16,'trumpet','jazz');
INSERT INTO performer VALUES(8,18,'viola','classical');
INSERT INTO performer VALUES(9,20,'bass','jazz');
INSERT INTO performer VALUES(10,2,'flute','jazz');
INSERT INTO performer VALUES(11,20,'cornet','jazz');
INSERT INTO performer VALUES(12,6,'violin','jazz');
INSERT INTO performer VALUES(13,8,'drums','jazz');
INSERT INTO performer VALUES(14,10,'violin','classical');
INSERT INTO performer VALUES(15,12,'cello','classical');
INSERT INTO performer VALUES(16,14,'viola','classical');
INSERT INTO performer VALUES(17,16,'flute','jazz');
INSERT INTO performer VALUES(18,18,'guitar','not known');
INSERT INTO performer VALUES(19,20,'trombone','jazz');
INSERT INTO performer VALUES(20,3,'horn','jazz');
INSERT INTO performer VALUES(21,5,'violin','jazz');
INSERT INTO performer VALUES(22,7,'cello','classical');
INSERT INTO performer VALUES(23,2,'bass','jazz');
INSERT INTO performer VALUES(24,4,'violin','jazz');
INSERT INTO performer VALUES(25,6,'drums','classical');
INSERT INTO performer VALUES(26,8,'clarinet','jazz');
INSERT INTO performer VALUES(27,10,'bass','jazz');
INSERT INTO performer VALUES(28,12,'viola','classical');
INSERT INTO performer VALUES(29,18,'cello','classical');

/*composer*/
/*SELECT CONCAT('INSERT INTO composer VALUES(',comp_no,',',comp_is,',',comp_type,');') FROM composer*/
INSERT INTO composer VALUES(1,1,'jazz');
INSERT INTO composer VALUES(2,3,'classical');
INSERT INTO composer VALUES(3,5,'jazz');
INSERT INTO composer VALUES(4,7,'classical');
INSERT INTO composer VALUES(5,9,'jazz');
INSERT INTO composer VALUES(6,11,'rock');
INSERT INTO composer VALUES(7,13,'classical');
INSERT INTO composer VALUES(8,15,'jazz');
INSERT INTO composer VALUES(9,17,'classical');
INSERT INTO composer VALUES(10,19,'jazz');
INSERT INTO composer VALUES(11,10,'rock');
INSERT INTO composer VALUES(12,8,'jazz');

/*band*/
/*SELECT CONCAT('INSERT INTO band VALUES(',band_no,',',band_name,',',band_home,',',band_type,',',CASE WHEN b_date IS NULL THEN 'null' ELSE CONCAT('TO_DATE(',REPLACE(b_date,'-','/'),', yyyy/mm/dd)') END, ',',band_contact,');') FROM band*/
INSERT INTO band VALUES(1,'ROP',5,'classical',TO_DATE('1930/01/01','YYYY/MM/DD'),11);
INSERT INTO band VALUES(2,'AASO',6,'classical',null,10);
INSERT INTO band VALUES(3,'The J Bs',8,'jazz',null,12);
INSERT INTO band VALUES(4,'BBSO',9,'classical',null,21);
INSERT INTO band VALUES(5,'The left Overs',2,'jazz',null,8);
INSERT INTO band VALUES(6,'Somebody Loves this',1,'jazz',null,6);
INSERT INTO band VALUES(7,'Oh well',4,'classical',null,3);
INSERT INTO band VALUES(8,'Swinging strings',4,'classical',null,7);
INSERT INTO band VALUES(9,'The Rest',9,'jazz',null,16);

/*plays_in*/
/*SELECT CONCAT('INSERT INTO plays_in VALUES(',player,',',band_id,');') FROM plays_in*/
INSERT INTO plays_in VALUES(1,1);
INSERT INTO plays_in VALUES(1,7);
INSERT INTO plays_in VALUES(3,1);
INSERT INTO plays_in VALUES(4,1);
INSERT INTO plays_in VALUES(4,7);
INSERT INTO plays_in VALUES(5,1);
INSERT INTO plays_in VALUES(6,1);
INSERT INTO plays_in VALUES(6,7);
INSERT INTO plays_in VALUES(7,1);
INSERT INTO plays_in VALUES(8,1);
INSERT INTO plays_in VALUES(8,7);
INSERT INTO plays_in VALUES(10,2);
INSERT INTO plays_in VALUES(12,2);
INSERT INTO plays_in VALUES(13,2);
INSERT INTO plays_in VALUES(14,2);
INSERT INTO plays_in VALUES(14,8);
INSERT INTO plays_in VALUES(15,2);
INSERT INTO plays_in VALUES(15,8);
INSERT INTO plays_in VALUES(17,2);
INSERT INTO plays_in VALUES(18,2);
INSERT INTO plays_in VALUES(19,3);
INSERT INTO plays_in VALUES(20,3);
INSERT INTO plays_in VALUES(21,4);
INSERT INTO plays_in VALUES(22,4);
INSERT INTO plays_in VALUES(23,4);
INSERT INTO plays_in VALUES(25,5);
INSERT INTO plays_in VALUES(26,6);
INSERT INTO plays_in VALUES(27,6);
INSERT INTO plays_in VALUES(28,7);
INSERT INTO plays_in VALUES(28,8);
INSERT INTO plays_in VALUES(29,7);

/*composition*/
/*SELECT CONCAT('INSERT INTO composition VALUES(',c_no,',',CASE WHEN comp_date IS NULL THEN 'null' ELSE CONCAT('TO_DATE(',REPLACE(comp_date,'-','/'),', 'yyyy/mm/dd)'') END, ',',c_title,',',c_in,');') FROM composition */
INSERT INTO composition VALUES(1,TO_DATE('1975/06/17','YYYY/MM/DD'),'Opus 1',1);
INSERT INTO composition VALUES(2,TO_DATE('1976/07/21','YYYY/MM/DD'),'Here Goes',2);
INSERT INTO composition VALUES(3,TO_DATE('1981/12/14','YYYY/MM/DD'),'Valiant Knight',3);
INSERT INTO composition VALUES(4,TO_DATE('1982/01/12','YYYY/MM/DD'),'Little Piece',4);
INSERT INTO composition VALUES(5,TO_DATE('1985/03/13','YYYY/MM/DD'),'Simple Song',5);
INSERT INTO composition VALUES(6,TO_DATE('1986/04/14','YYYY/MM/DD'),'Little Swing Song',6);
INSERT INTO composition VALUES(7,TO_DATE('1987/05/13','YYYY/MM/DD'),'Fast Journey',7);
INSERT INTO composition VALUES(8,TO_DATE('1976/02/14','YYYY/MM/DD'),'Simple Love Song',8);
INSERT INTO composition VALUES(9,TO_DATE('1982/01/21','YYYY/MM/DD'),'Complex Rythms',9);
INSERT INTO composition VALUES(10,TO_DATE('1985/02/23','YYYY/MM/DD'),'Drumming Rythms',9);
INSERT INTO composition VALUES(11,TO_DATE('1978/03/18','YYYY/MM/DD'),'Fast Drumming',8);
INSERT INTO composition VALUES(12,TO_DATE('1984/08/13','YYYY/MM/DD'),'Slow Song',7);
INSERT INTO composition VALUES(13,TO_DATE('1968/09/14','YYYY/MM/DD'),'Blue Roses',6);
INSERT INTO composition VALUES(14,TO_DATE('1983/11/15','YYYY/MM/DD'),'Velvet Rain',5);
INSERT INTO composition VALUES(15,TO_DATE('1982/05/16','YYYY/MM/DD'),'Cold Wind',4);
INSERT INTO composition VALUES(16,TO_DATE('1983/06/18','YYYY/MM/DD'),'After the Wind Blows',3);
INSERT INTO composition VALUES(17,null,'A Simple Piece',2);
INSERT INTO composition VALUES(18,TO_DATE('1985/01/12','YYYY/MM/DD'),'Long Rythms',1);
INSERT INTO composition VALUES(19,TO_DATE('1988/02/12','YYYY/MM/DD'),'Eastern Wind',1);
INSERT INTO composition VALUES(20,null,'Slow Symphony Blowing',2);
INSERT INTO composition VALUES(21,TO_DATE('1990/07/12','yyyy/mm/dd'),'A Last Song',6);

/*has_composed*/
/*SELECT CONCAT('INSERT INTO has_composed VALUES(',cmpr_no,',',cmpn_no,');') FROM has_composed*/
INSERT INTO has_composed VALUES(1,1);
INSERT INTO has_composed VALUES(1,8);
INSERT INTO has_composed VALUES(2,11);
INSERT INTO has_composed VALUES(3,2);
INSERT INTO has_composed VALUES(3,13);
INSERT INTO has_composed VALUES(3,14);
INSERT INTO has_composed VALUES(3,18);
INSERT INTO has_composed VALUES(4,12);
INSERT INTO has_composed VALUES(4,20);
INSERT INTO has_composed VALUES(5,3);
INSERT INTO has_composed VALUES(5,13);
INSERT INTO has_composed VALUES(5,14);
INSERT INTO has_composed VALUES(6,15);
INSERT INTO has_composed VALUES(6,21);
INSERT INTO has_composed VALUES(7,4);
INSERT INTO has_composed VALUES(7,9);
INSERT INTO has_composed VALUES(8,16);
INSERT INTO has_composed VALUES(9,5);
INSERT INTO has_composed VALUES(9,10);
INSERT INTO has_composed VALUES(10,17);
INSERT INTO has_composed VALUES(11,6);
INSERT INTO has_composed VALUES(12,7);
INSERT INTO has_composed VALUES(12,19);

/*concert*/
/*SELECT CONCAT('INSERT INTO concert VALUES(',concert_no,',',concert_venue,',',concert_in,',','TO_DATE(',REPLACE(con_date,'-','/'),', yyyy/mm/dd)',',',concert_orgniser,');') FROM concert*/
INSERT INTO concert VALUES(1,'Bridgewater Hall',1,TO_DATE('1995/01/06','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(2,'Bridgewater Hall',1,TO_DATE('1996/05/08','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(3,'Usher Hall',2,TO_DATE('1995/06/03','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(4,'Assembly Rooms',2,TO_DATE('1997/09/20','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(5,'Festspiel Haus',3,TO_DATE('1995/02/21','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(6,'Royal Albert Hall',7,TO_DATE('1993/04/12','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(7,'Concertgebouw',9,TO_DATE('1993/05/14','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(8,'Metropolitan',4,TO_DATE('1997/06/15','YYYY/MM/DD'),21);

/*performance*/
/*SELECT CONCAT('INSERT INTO performance VALUES(',pfrmnc_no,',',gave,',',performed,',',conducted_by,',',performed_in,');') FROM performance*/
INSERT INTO performance VALUES(1,1,1,21,1);
INSERT INTO performance VALUES(2,1,3,21,1);
INSERT INTO performance VALUES(3,1,5,21,1);
INSERT INTO performance VALUES(4,1,2,1,2);
INSERT INTO performance VALUES(5,2,4,21,2);
INSERT INTO performance VALUES(6,2,6,21,2);
INSERT INTO performance VALUES(7,4,19,9,3);
INSERT INTO performance VALUES(8,4,20,10,3);
INSERT INTO performance VALUES(9,5,12,10,4);
INSERT INTO performance VALUES(10,5,13,11,4);
INSERT INTO performance VALUES(11,3,5,13,5);
INSERT INTO performance VALUES(12,3,6,13,5);
INSERT INTO performance VALUES(13,3,7,13,5);
INSERT INTO performance VALUES(14,6,20,14,6);
INSERT INTO performance VALUES(15,8,12,15,7);
INSERT INTO performance VALUES(16,9,16,21,8);
INSERT INTO performance VALUES(17,9,17,21,8);
INSERT INTO performance VALUES(18,9,18,21,8);
INSERT INTO performance VALUES(19,9,19,21,8);
INSERT INTO performance VALUES(20,4,12,10,3);

/*Poblado no Ok*/
INSERT INTO place VALUES(null,'Edinburgh','Scotland');
INSERT INTO musician VALUES(null,2,TO_DATE('1969/05/21','YYYY/MM/DD'),null,1,2);
INSERT INTO plays_in VALUES(null,null);

SELECT m_name AS organiser FROM musician,concert 
WHERE concert_venue= 'Assembly Rooms' AND con_date>01/02/97 AND concert_orgniser = m_no

SELECT m_name FROM musician,performer,place
 WHERE place_no = born_in AND place_country='England' AND perf_is = m_no AND (instrument='violin' instrument = 'guitar')

SELECT DISTINCT m_name, con_date, place_town FROM musician,concert ,place, performance
WHERE place_country='USA' AND concert_in = place_no AND m_no = concert_orgniser

SELECT DISTINCT con_date, concert_venue , c_title FROM place, musician,  concert, composition, has_composed, composer, performance 
WHERE cmpr_no = comp_no AND c_no = cmpn_no AND m_name = 'Andy Jones' AND concert_no = performed_in AND performed = c_no AND comp_is = m_no

DELETE FROM musician;
DELETE FROM place;
DELETE FROM has_composed;
DELETE FROM plays_in;
DELETE FROM performance;
DELETE FROM concert;
DELETE FROM composition;
DELETE FROM band;
DELETE FROM performer;
DELETE FROM composer;

DROP TABLE musician CASCADE CONSTRAINTS;
DROP TABLE performance CASCADE CONSTRAINTS;
DROP TABLE place CASCADE CONSTRAINTS;
DROP TABLE composer  CASCADE CONSTRAINTS;
DROP TABLE has_composed CASCADE CONSTRAINTS;
DROP TABLE performer CASCADE  CONSTRAINTS;
DROP TABLE plays_in CASCADE CONSTRAINTS;
DROP TABLE band CASCADE CONSTRAINTS;
DROP TABLE composition CASCADE CONSTRAINTS;
DROP TABLE concert CASCADE CONSTRAINTS;

/* auto04 */

/* 1. Definir las restricciones declarativas */
ALTER TABLE musician ADD CONSTRAINT CK_musician_name CHECK (m_name LIKE('% %'));
ALTER TABLE musician ADD CONSTRAINT CK_musician_died_born CHECK (died > born);
ALTER TABLE composer ADD CONSTRAINT CK_composer_comp_type CHECK (comp_type IN ('jazz', 'classical', 'rock', 'blues','not known'));

--ALTER TABLE performer ADD CONSTRAINT UK_perf_is UNIQUE(perf_is);

/* 2. Validar con casos significativos la protecci�n de la base de datos, adicione
comentarios */

INSERT INTO musician VALUES(35,'FredBloggs',TO_DATE('1930/05/30','YYYY/MM/DD'),TO_DATE('1940/01/02','YYYY/MM/DD'),1,2);
INSERT INTO musician VALUES(35,'FredBloggs',TO_DATE('1928/05/30','YYYY/MM/DD'),TO_DATE('1957/01/02','YYYY/MM/DD'),1,2);

INSERT INTO composer VALUES(13,10,'J-Rock');
INSERT INTO composer VALUES(13,1,'not_known');

/* 1. Definir las acciones de referencia
(Deben eliminar y volver a crear las FK afectadas) */

ALTER TABLE band DROP CONSTRAINT FK_band_musician; 
ALTER TABLE performer DROP CONSTRAINT FK_performer_musician;
ALTER TABLE performance DROP CONSTRAINT FK_performance_musician;

ALTER TABLE band ADD CONSTRAINT FK_band_musician FOREIGN KEY(band_contact) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE performer ADD CONSTRAINT FK_performer_musician FOREIGN KEY(perf_is) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE performance ADD CONSTRAINT FK_performance_musician FOREIGN KEY(conducted_by) REFERENCES musician(m_no) ON DELETE CASCADE;

/* 2. Validar con casos significativos las condiciones definidas */
DELETE FROM musician WHERE m_no= 1;

/* C. Adicionando disparadores */
/* Los m�sicos siempre se pueden eliminar, si no tienen composiciones o no figuran como
organizadores de conciertos */
CREATE OR REPLACE TRIGGER El_MUSICIAN
BEFORE DELETE ON musician
FOR EACH ROW
DECLARE
    VECES NUMBER;
    VECES1 NUMBER;
BEGIN
    SELECT COUNT(:NEW.m_no) INTO VECES FROM composer WHERE :OLD.m_no=comp_is;
    SELECT COUNT(:NEW.m_no) INTO VECES1 FROM concert WHERE :OLD.m_no=concert_orgniser;
    IF VECES > 0 OR VECES1 > 0 THEN 
    RAISE_APPLICATION_ERROR(-20004,'Los m�sicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos');
    END IF;
END El_MUSICIAN;

/*disparador ok*/
DELETE FROM musician WHERE m_no= 2;
/*disparadores no ok */
DELETE FROM musician WHERE m_no=1;
DELETE FROM musician WHERE m_no= 3;
DELETE FROM musician WHERE m_no= 17;

/*El n�mero se genera autom�ticamente de forma consecutiva.*/
CREATE OR REPLACE TRIGGER Ad_MUSICIAN_CON
BEFORE INSERT ON musician
FOR EACH ROW
DECLARE
consecu NUMBER;
BEGIN
    SELECT COUNT(*)+1 INTO consecu FROM musician ;
    :NEW.m_no := consecu;
END Ad_MUSICIAN_CON;

/*La ciudad en la que vive por omisi�n es la ciudad de nacimiento.*/
CREATE OR REPLACE TRIGGER ad_MUSICIAN_living
BEFORE INSERT ON musician
FOR EACH ROW 
BEGIN
    IF :NEW.living_in IS NULL THEN
    :NEW.living_in := :NEW.born_in; 
END IF;
END ad_MUSICIAN_living;

/*disparador ok*/
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (27,'John','17-NOV-97',null,2);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (28,'John','02-JAN-48',null,4);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (29,'John','02-JAN-48',null,9);
/*disparadores no ok
NO HAY*/

/*Los compositores s�lo pueden componer un tipo de m�sica y los interpretes pueden tocar m�ximo tres instrumentos.*/
CREATE OR REPLACE TRIGGER ad_MUSICIAN_musica
BEFORE INSERT ON performer
FOR EACH ROW
DECLARE
tipo NUMBER;
BEGIN
    SELECT COUNT(instrument) INTO tipo FROM performer WHERE perf_is=:NEW.perf_is;
    IF tipo=3 THEN RAISE_APPLICATION_ERROR(-20007,'Los compositores s�lo pueden componer un tipo de m�sica y los interpretes pueden tocar m�ximo tres instrumentos');
END IF;
END ad_MUSICIAN_musica;

/*disparador ok*/
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (30,3,'violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,3,'guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (32,15,'guitar','jazz');
/*disparadores no ok
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (30,2,'violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,6,'guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,8,'guitar','jazz');

/* Si no se indica el tipo de m�sica de un compositor, se supone que el tipo de m�sica que
sabe interpretar (si solamente es uno) */
CREATE OR REPLACE TRIGGER  myTT
BEFORE INSERT ON composer
FOR EACH ROW
DECLARE
perf NUMBER;
type VARCHAR(10);
BEGIN
    SELECT COUNT(perf) INTO perf FROM performer WHERE :NEW.comp_is = perf_is;
    IF :NEW.comp_type IS NULL AND perf = 1 THEN 
    SELECT perf_type INTO type FROM performer WHERE :NEW.comp_is = perf_is;
    :NEW.comp_type := type ;
    ELSE raise_application_error(-20050,'Si no se indica el tipo de m�sica de un compositor, se supone que el tipo de m�sica que
    sabe interpretar (si solamente es uno)');
END IF;
END;

/*disparador ok*/
INSERT INTO composer (comp_no,comp_is) VALUES (14,3);
INSERT INTO composer (comp_no,comp_is) VALUES (15,15);
INSERT INTO composer (comp_no,comp_is) VALUES (16,5);
/*disparadores no ok
INSERT INTO composer (comp_no,comp_is) VALUES (15,2);
INSERT INTO composer (comp_no,comp_is) VALUES (15,4);
INSERT INTO composer (comp_no,comp_is) VALUES (15,6);
*/

/*No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el m�sico y la fecha de muerte.*/
CREATE OR REPLACE TRIGGER mo_MUSICIAN
BEFORE UPDATE ON musician
FOR EACH ROW
BEGIN
    IF :NEW.m_no <> :OLD.m_no OR :NEW.m_name<> :OLD.m_name OR :NEW.born<>:OLD.born OR  :NEW.born_in<>:OLD.born_in THEN
        :NEW.m_no:=:OLD.m_no; 
        :NEW.m_name:= :OLD.m_name;
        :NEW.born:=:OLD.born;
        :NEW.born_in:= :OLD.born_in;
    END IF;    
END mo_MUSICIAN;
/* trigger ok */
UPDATE musician SET m_name= 'Eduardo' WHERE m_no= 1;
UPDATE musician SET living_in= 6 WHERE m_no= 1;
UPDATE musician SET died= '11-08-99' WHERE m_no= 1;
/*disparadores no ok
NO SE PUEDE */

DROP TABLE band CASCADE CONSTRAINTS;
DROP TABLE composition CASCADE CONSTRAINTS;
DROP TABLE concert CASCADE CONSTRAINTS;
DROP TABLE musician CASCADE CONSTRAINTS;
DROP TABLE performance CASCADE CONSTRAINTS;
DROP TABLE place CASCADE CONSTRAINTS;
DROP TABLE composer  CASCADE CONSTRAINTS;
DROP TABLE has_composed CASCADE CONSTRAINTS;
DROP TABLE performer CASCADE  CONSTRAINTS;
DROP TABLE plays_in CASCADE CONSTRAINTS;