USE OPERACIONES
GO

CREATE PROCEDURE sp_crearTiquete
    @placa VARCHAR(6),
    @idCarretera INT,
    @idPeaje SMALLINT,
    @tipoVehiculo TINYINT
AS
BEGIN

    DECLARE @MONTO INT;

    SELECT @MONTO = monto
    FROM [Catalogos_Replicas].[Tarifas_Replica]
    WHERE idPeaje = @idPeaje AND tipoVehiculo = @tipoVehiculo;

    IF (@MONTO IS NULL)
    BEGIN
        RAISERROR('Error: Tarifa no ha sido creada', 16, 1);
    END
    ELSE
    BEGIN
        DECLARE @Fecha DATE;
        DECLARE @Hora TIME;

        SET @Fecha = CAST(GETDATE() AS DATE);
        SET @Hora = CAST(GETDATE() AS TIME);


        INSERT INTO [Pagos].[tiquetes]
            (fecha, hora, placa, idCarretera, idPeaje, tipoVehiculo, monto)
        VALUES
            (@Fecha, @Hora, @placa, @idCarretera, @idPeaje, @tipoVehiculo, @MONTO)
    END



END;

-- EXEC sp_crearTiquete '123456', 1, 2, 2

-- SELECT * FROM [Pagos].[tiquetes]

-- SELECT * FROM [TLOG].[dbo].[TransationLog]