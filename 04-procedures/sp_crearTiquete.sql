USE OPERACIONES
GO

CREATE PROCEDURE sp_crearTiquete
    @placa VARCHAR(6),
    @idCarretera INT,
    @idPeaje SMALLINT,
    @tipoTarifa TINYINT
AS
BEGIN

    DECLARE @Fecha DATE;
    DECLARE @Hora TIME;

    SET @Fecha = CAST(GETDATE() AS DATE);
    SET @Hora = CAST(GETDATE() AS TIME);


    INSERT INTO [Pagos].[tiquetes](fecha, hora, placa, idCarretera, idPeaje, tipoTarifa) VALUES 
    (@Fecha, @Hora, @placa, @idCarretera, @idPeaje, @tipoTarifa)
END;