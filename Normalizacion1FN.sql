DROP DATABASE IF EXISTS Normalizacion1N;
CREATE DATABASE Normalizacion1N;
DROP TABLE IF EXISTS Normalizacion1N.Table1;
CREATE TABLE Normalizacion1N.`Table1` (
  `Sucursal` int(11) NOT NULL,
  `Factura` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `FormaPago` varchar(2) Not Null,
  `CodigoCliente` int(3) NOT NULL,
  `NombreCliente` varchar(10) Not Null,
  `TotalFactura` float(11,0) NOT NULL ,
  PRIMARY KEY (`Sucursal`,`Factura`)
  ) ;
  
insert into Normalizacion1N.`Table1` (`Sucursal`, `Factura`, `Fecha`, `FormaPago`, `CodigoCliente`, `NombreCliente`, `TotalFactura`) values
  (01,500,'2006-01-01','E',01,'ALVAREZ',48.20),
  (01,501,'2006-01-02','CC',107,'CASTRO',16),
  (02,500,'2006-01-03','E',110,'LIZ',14.9);

  Select * from Normalizacion1N.`Table1` ;
  
DROP TABLE IF EXISTS Normalizacion1N.Table2;
CREATE TABLE Normalizacion1N.`Table2` (
  `Sucursal` int(11) NOT NULL,
  `Factura` int(11) NOT NULL,
  `CodigoArticulo` int(2) NOT NULL,
  `NombreArticulo` varchar(10) Not Null,
  `CantidadArticulo` int(2) NOT NULL,
  `PrecioArticulo` float(11,2) NOT NULL,
  `SubTotal` float(11,0) NOT NULL,
    PRIMARY KEY (`Sucursal`,`Factura`,`CodigoArticulo`),
   CONSTRAINT `table1toT2_fk` FOREIGN KEY (`Sucursal`,`Factura`) REFERENCES Normalizacion1N.`Table1`(`Sucursal`,`Factura` )
  ) ;
  
insert into Normalizacion1N.`Table2` (`Sucursal`, `Factura`, `CodigoArticulo`,
	`NombreArticulo`, `CantidadArticulo`,`PrecioArticulo`,`SubTotal` ) values
  (01,500,01,'LAPIZ',3,1.25,3.75),
  (01,500,02,'GOMA',6,0.75,4.50),
  (01,500,10,'HOJAS',8,5,40),
  (01,501,08,'COMPAS',4,4,16),
  (02,500,20,'REGLA',2,2.45,4.9),
  (02,500,10,'HOJAS',2,5.0,10);

Select * from Normalizacion1N.`Table2` ;

-- test
Select T1.Sucursal, T1.Factura, Fecha, FormaPago, CodigoCliente, NombreCliente, CodigoArticulo, 
	   NombreArticulo, CantidadArticulo, PrecioArticulo, SubTotal, TotalFactura
from Normalizacion1N.`Table1` T1,
     Normalizacion1N.`Table2` T2
WHERE T1.Sucursal = T2.Sucursal
  and T1.Factura = T2.Factura;