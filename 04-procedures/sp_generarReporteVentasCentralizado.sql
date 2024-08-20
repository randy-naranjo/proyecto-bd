use OPERACIONES
GO

CREATE PROCEDURE sp_generarReporteVentasCentralizado
    @Fecha date
AS
BEGIN

    IF EXISTS( SELECT 1
    FROM [CENTRAL].Reportes.VentasCentralizado
    WHERE fecha = @Fecha)
    BEGIN


        --ACTUALIZAR REPORTES DE PEAJES YA GENERADOS
        UPDATE VC
        SET VC.montoTotal = tks.montoTotal
        FROM [CENTRAL].[Reportes].[VentasCentralizado] AS VC
        INNER JOIN (SELECT * FROM [Pagos].resumenTiquetesXPeaje AS rtk WHERE rtk.fecha = '2024-08-20') AS tks 
        ON VC.idPeaje = tks.idPeaje AND VC.idRuta = tks.idRuta;

        --Inserta los reportes de peajes no generados
        INSERT INTO [CENTRAL].[Reportes].[VentasCentralizado] ( idRuta, fecha, idPeaje, montoTotal )
            SELECT idCarretera as idRuta, fecha, idPeaje, SUM(monto) as montoTotal
            FROM [Pagos].tiquetes AS tk
            WHERE tk.fecha = @Fecha AND 
                NOT EXISTS(
                    SELECT 1 FROM [CENTRAL].[Reportes].VentasCentralizado AS VC 
                    WHERE VC.idPeaje = tk.idPeaje AND VC.idRuta = TK.idCarretera AND VC.fecha = @Fecha
                )
            GROUP BY tk.idCarretera, tk.idPeaje, tk.fecha;
    END
    ELSE
    BEGIN

        -- SI NO HAY REPORTES DE LA FECHA INDICADA LOS GENERA
        INSERT INTO [CENTRAL].[Reportes].[VentasCentralizado]
            ( idRuta, fecha, idPeaje, montoTotal )
        SELECT * FROM [Pagos].resumenTiquetesXPeaje
        WHERE fecha = @Fecha;
    END
END

exec sp_generarReporteVentasCentralizado '2024-08-20';

SELECT *
FROM [CENTRAL].[Reportes].VentasCentralizado 

SELECT *
FROM [OPERACIONES].[Pagos].resumenTiquetesXPeaje
