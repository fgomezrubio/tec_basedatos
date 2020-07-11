-- First Git
DROP DATABASE IF EXISTS Normalizacion;
CREATE DATABASE Normalizacion;
DROP TABLE IF EXISTS Normalizacion.Table1;
CREATE TABLE Normalizacion.`Table1` (
  `Sucursal` int(11) NOT NULL,
  `Factura` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `FormaPago` varchar(2) Not Null,
  `CodigoCliente` int(3) NOT NULL,
  `NombreCliente` varchar(10) Not Null,
  `CodigoArticulo` int(2) NOT NULL,
   `NombreArticulo` varchar(10) Not Null,
  `CantidadArticulo` int(2) NOT NULL,
  `PrecioArticulo` float(11,2) NOT NULL,
  `SubTotal` float(11,0) NOT NULL,
  
  `TotalFactura` float(11,0) NOT NULL -- ,
  -- PRIMARY KEY (`Sucursal`,`Factura`)
  ) ;
  
  insert into Normalizacion.`Table1` (`Sucursal`, `Factura`, `Fecha`, `FormaPago`, `CodigoCliente`, `NombreCliente`, `CodigoArticulo`, 
									`NombreArticulo`, `CantidadArticulo`,`PrecioArticulo`,`SubTotal` , `TotalFactura`) values
  (01,500,'2006-01-01','E',01,'ALVAREZ',01,'LAPIZ',3,1.25,3.75,48.20),
  (01,500,'2006-01-01','E',01,'ALVAREZ',02,'GOMA',6,0.75,4.50,48.20),
  (01,500,'2006-01-01','E',01,'ALVAREZ',10,'HOJAS',8,5,40,48.20),
  (01,501,'2006-01-02','CC',107,'CASTRO',08,'COMPAS',4,4,16,16),  
  (02,500,'2006-01-03','E',110,'LIZ',10,'HOJAS',2,5.0,10,14.9),
  (02,500,'2006-01-03','E',110,'LIZ',20,'REGLA',2,2.45,4.9,14.9);
  
  Select * from Normalizacion.`Table1` ;
