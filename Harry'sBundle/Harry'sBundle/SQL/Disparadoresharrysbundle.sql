/* Actualizar el catalogo de juegos */

    /*El codigo del producto se genera automaticamente*/
        /*La fecha se define automaticamente al ingresarse*/
    CREATE OR REPLACE TRIGGER AutomatizacionProducto 
    BEFORE INSERT ON Producto
    REFERENCING NEW AS NEW FOR EACH ROW
    DECLARE 
    valor NUMBER;
    BEGIN
        SELECT COUNT(*) INTO valor FROM Cliente;
        :NEW.codigo:= valor+1;
        :NEW.fecha := sysdate;
    END AutomatizacionProducto;
    
    DROP TRIGGER AutomatizacionProducto;
     /* Prueba */
    INSERT INTO Producto VALUES ('48GVKQ956D', 'Rackman pack', 2, 55060, TO_DATE('2019/12/19','YYYY/MM/DD'), NULL);
    
    /*Solo se puede modificar el comentario del producto*/
    CREATE OR REPLACE TRIGGER UpdateProducto
    BEFORE UPDATE OF codigo, nombre ,calificacion , valor, fecha
    ON producto
    BEGIN
        RAISE_APPLICATION_ERROR(-20004,'Solo se puede modificar el comentario del producto');
    END UpdateProducto;
    /* Prueba */

    UPDATE producto SET nombre = 'CasualGame' WHERE codigo = '48GVKQ956D';
    DROP TRIGGER UpdateProducto;
    


    /*La caducidad del paquete se define automaticamente una semana despues*/
    CREATE OR REPLACE TRIGGER AutomatizacionProducto2
    BEFORE INSERT ON paquete
    REFERENCING NEW AS NEW FOR EACH ROW
    BEGIN
        :NEW.caducidad := sysdate + 7;
    END AutomatizacionProducto2;
    /* Prueba */
    INSERT INTO Paquete VALUES('48GVKQ956D',TO_DATE('2019/12/19','YYYY/MM/DD'));
    DROP TRIGGER AutomatizacionProducto2;
    
    /*El paquete solo se puede eliminar si la fecha de caducidad se cumplió*/
    CREATE OR REPLACE TRIGGER DeletePaquete
    BEFORE DELETE ON paquete
    FOR EACH ROW
    BEGIN
        IF
        :OLD.caducidad >= sysdate()
        THEN
        RAISE_APPLICATION_ERROR(-20005,'No es posible borrarlo, pues la fecha de caducidad no se ha cumplido');
        END IF;
    END DeletePaquete;
    /* Prueba */
    DELETE FROM Paquete WHERE codigoPaquete='48GVKQ956D';
    DROP TRIGGER DeletePaquete;

/*Mantener los bonos de juego a los usuarios */
    
    /*Solo es posible actualizar la descripcion del logro y el porcentaje de descuento*/
    CREATE OR REPLACE TRIGGER UpdateDescuento
    BEFORE UPDATE OF codigoDescuento
    ON Descuento
    BEGIN
        RAISE_APPLICATION_ERROR(-20004,'Solo es posible actualizar la descripcion del logro y el porcentaje de descuento');
    END UpdateDescuento;
    /* Prueba */
    UPDATE Descuento SET codigoDescuento = 'DDASF5D' WHERE porcentaje = 20;
    DROP TRIGGER UpdateDescuento;
    
    /*Solo se puede eliminar un logro si este no ha sido logrado por nadie*/
    CREATE OR REPLACE TRIGGER DeleteLogro
    BEFORE DELETE ON Logro
    FOR EACH ROW
    BEGIN
        IF :OLD.logradoPor <> NULL 
        THEN RAISE_APPLICATION_ERROR(-20004,'No es posible borrarun logro');
        END IF;
    END DeleteLogro;
    /* Prueba */
    DELETE FROM Logro WHERE codigoJuego = 'UU45XOS4W8';
    DROP TRIGGER DeleteLogro;

/*Registrar Usuario*/
    
    /*El numero de id del cliente es generado automaticamente*/
    CREATE OR REPLACE TRIGGER AutomatizacionCliente 
    BEFORE INSERT ON Cliente
    REFERENCING NEW AS NEW FOR EACH ROW
    DECLARE 
    valor NUMBER;
    BEGIN
        SELECT COUNT(*) INTO valor FROM Cliente;
        :NEW.id_:= valor+1;
    END AutomatizacionCliente;
    /* Prueba */
    INSERT INTO Cliente VALUES (0353407188, 'NT', 'RA Games', 'rag.gaes@goo.gl');
    DROP TRIGGER AutomatizacionCliente;
    
    /*El apodo de cuenta se coloca como el nombre automaticamente*/
    CREATE OR REPLACE TRIGGER AutomatizacionUsuario
    BEFORE INSERT ON Usuario 
    FOR EACH ROW
    DECLARE 
    valor VARCHAR(50);
    BEGIN
        SELECT nombre INTO valor FROM Cliente WHERE :NEW.idUsuario = id_;
        :NEW.apodoCuenta := valor;
    END AutomatizacionUsuario;
    /* Prueba */
    INSERT INTO Usuario VALUES (078551463,'KiritoPvP');
    INSERT INTO Cliente VALUES (078551463, 'CC', 'Elon Musk', 'elon.muskk@utexas.edu');
    DROP TRIGGER AutomatizacionUsuario;
    
    /*No es posible eliminar un cliente*/    
    CREATE OR REPLACE TRIGGER DeleteCliente 
    BEFORE DELETE
    ON Cliente
    BEGIN RAISE_APPLICATION_ERROR(-20004,'No es posible borrar un cliente');
    END DeleteCliente ;
    /* Prueba */
    DELETE FROM Cliente WHERE id_ = 0785514639;
    DROP TRIGGER DeleteCliente;
    
    /*Se puede actualizar el correo */
    CREATE OR REPLACE TRIGGER UpdateCliente
    BEFORE UPDATE OF id_,nid, tid , nombre 
    ON Cliente
    BEGIN
        RAISE_APPLICATION_ERROR(-20004,'Solo se puede actualizar el correo ');
    END UpdateCliente;
    /* Prueba */
    UPDATE Cliente SET id_ = 653132486 WHERE id_ = 0785514639;
    DROP TRIGGER UpdateCliente;
    
    /*Se puede actualizar el apodo de cuenta*/
    CREATE OR REPLACE TRIGGER UpdateUsuario
    BEFORE UPDATE OF idUsuario
    ON Usuario
    BEGIN
        RAISE_APPLICATION_ERROR(-20004,'Solo se puede actualizar el apodo de cuenta');
    END UpdateUsuario;
    /* Prueba */
    UPDATE Usuario SET idUsuario = 653132486 WHERE idUsuario = 0785514639;
    DROP TRIGGER UpdateUsuario;

/*Registrar Pago*/
    
    /*No es posible actualizar ningun dato de la compra*/
    CREATE OR REPLACE TRIGGER UpdateCompra
    BEFORE UPDATE
    ON Compra
    BEGIN
        RAISE_APPLICATION_ERROR(-20004,'No es posible modificar una compra');
    END UpdateCompra;
    /* Prueba */
    UPDATE Compra SET codigo = 153132486 WHERE codigo = 7655471947;
    DROP TRIGGER UpdateCompra;
    
    /*El codigo de la compra se genera automaticamente en orden consecutivo*/
    CREATE OR REPLACE TRIGGER AutomatizacionCompra
    BEFORE INSERT ON Compra
    REFERENCING NEW AS NEW FOR EACH ROW
    DECLARE valor NUMBER;
    BEGIN
    SELECT COUNT(*) INTO valor FROM Compra;
    :NEW.codigo:= valor+1;
    END AutomatizacionCompra;
    /* Prueba */
    INSERT INTO Compra VALUES(7655471947,49033,4498243436);
    DROP TRIGGER AutomatizacionCompra;
    
    /*El valor de la compra debe coincidir con el valor de algun producto*/
    CREATE OR REPLACE TRIGGER InsertCompra
    BEFORE INSERT ON Compra
    REFERENCING NEW AS NEW FOR EACH ROW
    DECLARE valor NUMBER;
    BEGIN
    SELECT COUNT(*) INTO valor FROM Producto WHERE :NEW.valor = producto.valor;
    If VALOR = 0
    THEN 
    RAISE_APPLICATION_ERROR(-20003,'No existe el valor en ningún producto');
    END IF;
    END InsertCompra;
    /* Prueba */
    INSERT INTO Producto VALUES ('ZVI7WO1XLD', '90s', 5, 49033, '6/8/2019', NULL);
    INSERT INTO Compra VALUES(7655471947,49033,4498243436);
    DROP TRIGGER InsertCompra;
    
    /*No es posible eliminar ninguna compra*/
    CREATE OR REPLACE TRIGGER DeleteCompra 
    BEFORE DELETE
    ON Compra
    BEGIN RAISE_APPLICATION_ERROR(-20004,'No es posible borrar una compra');
    END DeleteCompra;
    /* Prueba */
    DELETE FROM Compra WHERE codigo = 0785514639;
    DROP TRIGGER DeleteCompra;