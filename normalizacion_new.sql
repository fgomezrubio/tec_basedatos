CREATE DATABASE Ejemplo;
use Ejemplo;
DROP TABLE IF EXISTS Articulo_Details;
CREATE TABLE Articulo_Details (
  CodigoArticulo int NOT NULL,
  NombreArticulo varchar(10) NOT NULL,
  PrecioArticulo float(11,2) NOT NULL,
  PRIMARY KEY (CodigoArticulo),
  UNIQUE KEY nombre_unico (NombreArticulo)
);
INSERT INTO Articulo_Details 
     VALUES (1,'LAPIZ',1.25),
            (2,'GOMA',0.75),
            (8,'COMPAS',4.00),
            (10,'HOJAS',5.00),
            (20,'REGLA',2.45);

DROP TABLE IF EXISTS Cliente_Details;
CREATE TABLE Cliente_Details (
  CodigoCliente int NOT NULL,
  NombreCliente varchar(10) NOT NULL,
  PRIMARY KEY (CodigoCliente)
);

INSERT INTO Cliente_Details 
     VALUES (1,'ALVAREZ'),
            (107,'CASTRO'),
            (110,'LIZ');

DROP TABLE IF EXISTS Factura_Header;
CREATE TABLE Factura_Header (
  Sucursal int NOT NULL,
  Factura int NOT NULL,
  Fecha date NOT NULL,
  FormaPago varchar(2) NOT NULL,
  CodigoCliente int NOT NULL,
  TotalFactura float(11,0) NOT NULL,
  PRIMARY KEY (Sucursal,Factura),
  KEY fk_facturaheader_clientedetails (CodigoCliente),
  CONSTRAINT fk_facturaheader_clientedetails FOREIGN KEY (CodigoCliente) REFERENCES Cliente_Details (CodigoCliente)
);

INSERT INTO Factura_Header 
     VALUES (1,500,'2006-01-01','E',1,48),
            (1,501,'2006-01-02','CC',107,16),
            (2,500,'2006-01-03','E',110,15);

DROP TABLE IF EXISTS Factura_Details;
CREATE TABLE Factura_Details (
  Sucursal int NOT NULL,
  Factura int NOT NULL,
  CodigoArticulo int NOT NULL,
  CantidadArticulo int NOT NULL,
  SubTotal float(11,0) NOT NULL,
  PRIMARY KEY (Sucursal,Factura,CodigoArticulo),
  KEY fk_facturadetails_to_articulodetails (CodigoArticulo),
  CONSTRAINT fk_facturadetails_to_articulodetails 
    FOREIGN KEY (CodigoArticulo) 
    REFERENCES Articulo_Details (CodigoArticulo),
  CONSTRAINT fk_facturadetails_to_facturaheader 
   FOREIGN KEY (Sucursal, Factura) 
   REFERENCES Factura_Header (Sucursal, Factura)
);

INSERT INTO Factura_Details 
      VALUES (1,500,1,3,4),
             (1,500,2,6,4), 
             (1,500,10,8,40),
             (1,501,8,4,16),
             (2,500,10,2,10),
             (2,500,20,2,5);

Select T1.Sucursal, T1.Factura, Fecha, FormaPago, T1.CodigoCliente, NombreCliente, T2.CodigoArticulo, 
       NombreArticulo, CantidadArticulo, PrecioArticulo, SubTotal, TotalFactura
from Normalizacion.`Factura_Header` T1,
     Normalizacion.`Factura_Details` T2,
     Normalizacion.`Articulo_Details` T3,
     Normalizacion.`Cliente_Details` T4
WHERE T1.Sucursal = T2.Sucursal
  and T1.Factura = T2.Factura
  and T2.CodigoArticulo=T3.CodigoArticulo
  and T1.CodigoCliente=T4.CodigoCliente;

