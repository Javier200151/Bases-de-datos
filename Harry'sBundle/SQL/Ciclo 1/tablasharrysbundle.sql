/* Tablas */
CREATE TABLE Producto (codigo VARCHAR(10) NOT NULL, nombre VARCHAR(25) NOT NULL,calificacion NUMBER(1) NULL, valor NUMBER(6) NOT NULL, fecha DATE NOT NULL, comentario VARCHAR(100) NULL);
CREATE TABLE Paquete (codigoPaquete VARCHAR(10) NOT NULL, caducidad DATE);
CREATE TABLE Juego (codigoJuego VARCHAR(10) NOT NULL, paquete VARCHAR(10) NULL, categoria VARCHAR(25) NOT NULL, creadoPor NUMBER(11) NOT NULL, descripcion XMLTYPE NULL);

CREATE TABLE Cliente (id_ NUMBER(11) NOT NULL,nid NUMBER(11) NOT NULL, tid CHAR(2) NOT NULL, nombre VARCHAR(25) NOT NULL, correo VARCHAR(25) NULL);
CREATE TABLE Usuario (idUsuario NUMBER(11) NOT NULL, apodoCuenta VARCHAR(10) NOT NULL);
CREATE TABLE Desarrolladora (idDesarrolladora NUMBER(11) NOT NULL, codigoPago NUMBER(11) NOT NULL);

CREATE TABLE Compra (codigo NUMBER(11) NOT NULL,valor NUMBER(6) NOT NULL, pagadoPor NUMBER(11));
CREATE TABLE Recibo (codigoCompra NUMBER(11) NOT NULL, codigoProducto VARCHAR(11) NOT NULL, descripcion VARCHAR(100) NOT NULL);
CREATE TABLE CompraProducto (idUsuarioCP NUMBER(11) NOT NULL, codigoProducto VARCHAR(10) NOT NULL);

CREATE TABLE Logro (codigoJuego VARCHAR(10) NOT NULL, nombreLogro VARCHAR(25) NOT NULL, descripcion VARCHAR(40) NULL, logradoPor NUMBER(11) NULL);
CREATE TABLE Descuento (codigoDescuento VARCHAR(10) NOT NULL, porcentaje NUMBER(3) NOT NULL);
CREATE TABLE DescuentoCompra (codigoCompra NUMBER(11) NOT NULL, codigoDescuento VARCHAR(10) NOT NULL);

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
