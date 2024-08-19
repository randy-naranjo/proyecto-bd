use OPERACIONES
GO

CREATE PROCEDURE sp_generarReporteVentasCentralizado
    @Fecha date
AS
BEGIN

    SELECT SUM(monto) as montoTotal FROM [Pagos].tiquetes WHERE fecha = @Fecha


END

exec sp_generarReporteVentasCentralizado '2024-08-25'


SELECT idPeaje, SUM(monto) as montoTotal FROM [Pagos].tiquetes GROUP BY idPeaje