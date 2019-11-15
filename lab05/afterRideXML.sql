CREATE TABLE Registro(numero NUMBER(5) NOT NULL, codigo_carrera VARCHAR(20) NOT NULL, nombre_segmento VARCHAR(40) NOT NULL,nombre_version VARCHAR(40)NOT NULL,ciclista_id NUMBER(5) NOT NULL, fecha DATE NOT NULL, tiempo NUMBER(9) NOT NULL,posicion NUMBER(5) NOT NULL, dificultad CHAR(1)NOT NULL, comentario VARCHAR(20) NULL,revision XMLTYPE NULL);
CREATE TABLE Segmento(nombre VARCHAR(40) NOT NULL, FinalizaEn NUMBER(2) NOT NULL,IniciaEn NUMBER(2) NOT NULL, carrera_codigo VARCHAR(20) NOT NULL, nombre_version VARCHAR(40)NOT NULL, tipo CHAR(1) NOT NULL);
DROP TABLE Segmento;
DROP TABLE Registro;
ALTER TABLE Registro ADD CONSTRAINT PK_Registro PRIMARY KEY (numero,codigo_carrera);

/*Poblando OK*/
INSERT INTO Segmento VALUES('Linea del Brayan',1,2,'VA85PDA2','VAB2019','C');
INSERT INTO Segmento VALUES('Linea de la muerte',1,2,'DCJCVH4P','TDC2019','M');
INSERT INTO Segmento VALUES('Linea de la vida',2,3,'DCJCVH4P','TDC2019','M');
INSERT INTO Segmento VALUES('Linea de la Pinheiros',1,2,'Y874EBXV','GDSP2019','C');
INSERT INTO Segmento VALUES('Linea de la Itaim',2,3,'Y874EBXV','GDSP2019','C');

/*XML OK*/
INSERT INTO Registro VALUES(1, 'VA85PDA2', 'Linea del Brayan','VAB2019',1,TO_DATE('2019/05/01','YYYY/MM/DD'),30, 2,'M', NULL,
'<?xml version="1.0"?>
<TRevision>
    <seccion numero = "1" tipo="Facil">
        <kilometro_inicial>1km</kilometro_inicial>
        <kilometro_final>60km</kilometro_final>
        <velocidad_promedio>30km/h</velocidad_promedio>
        <velocidad_minima>10km/h</velocidad_minima>
        <velocidad_maxima>70km/h</velocidad_maxima>
        <pulsaciones_promedio>70l/m</pulsaciones_promedio>
        <potencia_promedio>90</potencia_promedio>
        <comentario>Al terminar la revision se llego a la conclusion de que esta seccion es valida y se puede llevar a cabo por corredores amateur</comentario>
    </seccion>
</TRevision>');

INSERT INTO Registro VALUES(67672, 'DCJCVH4P', 'Linea de la muerte','TDC2019',3,TO_DATE('2019/12/19','YYYY/MM/DD'),1376, 2, 'A', NULL, 
'<?xml version="1.0"?>
<TRevision>
    <seccion numero = "1" tipo="Duro">
        <kilometro_inicial>1km</kilometro_inicial>
        <kilometro_final>1200km</kilometro_final>
        <velocidad_promedio>42km/h</velocidad_promedio>
        <velocidad_minima>15km/h</velocidad_minima>
        <velocidad_maxima>100km/h</velocidad_maxima>
        <pulsaciones_promedio>75/m</pulsaciones_promedio>
        <potencia_promedio>100</potencia_promedio>
        <comentario>Al terminar la revision se llego a la conclusion de que esta seccion es valida, se puede llevar a cabo por corredores profesionales y bajo la responsabilidad de cada uno</comentario>
    </seccion>
    <seccion numero = "2" tipo = "Descenso">
        <kilometro_inicial>1km</kilometro_inicial>
            <kilometro_final>180km</kilometro_final>
            <velocidad_promedio >70km/h</velocidad_promedio>
            <velocidad_minima >40km/h</velocidad_minima>
            <velocidad_maxima >120km/h</velocidad_maxima>
            <pulsaciones_promedio >76l/m</pulsaciones_promedio>
            <potencia_promedio >105</potencia_promedio>
            <comentario>Al terminar la revision se llego a la conclusion de que esta seccion es valida, se puede llevar a cabo por corredores profesionales y bajo la responsabilidad de cada uno</comentario>
    </seccion>
</TRevision>');

/*XML NoOK*/
/*No es correcto por llaves que al cerrar tienen nombre diferente a la apertura*/
INSERT INTO Registro VALUES(3, 'DGJCVH4P', 'Linea de la muerte','TDC2019',2,TO_DATE('2019/12/19','YYYY/MM/DD'),1376, 2, 'A', NULL, 
'<?xml version="1.0"?>
<TRevision>
    <seccion numero = "1" tipo="Duro">
        <kilometro_inicial>1km</kilometro_inicial>
        <kilometro_final>1200km</kilometro_final>
        <velocidad_promedio>42km/h</velocidad_promedio>
        <velocidad_minima>15km/h</velocidad_minima>
        <velocidad_maxima>100km/h</velocidad_maxima>
        <pulsaciones_promedio>75/m</pulsaciones_promedio>
        <potencia_promedio>100</potencia_promedio>
    </seccion>
    <seccion numero = "1" tipo = "Descenso">
        <kilometro_inicial>1km</kilometro_inicial>
            <kilometro_final>180km</kilometro_final>
            <velocidad_promedio >70km/h</velocidad_promedio>
            <velocidad_minima >40km/h</velocidad_minima>
            <velocidad_maxima >120km/h</velocidad_maxima>
            <pulsaciones_promedio >76l/m</pulsaciones_promedio>
            <potencia_promedio >105</potenciaPromedio>
    </seccion>
</TRevision>');

INSERT INTO Registro VALUES(4, 'HGJCVH4P', 'Linea de la muerte','TDC2019',2,TO_DATE('2019/12/19','YYYY/MM/DD'),1376, 2, 'A', NULL, 
'<?xml version="1.0"?>
<TRevision>
    <seccion numero = "1" tipo="Duro">
        <kilometro_inicial>1km</kilometro_inicial>
        <kilometro_final>1200km</kilometro_final>
        <velocidad_promedio>42km/h</velocidad_promedio>
        <velocidad_minima>15km/h</velocidad_minima>
        <velocidad_maxima>100km/h</velocidad_maxima>
        <pulsaciones_promedio>75/m</pulsaciones_promedio>
        <potencia_promedio>100</potencia_promedio>
    </seccion>
    <seccion numero = "1" tipo = "Descenso">
        <kilometroInicial>1km</kilometro_inicial>
            <kilometro_final>180km</kilometro_final>
            <velocidad_promedio >70km/h</velocidad_promedio>
            <velocidad_minima >40km/h</velocidad_minima>
            <velocidad_maxima >120km/h</velocidad_maxima>
            <pulsaciones_promedio >76l/m</pulsaciones_promedio>
            <potencia_promedio >105</potencia_promedio>
    </seccion>
</TRevision>');

/*PoblandoNoOK*/
/*Error de PK, llaves repetidas*/
INSERT INTO Registro VALUES(1, 'VA85PDA2', 'Linea del Brayan','VAB2019',1,TO_DATE('2019/05/01','YYYY/MM/DD'),30, 2,'M', NULL,
'<?xml version="1.0"?>
<TRevision>
    <seccion numero = "1" tipo="Facil">
        <kilometro_inicial>1km</kilometro_inicial>
        <kilometro_final>60km</kilometro_final>
        <velocidad_promedio>30km/h</velocidad_promedio>
        <velocidad_minima>10km/h</velocidad_minima>
        <velocidad_maxima>70km/h</velocidad_maxima>
        <pulsaciones_promedio>70l/m</pulsaciones_promedio>
        <potencia_promedio>90</potencia_promedio>
        <comentario>Al terminar la revision se llego a la conclusion de que esta seccion es valida y se puede llevar a cabo por corredores amateur</comentario>
    </seccion>
</TRevision>');

/*DTD*/
<?xml version="1.0"?>
<!DOCTYPE TRevision [
    <!ELEMENT TRevision (seccion*)>
    <!ELEMENT seccion(kilomentro_inicial, kilomento_final, velocidad_promedio, velocidad_minima, velocidad_maxima, pulsaciones_promedio, potencia_promedio,comentario)
    <!ATTLIST seccion numero CDATA #REQUIRED>
    <!ATTLIST seccion tipo CDATA #IMPLIED>
    <!ELEMENT kilometro_inicial (#PCDATA)>     
    <!ELEMENT kilometro_final (#PCDATA)>
    <!ELEMENT velocidad_promedio (#PCDATA)>
    <!ELEMENT velocidad_minima(#PCDATA)>
    <!ELEMENT velocidad_maxima(#PCDATA)>
    <!ELEMENT pulsaciones_promedio(#PCDATA)>
    <!ELEMENT potencia_promedio(#PCDATA)>
    <!ELEMENT comentario(#PCDATA)>
]>

/*Consulta*/
SELECT Segmento.nombre
  FROM Registro,
       XMLTABLE ('TRevision/seccion' PASSING Registro.revision
                 COLUMNS tipo VARCHAR(50) PATH '@tipo') X , Segmento WHERE nombre_segmento = Segmento.nombre AND Segmento.tipo = 'M' AND X.tipo='Descenso';

/*Consultar los comentarios de cada una de las secciones de cada segmento*/
SELECT Segmento.nombre,X.numero,X.comentario
  FROM Registro,
       XMLTABLE ('TRevision/seccion' PASSING Registro.revision
                 COLUMNS comentario VARCHAR(300) PATH 'comentario',numero NUMBER(5) PATH '@numero') X , Segmento WHERE nombre_segmento = Segmento.nombre;

/*Nombre de los segmentos que tengan secciones faciles*/
SELECT Segmento.nombre
  FROM Registro,
       XMLTABLE ('TRevision/seccion' PASSING Registro.revision
                 COLUMNS tipo VARCHAR(50) PATH '@tipo') X , Segmento WHERE nombre_segmento = Segmento.nombre AND X.tipo='Facil';
                