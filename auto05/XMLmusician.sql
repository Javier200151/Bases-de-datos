CREATE TABLE musician (m_no NUMBER(5) NOT NULL, m_name VARCHAR(50) NOT NULL, born DATE NOT NULL, died DATE NULL, born_in NUMBER(5) NOT NULL, living_in NUMBER(5) NOT NULL, DETALLES XMLTYPE NOT NULL);
ALTER TABLE musician ADD CONSTRAINT PK_musician PRIMARY KEY (m_no);

INSERT INTO musician VALUES (1,'Fred Bloggs',TO_DATE('02/01/1948','DD/MM/YYYY'),NULL,1,2,
'<?xml version="1.0"?>
<detalle>
	<PaginaPersonal
		url="www.friv.com/fredB">
	</PaginaPersonal>
	<OtrosNombres
		nombre= "El musico" 
		razón= "Mejor musico de su epoca">
	</OtrosNombres>
	<Sellos
        nombre="Toca y deja tocar">
	</Sellos>
	<Discos>
		<disco 
            nombre= "2552" 
            año="1995">
        </disco>
        <disco
            nombre= "JEG" 
            año="1995">
        </disco>
	</Discos>
	<Premios>
		<premio 
			nombre= "The Most Gurriest" 
			año= "2000" >
		</premio>
		<premio 
			nombre= "Miss Bosa" 
			año= "1999" >
		</premio>
		<premio 
			nombre= "Africas Grammy" 
			año= "1998" >
		</premio>
		<premio 
			nombre= "Kid Choice Awards" 
			año= "1996" >
		</premio>
	</Premios>
    <Universidades
        nombre= "2552" 
        añoInicio="1995"
        añoFin="2001"
        tituloObtenido="Musico">
	</Universidades>
    <Hijos>
        <hijo
            nombre= "Clemencia Amaya" 
            sexo="mujer">
        </hijo>
        <hijo
            nombre= "Alberto Einstein" 
            sexo="mujer">
        </hijo>
	</Hijos>
</detalle>');

INSERT INTO musician VALUES (2,'John Smith',TO_DATE('	03/03/1950','DD/MM/YYYY'),NULL,3,4,
'<?xml version="1.0"?>
<detalle>
	<PaginaPersonal
		url="www.JohnSmith.com/blog">
	</PaginaPersonal>
	<OtrosNombres
		nombre= "El actor" 
		razón= "Compuso bandas sonoras de peliculas">
	</OtrosNombres>
	<Sellos
        nombre="Mi marcha, mi vida">
	</Sellos>
	<Discos>
		<disco 
            nombre= "Star Ponds" 
            año="1998">
        </disco>
        <disco
            nombre= "Triggers" 
            año="1999">
        </disco>
	</Discos>
	<Premios>
		<premio 
			nombre= "Oscars: Mejor Banda sonora" 
			año= "1998" >
		</premio>
		<premio 
			nombre= "Oscars: Mejor Banda sonora" 
			año= "1998" >
		</premio>
	</Premios>
    <Universidades
        nombre= "Cambridge" 
        añoInicio="1975"
        añoFin="1981"
        tituloObtenido="Musico">
	</Universidades>
    <Hijos>
        <hijo
            nombre= "Jhonn Williams" 
            sexo="hombre">
        </hijo>
	</Hijos>
</detalle>');

INSERT INTO musician VALUES (3,'Helen Smyth',TO_DATE('08/08/1948','DD/MM/YYYY'),NULL,4,5,
'<?xml version="1.0"?>
<detalle>
	<PaginaPersonal
		url="www.HelenSmyth.com/blog">
	</PaginaPersonal>
	<OtrosNombres
		nombre= "El sis" 
		razón= "Responde en sus entrevistas siempre con si">
	</OtrosNombres>
	<Sellos
        nombre="Brrrr">
	</Sellos>
	<Discos>
		<disco 
            nombre= "Gods" 
            año="1978">
        </disco>
        <disco
            nombre= "taiguers" 
            año="1969">
        </disco>
	</Discos>
	<Premios>
		<premio 
			nombre= "Grammy: Mejor concierto" 
			año= "1979" >
		</premio>
        <premio 
			nombre= "Grammy: Mejor grupo artistico" 
			año= "1979" >
		</premio>
		<premio 
			nombre= "Grammy: Album mas vendido" 
			año= "1969" >
		</premio>
	</Premios>
    <Universidades
        nombre= "Cambridge" 
        añoInicio="1971"
        añoFin="1976"
        tituloObtenido="Musico">
	</Universidades>
    <Hijos>
        <hijo
            nombre= "Espinoza Pas" 
            sexo="unknown">
        </hijo>
	</Hijos>
</detalle>');

/*Consultas*/
SELECT EXTRACTVALUE(detalles,'/detalle/OtrosNombres/@nombre') FROM musician;
SELECT m_name FROM musician WHERE (EXTRACTVALUE (detalles,'/detalle/Sellos/@nombre'))= 'Brrrr';

SELECT count(m_name) as premios, m_name
  FROM musician,
       XMLTABLE ('/detalle/Premios/premio' PASSING musician.detalles
                 COLUMNS nombre varchar(50) PATH '@nombre', año number(20) PATH '@año') X WHERE año = 1998
                 GROUP BY m_name;

SELECT X.nombre
  FROM musician,
       XMLTABLE ('/detalle/Discos/disco' PASSING musician.detalles
                 COLUMNS nombre varchar(50) PATH '@nombre', año number(20) PATH '@año') X WHERE año = 1995;
SELECT m_name
  FROM musician,
       XMLTABLE ('/detalle/Universidades' PASSING musician.detalles
                 COLUMNS nombre varchar(50) PATH '@nombre') X WHERE nombre = 'Cambridge';

/* Propuestas */

/*Nombre de musicos que tinen hijas*/
SELECT DISTINCT m_name
  FROM musician,
       XMLTABLE ('/detalle/Hijos/hijo' PASSING musician.detalles
                 COLUMNS nombre varchar(50) PATH '@nombre', sexo VARCHAR(50) PATH '@sexo') X WHERE sexo = 'mujer';         

/*Nombre de musicos que tinen hijos*/
SELECT DISTINCT m_name
  FROM musician,
       XMLTABLE ('/detalle/Hijos/hijo' PASSING musician.detalles
                 COLUMNS nombre varchar(50) PATH '@nombre', sexo VARCHAR(50) PATH '@sexo') X WHERE sexo = 'hombre';      

/* Musicos con mas de un hijo */
SELECT m_name
  FROM musician,
       XMLTABLE ('/detalle/Hijos/hijo' PASSING musician.detalles
                 COLUMNS nombre varchar(50) PATH '@nombre', sexo VARCHAR(50) PATH '@sexo') X         
                 GROUP BY m_name
                 HAVING COUNT(*)>1;
                 
/* url de cada musico */
SELECT EXTRACTVALUE(detalles,'/detalle/PaginaPersonal/@url') FROM musician;

/* Premios ganados y discos lanzados en un año especifico */
SELECT DISTINCT nombrex, nombrey
  FROM musician,
       XMLTABLE ('/detalle/Premios/premio' PASSING musician.detalles
                 COLUMNS nombrex varchar(50) PATH '@nombre', añox NUMBER(5) PATH '@año') X ,XMLTABLE ('/detalle/Discos/disco' PASSING musician.detalles
                 COLUMNS nombrey varchar(50) PATH '@nombre', añoy NUMBER(5) PATH '@año') Y WHERE añox=1998 AND añoy=1998;

/*DTD*/
<?xml version="1.0"?>
<!DOCTYPE detalle[
<!ELEMENT detalle(PaginaPersonal,OtrosNombres,Sellos,Discos,Premios,Universidades,Hijos)>
<!ELEMENT PaginaPersonal (#PCDATA)>
<!ELEMENT OtrosNombres (#PCDATA)> 
<!ELEMENT Sellos  (#PCDATA)>
<!ELEMENT Discos(#PCDATA)+>
<!ELEMENT Premios(#PCDATA)>
<!ELEMENT Universidades(#PCDATA)>
<!ELEMENT Hijos(#PCDATA)>

<!ATTLIST  PaginaPersonal url CDATA #REQUIRED >

<!ATTLIST  OtrosNombres nombre CDATA #REQUIRED >
<!ATTLIST  OtrosNombres razon CDATA #REQUIRED >

<!ATTLIST  Sellos nombre CDATA #REQUIRED >

<!ATTLIST  Discos nombre CDATA #REQUIRED >
<!ATTLIST  Discos año CDATA #REQUIRED >

<!ATTLIST  Premios nombre CDATA #REQUIRED >
<!ATTLIST  Premios año CDATA #REQUIRED >

<!ATTLIST  Universidades nombre CDATA #REQUIRED >
<!ATTLIST  Universidades añoInicio CDATA #REQUIRED >
<!ATTLIST  Universidades añoFin CDATA #IMPLIED >
<!ATTLIST  Universidades titulo CDATA #IMPLIED >

<!ATTLIST  Hijos nombre CDATA #REQUIRED >
<!ATTLIST  Hijos sexo CDATA #IMPLIED >
]>

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