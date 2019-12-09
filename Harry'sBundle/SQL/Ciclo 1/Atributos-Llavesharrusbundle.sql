
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
ALTER TABLE Usuario ADD CONSTRAINT CK_Usuario_id CHECK(idUsuario>=99999999 OR idUsuario<=9999999999);
ALTER TABLE Desarrolladora ADD CONSTRAINT CK_Desarrolladora_id CHECK(idDesarrolladora>=99999999 OR idDesarrolladora<=9999999999);
ALTER TABLE CompraProducto ADD CONSTRAINT CK_CompraProducto_id CHECK(idUsuarioCP>=99999999 OR idUsuarioCP<=9999999999);

/* PRIMARIAS */
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (codigo);
ALTER TABLE Paquete ADD CONSTRAINT PK_Paquete PRIMARY KEY (codigoPaquete);
ALTER TABLE Juego ADD CONSTRAINT PK_Juego PRIMARY KEY (codigoJuego);

ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (id_);
ALTER TABLE Usuario ADD CONSTRAINT PK_Usuario PRIMARY KEY (idUsuario);
ALTER TABLE Desarrolladora ADD CONSTRAINT PK_Desarrolladora PRIMARY KEY (idDesarrolladora);

ALTER TABLE Compra ADD CONSTRAINT PK_Compra PRIMARY KEY (codigo);
ALTER TABLE Recibo ADD CONSTRAINT PK_Recibo PRIMARY KEY (codigoCompra,codigoProducto);
ALTER TABLE CompraProducto ADD CONSTRAINT PK_CompraProducto PRIMARY KEY (idUsuarioCP, codigoProducto);

ALTER TABLE Logro ADD CONSTRAINT PK_Logro PRIMARY KEY (codigoJuego);
ALTER TABLE Descuento ADD CONSTRAINT PK_Descuento PRIMARY KEY (codigoDescuento);
ALTER TABLE DescuentoCompra ADD CONSTRAINT PK_DescuentoCompra PRIMARY KEY (codigoCompra, codigoDescuento);

/* UNICAS */
ALTER TABLE Cliente ADD CONSTRAINT UK_Cliente UNIQUE (correo);

/* FORANEAS */
ALTER TABLE Juego ADD CONSTRAINT FK_Juego FOREIGN KEY (codigoJuego) REFERENCES Producto(codigo) ON DELETE CASCADE ;
ALTER TABLE Paquete ADD CONSTRAINT FK_Paquete FOREIGN KEY (codigoPaquete) REFERENCES Producto(codigo)ON DELETE CASCADE;
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario FOREIGN KEY (idUsuario) REFERENCES Cliente(id_);
ALTER TABLE Desarrolladora ADD CONSTRAINT FK_Desarrolladora FOREIGN KEY (idDesarrolladora) REFERENCES Cliente(id_);
ALTER TABLE Compra ADD CONSTRAINT FK_Compra FOREIGN KEY (pagadoPor) REFERENCES Usuario(idUsuario);
ALTER TABLE CompraProducto ADD CONSTRAINT FK_CompraProducto_1 FOREIGN KEY (idUsuarioCP) REFERENCES Usuario(idUsuario);
ALTER TABLE CompraProducto ADD CONSTRAINT FK_CompraProducto_2 FOREIGN KEY (codigoProducto) REFERENCES Producto(codigo);
ALTER TABLE Recibo ADD CONSTRAINT FK_Recibo_2 FOREIGN KEY (codigoCompra) REFERENCES Compra(codigo);
ALTER TABLE Recibo ADD CONSTRAINT FK_Recibo_3 FOREIGN KEY (codigoProducto) REFERENCES Producto(codigo);
ALTER TABLE Logro ADD CONSTRAINT FK_Logro_1 FOREIGN KEY (codigoJuego) REFERENCES Juego(codigoJuego) ON DELETE CASCADE;
ALTER TABLE Descuento ADD CONSTRAINT FK_Descuento FOREIGN KEY (codigoDescuento) REFERENCES Logro(codigoJuego) ON DELETE CASCADE;
ALTER TABLE DescuentoCompra ADD CONSTRAINT FK_DescuentoCompra_1 FOREIGN KEY (codigoCompra) REFERENCES Compra(codigo);
ALTER TABLE DescuentoCompra ADD CONSTRAINT FK_DescuentoCompra_2 FOREIGN KEY (codigoDescuento) REFERENCES Descuento(codigoDescuento);
