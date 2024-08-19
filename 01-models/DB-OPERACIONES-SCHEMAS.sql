CREATE DATABASE OPERACIONES
GO
USE OPERACIONES
GO
CREATE SCHEMA Pagos
GO
CREATE SCHEMA Catalogos_Replicas
GO

CREATE TABLE [Catalogos_Replicas].[Carreteras_Replica] (
    id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
)

CREATE TABLE [Catalogos_Replicas].[Peajes_Replica] (
    id SMALLINT NOT NULL PRIMARY KEY,
    idCarretera INT NOT NULL,
    CONSTRAINT FK_Peajes_Carreteras_Replica FOREIGN KEY (idCarretera) REFERENCES [Catalogos_Replicas].[Carreteras_Replica](id),
    direccion CHAR(1) NOT NULL,
    CONSTRAINT CHK_DIRECCION_Peajes_replica CHECK(direccion IN ('N','S','E','O')),
    descripcion varchar(100) NOT NULL
)

CREATE TABLE [Catalogos_Replicas].[CategVehiculos_Replica] (
    id TINYINT NOT NULL PRIMARY KEY,
    descripcion varchar(100) NOT NULL
)

CREATE TABLE [Catalogos_Replicas].[Tarifas_Replica] (
    idPeaje SMALLINT NOT NULL,
    tipoVehiculo TINYINT NOT NULL,
    monto INT NOT NULL,
    CONSTRAINT FK_Tarifas_CategVehiculos_replica_id FOREIGN KEY(tipoVehiculo) REFERENCES [Catalogos_Replicas].[CategVehiculos_Replica](id),
    CONSTRAINT FK_Tarifas_Peajes_replica_id FOREIGN KEY(idPeaje) REFERENCES [Catalogos_Replicas].[Peajes_Replica](id),
    PRIMARY KEY( idPeaje, tipoVehiculo )
)

CREATE TABLE [Pagos].[tiquetes] (
    id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME,
    placa varchar(6) NOT NULL,
    idCarretera INT NOT NULL,
    idPeaje SMALLINT NOT NULL,
    tipoVehiculo TINYINT NOT NULL,
    monto INT NOT NULL,
    CONSTRAINT FK_Tiquetes_Carreteras_Replica FOREIGN KEY (idCarretera) REFERENCES [Catalogos_Replicas].[Carreteras_Replica](id),
    CONSTRAINT FK_Tiquetes_Peajes_replica_id FOREIGN KEY(idPeaje) REFERENCES [Catalogos_Replicas].[Peajes_Replica](id),
    CONSTRAINT FK_Tiquetes_CategVehiculos_replica_id FOREIGN KEY(tipoVehiculo) REFERENCES [Catalogos_Replicas].[CategVehiculos_Replica](id),
)