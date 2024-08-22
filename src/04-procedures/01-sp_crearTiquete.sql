USE OPERACIONES
GO

CREATE PROCEDURE [Pagos].[sp_crearTiquete]
    @placa VARCHAR(6),
    @idPeaje SMALLINT,
    @tipoVehiculo TINYINT,
    @fecha date = NULL
AS
BEGIN
    DECLARE @idCarretera INT;

    SELECT @idCarretera = idCarretera FROM [Catalogos_Replicas].[Peajes_Replica] WHERE id = @idPeaje

    DECLARE @MONTO INT;

    SELECT @MONTO = monto
    FROM [Catalogos_Replicas].[Tarifas_Replica]
    WHERE idRuta = @idCarretera AND tipoVehiculo = @tipoVehiculo;

    IF (@MONTO IS NULL)
    BEGIN
        RAISERROR('Error: Tarifa no ha sido creada', 16, 1);
    END
    ELSE
    BEGIN
        IF @fecha IS NULL 
        BEGIN
            SET @fecha = CAST(GETDATE() AS DATE);
        END
        
        DECLARE @Hora TIME;

        
        SET @Hora = CAST(GETDATE() AS TIME);


        INSERT INTO [Pagos].[tiquetes]
            (fecha, hora, placa, idCarretera, idPeaje, tipoVehiculo, monto)
        VALUES
            (@fecha, @Hora, @placa, @idCarretera, @idPeaje, @tipoVehiculo, @MONTO)
    END



END;