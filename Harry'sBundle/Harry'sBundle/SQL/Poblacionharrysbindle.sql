
/* PoblarOK */
INSERT INTO Producto VALUES ('ZVI7WO1XLD', '90s', 5, 49033, TO_DATE('6/8/2019', 'DD-MM-YYYY'), NULL);
INSERT INTO Producto VALUES ('UU45XOS4W8', 'Erasing David', 3, 49062,TO_DATE('10/4/2018', 'DD-MM-YYYY') , NULL);
INSERT INTO Producto VALUES ('JVDNUY62ES', 'Merlin''s Apprentice', 3, 32038,TO_DATE( '11/8/2018', 'DD-MM-YYYY'), NULL);
INSERT INTO Producto VALUES ('SE7RIIP7NV', 'Mimtendo Games', 1, 26067,TO_DATE('5/12/2019', 'DD-MM-YYYY') , NULL);
INSERT INTO Producto VALUES ('3AF3OVD73I', 'Card Subject To Change', 2, 55060, TO_DATE('4/7/2019', 'DD-MM-YYYY'), NULL);
INSERT INTO Producto VALUES ('FKSHOQ0W9J', 'Random Games', 2, 55060, TO_DATE('4/7/2019', 'DD-MM-YYYY'), NULL);
INSERT INTO Producto VALUES ('48GVKQ956D', 'Rackman pack', 2, 55060,TO_DATE('15/3/2018', 'DD-MM-YYYY') , NULL);
INSERT INTO Producto VALUES ('3TIF4E5KS6', 'Carlos Duty Pack', 2, 55060, TO_DATE('2/1/2019', 'DD-MM-YYYY'), NULL);
INSERT INTO Producto VALUES ('4G5AWV88ZN', 'Carlos Duty II', 2, 55060, TO_DATE('29/10/2019', 'DD-MM-YYYY'), NULL);
INSERT INTO Producto VALUES ('IHL9IZG2PX', 'Super Malio', 2, 55060,TO_DATE( '4/9/2018', 'DD-MM-YYYY'), NULL);

INSERT INTO Paquete VALUES('SE7RIIP7NV',TO_DATE('11/8/2018', 'DD-MM-YYYY'));
INSERT INTO Paquete VALUES('ZVI7WO1XLD',TO_DATE('11/8/2018', 'DD-MM-YYYY'));
INSERT INTO Paquete VALUES('3TIF4E5KS6',TO_DATE('11/8/2018', 'DD-MM-YYYY'));
INSERT INTO Paquete VALUES('48GVKQ956D',TO_DATE('11/8/2018', 'DD-MM-YYYY'));
INSERT INTO Paquete VALUES('FKSHOQ0W9J',TO_DATE('11/8/2018', 'DD-MM-YYYY'));

INSERT INTO Juego VALUES('UU45XOS4W8','ZVI7WO1XLD','Plataformas',0353407188,
'<?xml version="1.0"?>
<Tdescripcion>
        <tipo>multijugador</tipo>
        <tiempoDesarrollo>5 meses</tiempoDesarrollo>
        <tiempoJuego>15</tiempoJuego>
        <requisitos></requisitos>
        <premiosGanados></premiosGanados>
</Tdescripcion>');
INSERT INTO Juego VALUES('JVDNUY62ES','SE7RIIP7NV','Rolplay',3537529211,
'<?xml version="1.0"?>
<Tdescripcion>
        <tipo>mixto</tipo>
        <tiempoDesarrollo>4 meses</tiempoDesarrollo>
        <tiempoJuego>20</tiempoJuego>
        <requisitos></requisitos>
        <premiosGanados></premiosGanados>
</Tdescripcion>');
INSERT INTO Juego VALUES('3AF3OVD73I','FKSHOQ0W9J','De Mesa',3537529211,
'<?xml version="1.0"?>
<Tdescripcion>
        <tipo>un jugador</tipo>
        <tiempoDesarrollo>6 meses</tiempoDesarrollo>
        <tiempoJuego>25</tiempoJuego>
        <requisitos></requisitos>
        <premiosGanados></premiosGanados>
</Tdescripcion>');
INSERT INTO Juego VALUES('IHL9IZG2PX','48GVKQ956D','Disparos',3537529211,
'<?xml version="1.0"?>
<Tdescripcion>
        <tipo>multijugador</tipo>
        <tiempoDesarrollo>7 meses</tiempoDesarrollo>
        <tiempoJuego>30</tiempoJuego>
        <requisitos></requisitos>
        <premiosGanados></premiosGanados>
</Tdescripcion>');
INSERT INTO Juego VALUES('4G5AWV88ZN','3TIF4E5KS6','Plataformas',3537529211,
'<?xml version="1.0"?>
<Tdescripcion>
        <tipo>mixto</tipo>
        <tiempoDesarrollo>8 meses</tiempoDesarrollo>
        <tiempoJuego>35</tiempoJuego>
        <requisitos></requisitos>
        <premiosGanados></premiosGanados>
</Tdescripcion>');

INSERT INTO Cliente VALUES (0353407188,1000722771, 'NT', 'RA Games', 'rag.games@goo.gl');
INSERT INTO Cliente VALUES (4498243436,1000722772, 'CC', 'Agnola Bransom', 'abransom@pcworld.com');
INSERT INTO Cliente VALUES (7770106765,1000722773, 'CC', 'Nikolaos O Sheils', 'nosheils2@furl.net');
INSERT INTO Cliente VALUES (3537529211,1000722774, 'NT', 'Mimtento INC', 'mimtendo@w3.org');
INSERT INTO Cliente VALUES (4555882469,1000722775, 'CC', 'Gabriela Hart', 'ghart4@utexas.edu');
INSERT INTO Cliente VALUES (9986498142,1000722776, 'NT', 'Maincrosoft', 'maincrosoft@utexas.edu');
INSERT INTO Cliente VALUES (1572240876,1000722777, 'NT', 'Zony Studios', 'zony@utexas.edu');
INSERT INTO Cliente VALUES (8094691277,1000722778, 'CC', 'Harry Bundle', 'harryB@utexas.edu');
INSERT INTO Cliente VALUES (5280315433,1000722779, 'NT', 'Survivor Games', 'survivorG@utexas.edu');
INSERT INTO Cliente VALUES (0785514639,1000722780, 'CC', 'Elon Musk', 'elon.musk@utexas.edu');

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

INSERT INTO Recibo VALUES(7655471947,'UU45XOS4W8','aplicado descuento');
INSERT INTO Recibo VALUES(9233244464,'UU45XOS4W8','aplicado descuento');
INSERT INTO Recibo VALUES(1880095817,'JVDNUY62ES','compra en linea');
INSERT INTO Recibo VALUES(8279826254,'3AF3OVD73I','producto con retraso');
INSERT INTO Recibo VALUES(8026135539,'3AF3OVD73I','compra en linea');

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

INSERT INTO Descuento VALUES('UU45XOS4W8',15);
INSERT INTO Descuento VALUES('JVDNUY62ES',20);
INSERT INTO Descuento VALUES('3AF3OVD73I',5);
INSERT INTO Descuento VALUES('IHL9IZG2PX',25);
INSERT INTO Descuento VALUES('4G5AWV88ZN',50);

INSERT INTO DescuentoCompra VALUES(7655471947,'UU45XOS4W8');
INSERT INTO DescuentoCompra VALUES(9233244464,'JVDNUY62ES');
INSERT INTO DescuentoCompra VALUES(1880095817,'3AF3OVD73I');
INSERT INTO DescuentoCompra VALUES(8279826254,'IHL9IZG2PX');
INSERT INTO DescuentoCompra VALUES(8026135539,'4G5AWV88ZN');

/* PoblarNoOk */
INSERT INTO Cliente VALUES (0353407188, 'NIT', 'RA Games', 'rag.games@goo.gl');  --El segundo atributo es un CHAR(2)
INSERT INTO Cliente VALUES (0353407188, 'CE', 'RA Games', 'rag.games@goo.gl');  --El segundo atributo puede ser solo CC o NT
INSERT INTO Usuario VALUES (7770106765,NULL); --No puede ser NULL el atributo apodo
INSERT INTO Recibo VALUES ('IHL9IZG2PX','3AF3OVD73I'); --Es un tipo NUMBER el primer atributo
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
