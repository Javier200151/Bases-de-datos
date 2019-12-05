/* Consultas */

/* Consultar el catalogo de juegos */
SELECT nombre,valor FROM producto
JOIN juego ON (juego.codigoJuego=producto.codigo)
WHERE codigoJuego=codigo;

/* Consultar bonos obtenidos */
SELECT SUM(logradoPor) FROM logro
JOIN usuario ON (usuario.idUsuario=logro.logradoPor)
WHERE apodoCuenta='Rylod' AND logradoPor = idUsuario;

SELECT nombreLogro,porcentaje FROM logro
JOIN usuario ON (usuario.idUsuario=logro.logradoPor)
JOIN descuento ON (descuento.codigoDescuento=logro.codigoJuego)
WHERE apodoCuenta='Rylod' AND logradoPor = idUsuario;

/* Consultar paquetes de juegos */
SELECT nombre,valor FROM producto
JOIN Paquete ON (Paquete.codigoPaquete=producto.codigo)
WHERE codigoPaquete=codigo;

/*Consultar los comentarios de cada una de las secciones de cada segmento*/
SELECT Producto.nombre,X.tipo  tipo,X.tiempoJuego AS TiempodeJuegoEnHoras ,Producto.valor
  FROM Juego,
       XMLTABLE ('Tdescripcion' PASSING Juego.descripcion
                 COLUMNS tipo VARCHAR(300) PATH 'tipo',tiempoJuego NUMBER(5) PATH 'tiempoJuego') X , Producto WHERE Producto.codigo=Juego.codigoJuego AND X.tiempoJuego>30 AND NOT(X.tipo='un jugador') and Juego.categoria ='Plataformas' and Producto.valor <60000;