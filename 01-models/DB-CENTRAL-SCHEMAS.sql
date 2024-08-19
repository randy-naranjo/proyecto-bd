USE master;

CREATE DATABASE CENTRAL
GO
USE CENTRAL
GO
CREATE SCHEMA Catalogos
GO
CREATE SCHEMA Reportes
GO

CREATE TABLE [Catalogos].[Carreteras] (
    id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
)

CREATE TABLE [Catalogos].[Peajes] (
    id SMALLINT NOT NULL PRIMARY KEY,
    idCarretera INT NOT NULL,
    CONSTRAINT FK_Peajes_Carreteras FOREIGN KEY (idCarretera) REFERENCES [Catalogos].[Carreteras](id),
    direccion CHAR(1) NOT NULL,
    CONSTRAINT CHK_DIRECCION CHECK(direccion IN ('N','S','E','O')),
    descripcion varchar(100) NOT NULL
)

CREATE TABLE [Catalogos].[categVehiculos] (
    id TINYINT NOT NULL PRIMARY KEY,
    descripcion varchar(100) NOT NULL
)

CREATE TABLE [Catalogos].[Tarifas] (
    id TINYINT NOT NULL PRIMARY KEY,
    monto INT NOT NULL,
    tipoVehiculo TINYINT NOT NULL,
    CONSTRAINT FK_Tarifas_CategVehiculos_id FOREIGN KEY(tipoVehiculo) REFERENCES [Catalogos].[categVehiculos](id)
)

CREATE TABLE [Reportes].[Ventas](
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    montoTotal INT NOT NULL,
    totalTiquetes INT NOT NULL,
    fecha DATE NOT NULL,
    idPeaje SMALLINT NOT NULL,
    CONSTRAINT FK_ventasPeajes_Peajes_Id FOREIGN KEY(idPeaje) REFERENCES [Catalogos].[Peajes](id)
)