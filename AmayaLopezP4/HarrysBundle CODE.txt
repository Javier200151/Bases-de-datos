/* Tablas */
CREATE TABLE Producto (codigo VARCHAR(10) NOT NULL, nombre VARCHAR(25) NOT NULL,calificacion NUMBER(1) NULL, valor NUMBER(6) NOT NULL, fecha DATE NOT NULL, comentario VARCHAR(100) NULL);
CREATE TABLE Paquete (codigo_paquete VARCHAR(10) NOT NULL, caducidad NUMBER(2));
CREATE TABLE Juego (codigo_juego VARCHAR(10) NOT NULL, paquete VARCHAR(10) NOT NULL, categoria VARCHAR(20) NOT NULL, creado_por NUMBER(11) NOT NULL);

CREATE TABLE Cliente (id_ NUMBER(11) NOT NULL, tid CHAR(2) NOT NULL, nombre VARCHAR(20) NOT NULL, correo VARCHAR(25) NULL);
CREATE TABLE Usuario (id_usuario NUMBER(11) NOT NULL, apodo_cuenta VARCHAR(10) NOT NULL);
CREATE TABLE Desarrolladora (id_desarrolladora NUMBER(11) NOT NULL, codigo_pago NUMBER(11) NOT NULL);

CREATE TABLE Compra (codigo NUMBER(11) NOT NULL,valor NUMBER(6) NOT NULL, pagado_por NUMBER(11));
CREATE TABLE Recibo (codigo_recibo NUMBER(11) NOT NULL, codigo_compra NUMBER(11) NOT NULL, codigo_producto VARCHAR(11) NOT NULL);
CREATE TABLE CompraProducto (id_usuarioCP NUMBER(11) NOT NULL, codigo_producto VARCHAR(10) NOT NULL);

CREATE TABLE Logro (codigo_juego VARCHAR(10) NOT NULL, nombre_logro VARCHAR(20) NOT NULL, descripcion VARCHAR(40) NULL, logrado_por NUMBER(11) NOT NULL);
CREATE TABLE Descuento (codigo_descuento VARCHAR(10) NOT NULL,codigo_compra NUMBER(11) NOT NULL, porcentaje NUMBER(3) NOT NULL);
CREATE TABLE DescuentoCompra (codigo_compra NUMBER(11) NOT NULL, codigo_descuento VARCHAR(10) NOT NULL);

/* Atributos */

--CREATE DOMAIN TCodigo VARCHAR(10);
--CREATE DOMAIN TCategoria VARCHAR(25);
--CREATE DOMAIN TNombre VARCHAR(15);
--CREATE DOMAIN TValor NUMBER(6);
--CREATE DOMAIN Ttid CHAR(2);
--CREATE DOMAIN Tid NUMBER(2);
ALTER TABLE Cliente ADD CONSTRAINT CK_cliente_ttid CHECK(tid='CC' OR tid='NT');
ALTER TABLE Producto ADD CONSTRAINT CK_Producto_calif CHECK(calificacion>=0 OR calificacion<=5);
ALTER TABLE Cliente ADD CONSTRAINT CK_Producto_id CHECK(id_>=99999999 OR id_<=9999999999);
ALTER TABLE Usuario ADD CONSTRAINT CK_Usuario_id CHECK(id_usuario>=99999999 OR id_usuario<=9999999999);
ALTER TABLE Desarrolladora ADD CONSTRAINT CK_Desarrolladora_id CHECK(id_desarrolladora>=99999999 OR id_desarrolladora<=9999999999);
ALTER TABLE CompraProducto ADD CONSTRAINT CK_CompraProducto_id CHECK(id_usuarioCP>=99999999 OR id_usuarioCP<=9999999999);

/* PRIMARIAS */
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (codigo);
ALTER TABLE Paquete ADD CONSTRAINT PK_Paquete PRIMARY KEY (codigo_paquete);
ALTER TABLE Juego ADD CONSTRAINT PK_Juego PRIMARY KEY (codigo_juego);

ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (id_);
ALTER TABLE Usuario ADD CONSTRAINT PK_Usuario PRIMARY KEY (id_usuario);
ALTER TABLE Desarrolladora ADD CONSTRAINT PK_Desarrolladora PRIMARY KEY (id_desarrolladora);

ALTER TABLE Compra ADD CONSTRAINT PK_Compra PRIMARY KEY (codigo);
ALTER TABLE Recibo ADD CONSTRAINT PK_Recibo PRIMARY KEY (codigo_recibo);
ALTER TABLE CompraProducto ADD CONSTRAINT PK_CompraProducto PRIMARY KEY (id_usuarioCP, codigo_producto);

ALTER TABLE Logro ADD CONSTRAINT PK_Logro PRIMARY KEY (codigo_juego);
ALTER TABLE Descuento ADD CONSTRAINT PK_Descuento PRIMARY KEY (codigo_descuento, codigo_compra);
ALTER TABLE DescuentoCompra ADD CONSTRAINT PK_DescuentoCompra PRIMARY KEY (codigo_compra, codigo_descuento);

/* UNICAS */
ALTER TABLE Cliente ADD CONSTRAINT UK_Cliente UNIQUE (correo);

/* FORANEAS */
ALTER TABLE Juego ADD CONSTRAINT FK_Juego FOREIGN KEY (codigo_juego) REFERENCES Producto(codigo);
ALTER TABLE Paquete ADD CONSTRAINT FK_Paquete FOREIGN KEY (codigo_paquete) REFERENCES Producto(codigo);
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario FOREIGN KEY (id_usuario) REFERENCES Cliente(id_);
ALTER TABLE Desarrolladora ADD CONSTRAINT FK_Desarrolladora FOREIGN KEY (id_desarrolladora) REFERENCES Cliente(id_);
ALTER TABLE Compra ADD CONSTRAINT FK_Compra FOREIGN KEY (pagado_por) REFERENCES Usuario(id_usuario);
ALTER TABLE CompraProducto ADD CONSTRAINT FK_CompraProducto_1 FOREIGN KEY (id_usuarioCP) REFERENCES Usuario(id_usuario);
ALTER TABLE CompraProducto ADD CONSTRAINT FK_CompraProducto_2 FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo);
ALTER TABLE Recibo ADD CONSTRAINT FK_Recibo_2 FOREIGN KEY (codigo_compra) REFERENCES Compra(codigo);
ALTER TABLE Recibo ADD CONSTRAINT FK_Recibo_3 FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo);
ALTER TABLE Logro ADD CONSTRAINT FK_Logro_1 FOREIGN KEY (codigo_juego) REFERENCES Juego(codigo_juego);
ALTER TABLE Descuento ADD CONSTRAINT FK_Descuento FOREIGN KEY (codigo_descuento) REFERENCES Logro(codigo_juego);
ALTER TABLE DescuentoCompra ADD CONSTRAINT FK_DescuentoCompra_1 FOREIGN KEY (codigo_compra) REFERENCES Compra(codigo);
ALTER TABLE DescuentoCompra ADD CONSTRAINT FK_DescuentoCompra_2 FOREIGN KEY (codigo_descuento, codigo_compra) REFERENCES Descuento(codigo_descuento, codigo_compra);

/* xTablas */
DROP TABLE Producto;
DROP TABLE Paquete;
DROP TABLE Juego;
DROP TABLE Cliente;
DROP TABLE Usuario;
DROP TABLE Desarrolladora;
DROP TABLE CompraProducto;
DROP TABLE Compra;
DROP TABLE Recibo;
DROP TABLE Logro;
DROP TABLE Descuento;
DROP TABLE DescuentoCompra;

/* Consultas */

/* Consultar el catalogo de juegos */
SELECT nombre,valor FROM producto
JOIN juego ON (juego.codigo_juego=producto.codigo)
WHERE codigo_juego=codigo;

/* Consultar bonos obtenidos */
SELECT SUM(logrado_por) FROM logro
JOIN usuario ON (usuario.id_usuario=logro.logrado_por)
WHERE apodo_cuenta='Rylod' AND logrado_por = id_usuario;

SELECT nombre_logro,porcentaje FROM logro
JOIN usuario ON (usuario.id_usuario=logro.logrado_por)
JOIN descuento ON (descuento.codigo_descuento=logro.codigo_juego)
WHERE apodo_cuenta='Rylod' AND logrado_por = id_usuario;

/* Consultar paquetes de juegos */
SELECT nombre,valor FROM producto
JOIN Paquete ON (Paquete.codigo_paquete=producto.codigo)
WHERE codigo_paquete=codigo;

/* PoblarOK */
INSERT INTO Producto VALUES ('ZVI7WO1XLD', '90s', 5, 49033, '6/8/2019', NULL);
INSERT INTO Producto VALUES ('UU45XOS4W8', 'Erasing David', 3, 49062, '10/4/2018', NULL);
INSERT INTO Producto VALUES ('JVDNUY62ES', 'Merlin''s Apprentice', 3, 32038, '11/8/2018', NULL);
INSERT INTO Producto VALUES ('SE7RIIP7NV', 'Mimtendo Games', 1, 26067, '5/12/2019', NULL);
INSERT INTO Producto VALUES ('3AF3OVD73I', 'Card Subject To Change', 2, 55060, '4/7/2019', NULL);
INSERT INTO Producto VALUES ('FKSHOQ0W9J', 'Random Games', 2, 55060, '4/7/2019', NULL);
INSERT INTO Producto VALUES ('48GVKQ956D', 'Rackman pack', 2, 55060, '15/3/2018', NULL);
INSERT INTO Producto VALUES ('3TIF4E5KS6', 'Carlos Duty Pack', 2, 55060, '2/1/2019', NULL);
INSERT INTO Producto VALUES ('4G5AWV88ZN', 'Carlos Duty II', 2, 55060, '29/10/2019', NULL);
INSERT INTO Producto VALUES ('IHL9IZG2PX', 'Super Malio', 2, 55060, '4/9/2018', NULL);

INSERT INTO Paquete VALUES('SE7RIIP7NV',3);
INSERT INTO Paquete VALUES('ZVI7WO1XLD',2);
INSERT INTO Paquete VALUES('3TIF4E5KS6',5);
INSERT INTO Paquete VALUES('48GVKQ956D',2);
INSERT INTO Paquete VALUES('FKSHOQ0W9J',2);

INSERT INTO Juego VALUES('UU45XOS4W8','ZVI7WO1XLD','Plataformas',0353407188);
INSERT INTO Juego VALUES('JVDNUY62ES','SE7RIIP7NV','Rolplay',3537529211);
INSERT INTO Juego VALUES('3AF3OVD73I','FKSHOQ0W9J','De Mesa',3537529211);
INSERT INTO Juego VALUES('IHL9IZG2PX','48GVKQ956D','Disparos',3537529211);
INSERT INTO Juego VALUES('4G5AWV88ZN','3TIF4E5KS6','Plataformas',3537529211);

INSERT INTO Cliente VALUES (0353407188, 'NT', 'RA Games', 'rag.games@goo.gl');
INSERT INTO Cliente VALUES (4498243436, 'CC', 'Agnola Bransom', 'abransom@pcworld.com');
INSERT INTO Cliente VALUES (7770106765, 'CC', 'Nikolaos O Sheils', 'nosheils2@furl.net');
INSERT INTO Cliente VALUES (3537529211, 'NT', 'Mimtento INC', 'mimtendo@w3.org');
INSERT INTO Cliente VALUES (4555882469, 'CC', 'Gabriela Hart', 'ghart4@utexas.edu');
INSERT INTO Cliente VALUES (9986498142, 'NT', 'Maincrosoft', 'maincrosoft@utexas.edu');
INSERT INTO Cliente VALUES (1572240876, 'NT', 'Zony Studios', 'zony@utexas.edu');
INSERT INTO Cliente VALUES (8094691277, 'CC', 'Harry Bundle', 'harryB@utexas.edu');
INSERT INTO Cliente VALUES (5280315433, 'NT', 'Survivor Games', 'survivorG@utexas.edu');
INSERT INTO Cliente VALUES (0785514639, 'CC', 'Elon Musk', 'elon.musk@utexas.edu');

INSERT INTO Usuario VALUES (7770106765,'Rylod');
INSERT INTO Usuario VALUES (4498243436,'Hefra');
INSERT INTO Usuario VALUES (4555882469,'Aliengamer');
INSERT INTO Usuario VALUES (8094691277,'Piasta');
INSERT INTO Usuario VALUES (0785514639,'KiritoPvP');

INSERT INTO Desarrolladora VALUES (0353407188,7655471947);
INSERT INTO Desarrolladora VALUES (3537529211,9233244464);
INSERT INTO Desarrolladora VALUES (9986498142,1880095817);
INSERT INTO Desarrolladora VALUES (1572240876,8279826254);
INSERT INTO Desarrolladora VALUES (5280315433,8026135539);

INSERT INTO Compra VALUES(7655471947,49033,4498243436);
INSERT INTO Compra VALUES(9233244464,49033,4498243436);
INSERT INTO Compra VALUES(1880095817,32038,4555882469);
INSERT INTO Compra VALUES(8279826254,55060,7770106765);
INSERT INTO Compra VALUES(8026135539,55060,7770106765);

INSERT INTO Recibo VALUES(3838965647,7655471947,'UU45XOS4W8');
INSERT INTO Recibo VALUES(0456628556,9233244464,'UU45XOS4W8');
INSERT INTO Recibo VALUES(6030832920,1880095817,'JVDNUY62ES');
INSERT INTO Recibo VALUES(6627529459,8279826254,'3AF3OVD73I');
INSERT INTO Recibo VALUES(3605873504,8026135539,'3AF3OVD73I');

INSERT INTO CompraProducto VALUES (4498243436,'ZVI7WO1XLD');
INSERT INTO CompraProducto VALUES (4498243436,'UU45XOS4W8');
INSERT INTO CompraProducto VALUES (4555882469,'JVDNUY62ES');
INSERT INTO CompraProducto VALUES (7770106765,'UU45XOS4W8');
INSERT INTO CompraProducto VALUES (7770106765,'3AF3OVD73I');

INSERT INTO Logro VALUES('UU45XOS4W8','Erase','Borralo todo',4498243436);
INSERT INTO Logro VALUES('JVDNUY62ES','Just Forgot','Revierte los hechizos',7770106765);
INSERT INTO Logro VALUES('3AF3OVD73I','Unknown','Encuentra la carta oculta',7770106765);
INSERT INTO Logro VALUES('IHL9IZG2PX','Willyrex','Saca una racha de asesinatos',7770106765);
INSERT INTO Logro VALUES('4G5AWV88ZN','Without Her','Olvidate de su corazon',7770106765);

INSERT INTO Descuento VALUES('UU45XOS4W8',7655471947,15);
INSERT INTO Descuento VALUES('JVDNUY62ES',9233244464,20);
INSERT INTO Descuento VALUES('3AF3OVD73I',1880095817,5);
INSERT INTO Descuento VALUES('IHL9IZG2PX',8279826254,25);
INSERT INTO Descuento VALUES('4G5AWV88ZN',8026135539,50);

INSERT INTO DescuentoCompra VALUES(7655471947,'UU45XOS4W8');
INSERT INTO DescuentoCompra VALUES(9233244464,'JVDNUY62ES');
INSERT INTO DescuentoCompra VALUES(1880095817,'3AF3OVD73I');
INSERT INTO DescuentoCompra VALUES(8279826254,'IHL9IZG2PX');
INSERT INTO DescuentoCompra VALUES(8026135539,'4G5AWV88ZN');

/* PoblarNoOk */
INSERT INTO Cliente VALUES (0353407188, 'NIT', 'RA Games', 'rag.games@goo.gl');  --El segundo atributo es un CHAR(2)
INSERT INTO Cliente VALUES (0353407188, 'CE', 'RA Games', 'rag.games@goo.gl');  --El segundo atributo puede ser solo CC o NT
INSERT INTO Usuario VALUES (7770106765,NULL); --No puede ser NULL el atributo apodo
INSERT INTO Recibo VALUES ('IHL9IZG2PX',8279826254,'3AF3OVD73I'); --Es un tipo NUMBER el primer atributo
INSERT INTO CompraProducto VALUES (4498243436,'ZVI7WO1XLD'); --Al insertar este seria un duplicado afectando la restriccion del PK

/* xPoblar */
DELETE FROM Producto;
DELETE FROM Paquete;
DELETE FROM Juego;
DELETE FROM Cliente;
DELETE FROM Usuario;
DELETE FROM Desarrolladora;
DELETE FROM Compra;
DELETE FROM Recibo;
DELETE FROM CompraProducto;
DELETE FROM Logro;
DELETE FROM Descuento;
DELETE FROM DescuentoCompra;

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