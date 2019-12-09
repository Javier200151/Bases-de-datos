SELECT DISTINCT numero,tema, X.detalle from Foro, XMLTABLE ('Tdetalle' PASSING Foro.detalle
                 COLUMNS detalle VARCHAR(300) PATH 'detalle')  X , Noticia;
        
SELECT DISTINCT numero, numeroJuego, tipo, W.detalle from Foro, XMLTABLE ('Tdetalle' PASSING Foro.detalle
                 COLUMNS detalle VARCHAR(300) PATH 'detalle') W, Guia;