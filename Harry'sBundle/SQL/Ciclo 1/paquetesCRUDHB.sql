/*CRUDE*/
CREATE OR REPLACE PACKAGE PC_PRODUCTO IS
    PROCEDURE AD_Producto (xnombre IN VARCHAR,xcalificacion IN NUMBER, xvalor IN NUMBER, xcomentario IN VARCHAR);
    PROCEDURE MO_Producto (xcodigo IN NUMBER,xcomentario IN VARCHAR);
    PROCEDURE EL_Producto (xcodigo IN NUMBER);
    PROCEDURE AD_Juego (xcodigoJuego IN VARCHAR, xpaquete IN VARCHAR , xcategoria IN VARCHAR, xcreadoPor IN NUMBER, xdescripcion IN XMLTYPE );
    PROCEDURE MO_Juego (xcodigoJuego IN VARCHAR, xpaquete IN VARCHAR );
    PROCEDURE MO_Juego1 (xcodigoJuego IN VARCHAR, xcategoria IN VARCHAR);
    PROCEDURE MO_Juego2(xcodigoJuego IN VARCHAR,  xcreadoPor IN NUMBER );
    PROCEDURE MO_Juego3 (xcodigoJuego IN VARCHAR, xdescripcion IN XMLTYPE);
    PROCEDURE EL_Juego (xcodigoJuego IN VARCHAR); 
    PROCEDURE AD_Paquete (xcodigoPaquete IN VARCHAR);
    PROCEDURE EL_Paquete (xcodigoPaquete IN VARCHAR);
    
    FUNCTION CO_ValorJuego RETURN SYS_REFCURSOR;
    FUNCTION CO_ValorPaquete RETURN SYS_REFCURSOR;  
    FUNCTION CO_JuegoEspecifico(Xtiempo IN NUMBER, xtipo IN VARCHAR, xcategoria IN VARCHAR, xvalor IN NUMBER) RETURN SYS_REFCURSOR;
END PC_PRODUCTO;

CREATE OR REPLACE PACKAGE PC_CLIENTE IS
    PROCEDURE AD_Cliente (xnid IN NUMBER, xtid IN CHAR, xnombre IN VARCHAR, xcorreo IN VARCHAR);
    PROCEDURE MO_Cliente (xid_ IN NUMBER, xcorreo IN VARCHAR);
    PROCEDURE AD_Usuario (xidUsuario IN NUMBER);
    PROCEDURE MO_Usuario (xidUsuario IN NUMBER, xapodoCuenta IN VARCHAR);
    PROCEDURE AD_Desarrolladora (xidDesarrolladora IN NUMBER, XcodigoPago IN NUMBER);
    PROCEDURE MO_Desarrolladora (xidDesarrolladora IN NUMBER, XcodigoPago IN NUMBER);
    
    FUNCTION CO_Porcentaje (xapodo IN VARCHAR) RETURN SYS_REFCURSOR;  
    FUNCTION CO_Cliente RETURN SYS_REFCURSOR;
    FUNCTION CO_Usuario RETURN SYS_REFCURSOR;
    FUNCTION CO_Desarrolladora RETURN SYS_REFCURSOR;
END PC_CLIENTE;

CREATE OR REPLACE PACKAGE PC_COMPRA IS
    PROCEDURE AD_Compra (xvalor IN NUMBER, xpagadoPor IN NUMBER);
    PROCEDURE AD_Recibo (xcodigoCompra IN NUMBER, xcodigoProducto IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE MO_Recibo (xcodigoCompra IN NUMBER, xcodigoProducto IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE AD_CompraProducto (xidUsuarioCP IN NUMBER, xcodigoProducto IN VARCHAR);
    
    FUNCTION CO_Compra RETURN SYS_REFCURSOR;  
    FUNCTION CO_Recibo RETURN SYS_REFCURSOR;
    FUNCTION CO_CompraProducto RETURN SYS_REFCURSOR;
END PC_COMPRA;

CREATE OR REPLACE PACKAGE PC_LOGRO IS
    PROCEDURE AD_Logro (xcodigoJuego IN VARCHAR, xnombreLogro IN VARCHAR, xdescripcion IN VARCHAR, xlogradoPor IN NUMBER);
    PROCEDURE MO_Logro (xcodigoJuego IN VARCHAR, xdescripcion IN VARCHAR);
    PROCEDURE EL_Logro (xcodigoJuego IN VARCHAR);
    PROCEDURE AD_Descuento (xcodigoDescuento IN VARCHAR, xporcentaje IN NUMBER);
    PROCEDURE MO_Descuento (xcodigoDescuento IN VARCHAR, xporcentaje IN NUMBER);
    PROCEDURE AD_DescuentoCompra (xcodigoCompra IN NUMBER, xcodigoDescuento IN VARCHAR);
    
    FUNCTION CO_Logro RETURN SYS_REFCURSOR;  
    FUNCTION CO_Descuento RETURN SYS_REFCURSOR;
    FUNCTION CO_DescuentoCompra RETURN SYS_REFCURSOR;   
END PC_LOGRO;


/*CRUDI*/
CREATE SEQUENCE SECUENCIA_AUTO_PRODUCTO
START WITH 1
INCREMENT BY 1;
CREATE OR REPLACE PACKAGE BODY PC_PRODUCTO IS
    PROCEDURE AD_Producto (xnombre IN VARCHAR,xcalificacion IN NUMBER, xvalor IN NUMBER, xcomentario IN VARCHAR) IS
        BEGIN
          INSERT INTO Producto VALUES(SECUENCIA_AUTO_PRODUCTO.NEXTVAL, xnombre, xcalificacion, xvalor, SYSDATE , xcomentario);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar producto.');
        END;
    PROCEDURE MO_Producto (xcodigo IN NUMBER,xcomentario IN VARCHAR)IS
            BEGIN
          UPDATE Producto SET comentario = xcomentario WHERE xcodigo = codigo ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Producto.');
        END;
    PROCEDURE EL_Producto (xcodigo IN NUMBER)IS
        BEGIN
          DELETE FROM Producto WHERE xcodigo = codigo;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede eliminar Producto.');
              
        END;
    PROCEDURE AD_Juego (xcodigoJuego IN VARCHAR, xpaquete IN VARCHAR , xcategoria IN VARCHAR, xcreadoPor IN NUMBER, xdescripcion IN XMLTYPE )IS
        BEGIN
          INSERT INTO Juego VALUES(xcodigoJuego ,xpaquete , xcategoria , xcreadoPor, xdescripcion  );
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar juego.');
        END;
    PROCEDURE MO_Juego (xcodigoJuego IN VARCHAR, xpaquete IN VARCHAR )IS
      BEGIN
          UPDATE Juego SET paquete =xpaquete  WHERE xcodigoJuego = codigoJuego ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Juego.');
        END;
    PROCEDURE MO_Juego1 (xcodigoJuego IN VARCHAR, xcategoria IN VARCHAR)IS
      BEGIN
          UPDATE Juego SET categoria = xcategoria WHERE xcodigoJuego = codigoJuego ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Juego.');
        END;
    PROCEDURE MO_Juego2 (xcodigoJuego IN VARCHAR,  xcreadoPor IN NUMBER )IS
      BEGIN
          UPDATE Juego SET creadoPor = xcreadoPor WHERE xcodigoJuego = codigoJuego ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Juego.');
        END;
    PROCEDURE MO_Juego3 (xcodigoJuego IN VARCHAR, xdescripcion IN XMLTYPE )IS
      BEGIN
          UPDATE Juego SET descripcion = xdescripcion WHERE codigoJuego = xcodigoJuego ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Juego.');
        END;
    PROCEDURE EL_Juego (xcodigoJuego IN VARCHAR)IS
        BEGIN
          DELETE FROM Juego WHERE xcodigoJuego = codigoJuego;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede eliminar Juego.');
        END;

    PROCEDURE AD_Paquete (xcodigoPaquete IN VARCHAR)IS
        BEGIN
            INSERT INTO Paquete VALUES(xcodigoPaquete , SYSDATE +7);
            COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar Paquete.');
        END;

    PROCEDURE EL_Paquete (xcodigoPaquete IN VARCHAR)IS
        BEGIN
            DELETE FROM Paquete WHERE xcodigoPaquete = codigoPaquete;
            COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede eliminar Paquete.');
        END;

    
    FUNCTION CO_ValorJuego RETURN SYS_REFCURSOR IS  CO_ValorJuego_  SYS_REFCURSOR;
        BEGIN
            OPEN CO_ValorJuego_ FOR
                SELECT nombre,valor FROM producto
                JOIN juego ON (juego.codigoJuego=producto.codigo)
                WHERE codigoJuego=codigo ;          
            RETURN CO_ValorJuego_;
        END;
    FUNCTION CO_ValorPaquete RETURN SYS_REFCURSOR IS CO_ValorPaquete_ SYS_REFCURSOR; 
        BEGIN
            OPEN CO_ValorPaquete_ FOR
                SELECT nombre,valor FROM producto
                JOIN Paquete ON (Paquete.codigoPaquete=producto.codigo)
                WHERE codigoPaquete=codigo ;         
            RETURN CO_ValorPaquete_;
        END;  
    FUNCTION CO_JuegoEspecifico(Xtiempo IN NUMBER, xtipo IN VARCHAR, xcategoria IN VARCHAR, xvalor IN NUMBER) RETURN SYS_REFCURSOR IS CO_JuegoEspecifico_ SYS_REFCURSOR;
        BEGIN
            OPEN CO_JuegoEspecifico_ FOR
                SELECT Producto.nombre,X.tipo  tipo,X.tiempoJuego AS TiempodeJuegoEnHoras ,Producto.valor
                FROM Juego,XMLTABLE ('Tdescripcion' PASSING Juego.descripcion
                COLUMNS tipo VARCHAR(300) PATH 'tipo',tiempoJuego NUMBER(5) PATH 'tiempoJuego') X , Producto WHERE Producto.codigo=Juego.codigoJuego AND X.tiempoJuego>Xtiempo AND NOT(X.tipo=xtipo) and Juego.categoria =xcategoria and Producto.valor <xvalor;         
            RETURN CO_JuegoEspecifico_;
        END;

END PC_PRODUCTO;

CREATE SEQUENCE SECUENCIA_AUTO_CLIENTE
START WITH 1
INCREMENT BY 1;
CREATE OR REPLACE PACKAGE BODY PC_CLIENTE IS
    PROCEDURE AD_Cliente (xnid IN NUMBER, xtid IN CHAR, xnombre IN VARCHAR, xcorreo IN VARCHAR)IS
        BEGIN
          INSERT INTO Cliente VALUES(SECUENCIA_AUTO_CLIENTE.NEXTVAL, xnid, xtid, xnombre, xcorreo);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar cLiente.');
        END;
    PROCEDURE MO_Cliente (xid_ IN NUMBER, xcorreo IN VARCHAR) IS
      BEGIN
          UPDATE Cliente SET correo = xcorreo WHERE xid_ = id_ ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Cliente.');
      END;
    PROCEDURE AD_Usuario (xidUsuario IN NUMBER) IS
        BEGIN
          INSERT INTO Usuario VALUES(xidUsuario, 'USER');
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar Usuario.');
        END;
    PROCEDURE MO_Usuario (xidUsuario IN NUMBER, xapodoCuenta IN VARCHAR)IS
    BEGIN
            UPDATE Usuario SET apodoCuenta = xapodoCuenta WHERE idUsuario = xidUsuario ;
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Usuario.');
    END;
    PROCEDURE AD_Desarrolladora (xidDesarrolladora IN NUMBER, XcodigoPago IN NUMBER)IS
        BEGIN
          INSERT INTO Desarrolladora VALUES(xidDesarrolladora, XcodigoPago);
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede insertar Desarrolladora.');
        END;
    PROCEDURE MO_Desarrolladora (xidDesarrolladora IN NUMBER, XcodigoPago IN NUMBER)IS
      BEGIN
          UPDATE Desarrolladora SET codigoPago = XcodigoPago WHERE idDesarrolladora = xidDesarrolladora ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Desarrolladora.');
      END;
    
    FUNCTION CO_Porcentaje (xapodo IN VARCHAR) RETURN SYS_REFCURSOR IS CO_Porcentaje_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Porcentaje_ FOR
                SELECT nombreLogro,porcentaje FROM logro
                JOIN usuario ON (usuario.idUsuario=logro.logradoPor)
                JOIN descuento ON (descuento.codigoDescuento=logro.codigoJuego)
                WHERE apodoCuenta=xapodo AND logradoPor = idUsuario     ;     
            RETURN CO_Porcentaje_;
        END;
    FUNCTION CO_Cliente RETURN SYS_REFCURSOR IS CO_Cliente_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Cliente_ FOR
                SELECT * FROM Cliente;
                         
            RETURN CO_Cliente_;
        END;
    FUNCTION CO_Usuario RETURN SYS_REFCURSOR IS CO_Usuario_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Usuario_ FOR
                SELECT * FROM Usuario;
                       
            RETURN CO_Usuario_;
        END;
    FUNCTION CO_Desarrolladora RETURN SYS_REFCURSOR IS CO_Desarrolladora_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Desarrolladora_ FOR
                SELECT * FROM Desarrolladora;
                     
            RETURN CO_Desarrolladora_;
        END;
END PC_CLIENTE;

CREATE SEQUENCE SECUENCIA_AUTO_COMPRA
START WITH 1
INCREMENT BY 1;
CREATE OR REPLACE PACKAGE BODY PC_COMPRA IS
    PROCEDURE AD_Compra (xvalor IN NUMBER, xpagadoPor IN NUMBER) IS
        BEGIN
              INSERT INTO Compra VALUES(SECUENCIA_AUTO_COMPRA.NEXTVAL, xvalor, xpagadoPor);
              COMMIT;
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar Compra.');
        END;
    PROCEDURE AD_Recibo (xcodigoCompra IN NUMBER, xcodigoProducto IN VARCHAR, xdescripcion IN VARCHAR) IS
        BEGIN
              INSERT INTO Recibo VALUES( xcodigoCompra, xcodigoProducto, xdescripcion);
              COMMIT;
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar Recibo.');
        END;
    PROCEDURE MO_Recibo (xcodigoCompra IN NUMBER, xcodigoProducto IN VARCHAR, xdescripcion IN VARCHAR) IS
      BEGIN
          UPDATE Recibo SET descripcion = xdescripcion WHERE xcodigoCompra = codigoCompra AND xcodigoProducto = codigoProducto;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Recibo.');
      END;
    
    PROCEDURE AD_CompraProducto (xidUsuarioCP IN NUMBER, xcodigoProducto IN VARCHAR) IS
        BEGIN
              INSERT INTO CompraProducto VALUES( xidUsuarioCP, xcodigoProducto);
              COMMIT;
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar.');
        END;
    
    FUNCTION CO_Compra RETURN SYS_REFCURSOR IS CO_Compra_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Compra_ FOR
                SELECT * FROM Compra;
                     
            RETURN CO_Compra_;
        END;  
    FUNCTION CO_Recibo RETURN SYS_REFCURSOR IS CO_Recibo_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Recibo_ FOR
                SELECT * FROM Recibo;
                     
            RETURN CO_Recibo_;
        END;
    FUNCTION CO_CompraProducto RETURN SYS_REFCURSOR IS CO_CompraProducto_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_CompraProducto_ FOR
                SELECT * FROM CompraProducto;
                     
            RETURN CO_CompraProducto_;
        END;
END PC_COMPRA;

CREATE OR REPLACE PACKAGE BODY PC_LOGRO IS
    PROCEDURE AD_Logro (xcodigoJuego IN VARCHAR, xnombreLogro IN VARCHAR, xdescripcion IN VARCHAR, xlogradoPor IN NUMBER) IS
        BEGIN
              INSERT INTO Logro VALUES( xcodigoJuego, xnombreLogro, xdescripcion, xlogradoPor);
              COMMIT;
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar Logro.');
        END;
    PROCEDURE MO_Logro (xcodigoJuego IN VARCHAR, xdescripcion IN VARCHAR) IS
      BEGIN
          UPDATE Logro SET descripcion = xdescripcion WHERE xcodigoJuego = xcodigoJuego ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Logro.');
      END;
    PROCEDURE EL_Logro (xcodigoJuego IN VARCHAR) IS
        BEGIN
          DELETE FROM Logro WHERE codigoJuego = xcodigoJuego;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede eliminar Logro.');
        END;
    PROCEDURE AD_Descuento (xcodigoDescuento IN VARCHAR, xporcentaje IN NUMBER) IS
        BEGIN
              INSERT INTO Descuento VALUES( xcodigoDescuento, xporcentaje);
              COMMIT;
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar Descuento.');
        END;
    PROCEDURE MO_Descuento (xcodigoDescuento IN VARCHAR, xporcentaje IN NUMBER) IS
      BEGIN
          UPDATE Descuento SET porcentaje = xporcentaje WHERE codigoDescuento = xcodigoDescuento ;
          COMMIT;
        EXCEPTION
          WHEN OTHERS THEN
            ROLLBACK;
              RAISE_APPLICATION_ERROR (-20039,'No se puede modificar Descuento.');
      END;
    PROCEDURE AD_DescuentoCompra (xcodigoCompra IN NUMBER, xcodigoDescuento IN VARCHAR) IS
        BEGIN
              INSERT INTO DescuentoCompra VALUES( xcodigoCompra, xcodigoDescuento);
              COMMIT;
            EXCEPTION
              WHEN OTHERS THEN
                ROLLBACK;
                    RAISE_APPLICATION_ERROR (-20039,'No se puede insertar.');
        END;
    
    FUNCTION CO_Logro RETURN SYS_REFCURSOR IS CO_Logro_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Logro_ FOR
                SELECT * FROM Logro;
                     
            RETURN CO_Logro_;
        END;  
    FUNCTION CO_Descuento RETURN SYS_REFCURSOR IS CO_Descuento_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_Descuento_ FOR
                SELECT * FROM Descuento;
                     
            RETURN CO_Descuento_;
        END;
    FUNCTION CO_DescuentoCompra RETURN SYS_REFCURSOR IS CO_DescuentoCompra_ SYS_REFCURSOR ;  
        BEGIN
            OPEN CO_DescuentoCompra_ FOR
                SELECT * FROM DescuentoCompra;
                     
            RETURN CO_DescuentoCompra_;
        END;   
END PC_LOGRO;

/*CRUDOk*/
SELECT PC_LOGRO.CO_DescuentoCompra FROM DUAL;
EXECUTE PC_LOGRO.AD_DescuentoCompra( 1, 'A1');
/*CRUDNoOK*/
EXECUTE PC_LOGRO.AD_DescuentoCompra('A2', 'A1');
SELECT PC_LOGRO.MO_Descuento FROM DUAL;

DROP PACKAGE PC_PRODUCTO;
DROP PACKAGE PC_CLIENTE;
DROP PACKAGE PC_COMPRA;
DROP PACKAGE PC_LOGRO;
