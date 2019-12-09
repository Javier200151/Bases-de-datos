CREATE VIEW Noticias AS(
SELECT numero,tema, X.detalle from Foro, XMLTABLE ('Tdetalle' PASSING Foro.detalle
                 COLUMNS detalle VARCHAR(300) PATH 'detalle')  X , Noticia);
CREATE VIEW GuiaJuego AS(        
SELECT numero,numeroJuego, tipo, W.detalle from Foro, XMLTABLE ('Tdetalle' PASSING Foro.detalle
                 COLUMNS detalle VARCHAR(300) PATH 'detalle') W, Guia);
                 
CREATE INDEX JUEGOSCONGUIA
ON Guia (numeroJuego);
