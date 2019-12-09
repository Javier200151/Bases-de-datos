    /*Numero y fecha del foro automatico*/
    CREATE OR REPLACE TRIGGER AutomatizacionFORO 
    BEFORE INSERT ON Foro
    REFERENCING NEW AS NEW FOR EACH ROW
    DECLARE 
    valor NUMBER;
    BEGIN
        SELECT COUNT(*) INTO valor FROM Foro;
        :NEW.numero:= valor+1;
        :NEW.fecha := sysdate;
    END AutomatizacionFORO;
    /* Prueba */
    DROP TRIGGER AutomatizacionFORO;
    /*Se puede modificar el detalle y los comentarios*/
    CREATE OR REPLACE TRIGGER Updateforo
    BEFORE UPDATE OF numero, idCliente, fecha 
    ON Foro
    BEGIN
        RAISE_APPLICATION_ERROR(-20004,'Solo se puede modificar el detalle del foro');
    END Updateforo;
    /* Prueba */
    UPDATE Foro SET numero = 6 WHERE numero = 1;
    DROP TRIGGER Updateforo;
    /*Se puede modificar el detalle y los comentarios*/
    CREATE OR REPLACE TRIGGER Updateforo2
    BEFORE UPDATE OF  numeroForo, numeroComentario 
    ON Comentario
    BEGIN
        RAISE_APPLICATION_ERROR(-20004,'Solo se puede modificar el comentario del foro');
    END Updateforo2;
    /* Prueba */
    UPDATE Comentario SET numeroForo = 6 WHERE numeroForo = 1;   
    DROP TRIGGER Updateforo2;
    /*Se pueden eliminar foros si no tiene comentarios*/
    CREATE OR REPLACE TRIGGER DeleteForo
    BEFORE DELETE ON foro
    FOR EACH ROW
    DECLARE VALOR NUMBER;
    BEGIN
        SELECT COUNT(*) INTO VALOR FROM Comentario WHERE :OLD.numero = numeroForo;  
        IF
        VALOR > 0
        THEN
        RAISE_APPLICATION_ERROR(-20005,'No es posible borrarlo.');
        END IF;
    END DeleteForo;
    /* Prueba */
    DELETE FROM FORO WHERE numero = 1;
    DROP TRIGGER DeleteForo;
