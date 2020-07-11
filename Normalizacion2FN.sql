DROP DATABASE IF EXISTS Normalizacion2FN;
CREATE DATABASE Normalizacion2FN;
DROP TABLE IF EXISTS Normalizacion2FN.Table1;
CREATE TABLE Normalizacion2FN.`Table1` (
  `Sucursal` int(11) NOT NULL,
  `Factura` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `FormaPago` varchar(2) Not Null,
  `CodigoCliente` int(3) NOT NULL,
  `NombreCliente` varchar(10) Not Null,
  `TotalFactura` float(11,0) NOT NULL ,
  PRIMARY KEY (`Sucursal`,`Factura`)
  ) ;
  
insert into Normalizacion2FN.`Table1` (`Sucursal`, `Factura`, `Fecha`, `FormaPago`, `CodigoCliente`, `NombreCliente`, `TotalFactura`) values
  (01,500,'2006-01-01','E',01,'ALVAREZ',48.20),
  (01,501,'2006-01-02','CC',107,'CASTRO',16),
  (02,500,'2006-01-03','E',110,'LIZ',14.9);

  Select * from Normalizacion2FN.`Table1` ;
  
DROP TABLE IF EXISTS Normalizacion2FN.Table2;
CREATE TABLE Normalizacion2FN.`Table2` (
  `Sucursal` int(11) NOT NULL,
  `Factura` int(11) NOT NULL,
  `CodigoArticulo` int(2) NOT NULL,
  `CantidadArticulo` int(2) NOT NULL,
  `SubTotal` float(11,0) NOT NULL,
    PRIMARY KEY (`Sucursal`,`Factura`,`CodigoArticulo`),
   CONSTRAINT `table1toT2_fk` FOREIGN KEY (`Sucursal`,`Factura`) REFERENCES Normalizacion2FN.`Table1`(`Sucursal`,`Factura` )
  ) ;
  
insert into Normalizacion2FN.`Table2` (`Sucursal`, `Factura`, `CodigoArticulo`,
	`CantidadArticulo`,`SubTotal` ) values
  (01,500,01,3,3.75),
  (01,500,02,6,4.50),
  (01,500,10,8,40),
  (01,501,08,4,16),
  (02,500,20,2,4.9),
  (02,500,10,2,10);

Select * from Normalizacion2FN.`Table2` ;

DROP TABLE IF EXISTS Normalizacion2FN.Table3;
CREATE TABLE Normalizacion2FN.`Table3` (
  `CodigoArticulo` int(2) NOT NULL,
  `NombreArticulo` varchar(10) Not Null,
  `PrecioArticulo` float(11,2) NOT NULL,
    PRIMARY KEY (`CodigoArticulo`)
  ) ;
  
insert into Normalizacion2FN.`Table3` (`CodigoArticulo`,`NombreArticulo`,`PrecioArticulo`) values
  (01,'LAPIZ',1.25),
  (02,'GOMA',0.75),
  (10,'HOJAS',5),
  (08,'COMPAS',4),
  (20,'REGLA',2.45);

Select * from Normalizacion2FN.`Table3` ;
ALTER TABLE Normalizacion2FN.`Table2`  
	ADD CONSTRAINT `table3toT2_fk` 
    FOREIGN KEY (`CodigoArticulo`) 
    REFERENCES Normalizacion2FN.`Table3` (`CodigoArticulo`);
-- test
Select T1.Sucursal, 
	   T1.Factura, 
       Fecha, 
       FormaPago, 
       CodigoCliente, 
       NombreCliente, 
       T2.CodigoArticulo, 
	   NombreArticulo, 
       CantidadArticulo, 
       PrecioArticulo, 
       SubTotal, 
       TotalFactura
from Normalizacion2FN.`Table1` T1,
     Normalizacion2FN.`Table2` T2,
      Normalizacion2FN.`Table3` T3
WHERE T1.Sucursal = T2.Sucursal
  and T1.Factura = T2.Factura
  and T2.CodigoArticulo=T3.CodigoArticulo;