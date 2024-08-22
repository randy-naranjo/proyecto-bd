USE CENTRAL
GO

CREATE TRIGGER trg_ReplicateCarreteras
ON [Catalogos].[Carreteras]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    --INSERCION
    IF EXISTS (SELECT * FROM inserted) AND NOT(EXISTS(SELECT * FROM deleted))
    BEGIN
        INSERT INTO [OPERACIONES].[Catalogos_Replicas].[Carreteras_Replica]
        SELECT *
        FROM inserted;
    END

    --ACTUALIZACION
    IF EXISTS ( SELECT * FROM inserted ) AND EXISTS(SELECT * FROM deleted) 
    BEGIN
        UPDATE [OPERACIONES].[Catalogos_Replicas].[Carreteras_Replica]
        SET
            id = i.id,
            nombre = i.nombre,
            descripcion = i.descripcion
        FROM inserted i
        INNER JOIN [OPERACIONES].[Catalogos_Replicas].[Carreteras_Replica] AS CR
        ON i.id = CR.id;
    END
    
    --ELIMINACION
    IF EXISTS (SELECT * FROM deleted) AND NOT(EXISTS(SELECT * FROM inserted))
    BEGIN
        DELETE FROM [OPERACIONES].[Catalogos_Replicas].[Carreteras_Replica]
        WHERE id IN (SELECT id FROM deleted);
    END
END;

GO

CREATE TRIGGER trg_ReplicatePeajes
ON [Catalogos].[Peajes]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    --INSERCION
    IF EXISTS (SELECT * FROM inserted) AND NOT(EXISTS(SELECT * FROM deleted))
    BEGIN
        INSERT INTO [OPERACIONES].[Catalogos_Replicas].[Peajes_Replica]
        SELECT *
        FROM inserted;
    END

    --ACTUALIZACION
    IF EXISTS ( SELECT * FROM inserted ) AND EXISTS(SELECT * FROM deleted) 
    BEGIN
        UPDATE [OPERACIONES].[Catalogos_Replicas].[Peajes_Replica]
        SET
            id = i.id,
            idCarretera = i.idCarretera,
            direccion = i.direccion,
            descripcion = i.descripcion
        FROM inserted i
        INNER JOIN [OPERACIONES].[Catalogos_Replicas].[Peajes_Replica] AS PR
        ON i.id = PR.id;
    END

    --ELIMINACION
    IF EXISTS (SELECT * FROM deleted) AND NOT(EXISTS(SELECT * FROM inserted))
    BEGIN
        DELETE FROM [OPERACIONES].[Catalogos_Replicas].[Peajes_Replica]
        WHERE id IN (SELECT id FROM deleted);
    END
END;

GO

CREATE TRIGGER trg_ReplicateCategVehiculos
ON [Catalogos].[CategVehiculos]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    --INSERCION
    IF EXISTS (SELECT * FROM inserted) AND NOT(EXISTS(SELECT * FROM deleted))
    BEGIN
        INSERT INTO [OPERACIONES].[Catalogos_Replicas].[CategVehiculos_Replica]
        SELECT *
        FROM inserted;
    END

    --ACTUALIZACION
    IF EXISTS ( SELECT * FROM inserted ) AND EXISTS(SELECT * FROM deleted) 
    BEGIN
        UPDATE [OPERACIONES].[Catalogos_Replicas].[CategVehiculos_Replica]
        SET
            id = i.id,
            descripcion = i.descripcion
        FROM inserted i
        INNER JOIN [OPERACIONES].[Catalogos_Replicas].[CategVehiculos_Replica] AS CVR
        ON i.id = CVR.id;
    END

    --ELIMINACION
    IF EXISTS (SELECT * FROM deleted) AND NOT(EXISTS(SELECT * FROM inserted))
    BEGIN
        DELETE FROM [OPERACIONES].[Catalogos_Replicas].[CategVehiculos_Replica]
        WHERE id IN (SELECT id FROM deleted);
    END
END;

GO

CREATE TRIGGER trg_ReplicateTarifas
ON [Catalogos].[tarifas]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    --INSERCION
    IF EXISTS (SELECT * FROM inserted) AND NOT(EXISTS(SELECT * FROM deleted))
    BEGIN
        INSERT INTO [OPERACIONES].[Catalogos_Replicas].[Tarifas_Replica]
        SELECT *
        FROM inserted;
    END

    --ACTUALIZACION
    IF EXISTS ( SELECT * FROM inserted ) AND EXISTS(SELECT * FROM deleted) 
    BEGIN
        UPDATE [OPERACIONES].[Catalogos_Replicas].[Tarifas_Replica]
        SET
            idRuta = i.idRuta,
            tipoVehiculo = i.tipoVehiculo,
            monto = i.monto
        FROM inserted i
        INNER JOIN [OPERACIONES].[Catalogos_Replicas].[Tarifas_Replica] AS TR
        ON i.idRuta = TR.idRuta AND i.tipoVehiculo = TR.tipoVehiculo;
    END

    --ELIMINACION
    IF EXISTS (SELECT * FROM deleted) AND NOT(EXISTS(SELECT * FROM inserted))
    BEGIN
        DELETE FROM [OPERACIONES].[Catalogos_Replicas].[Tarifas_Replica]
        WHERE idRuta IN (SELECT idRuta FROM deleted) AND tipoVehiculo IN (SELECT tipoVehiculo FROM deleted);
    END
END;

GO