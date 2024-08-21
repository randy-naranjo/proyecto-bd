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
        UPDATE Ventas
        SET Ventas.montoTotal = tickets.montoTotal
        FROM [CENTRAL].[Reportes].[VentasCentralizado] AS Ventas
        INNER JOIN (SELECT * FROM [Pagos].resumenTiquetesXPeaje AS resumenttickets WHERE resumenttickets.fecha = @fecha) AS tickets 
        ON Ventas.idPeaje = tickets.idPeaje AND Ventas.idRuta = tickets.idRuta AND Ventas.fecha = tickets.fecha
        WHERE Ventas.montoTotal <  tickets.montoTotal;

        --INSERTA LOS REPORTES DE PEAJES AUN SIN GENERAR
        INSERT INTO [CENTRAL].[Reportes].[VentasCentralizado] ( idRuta, fecha, idPeaje, montoTotal )
            SELECT idCarretera as idRuta, fecha, idPeaje, SUM(monto) as montoTotal
            FROM [Pagos].tiquetes AS tickets
            WHERE tickets.fecha = @Fecha AND 
                NOT EXISTS(
                    SELECT 1 FROM [CENTRAL].[Reportes].VentasCentralizado AS Ventas 
                    WHERE Ventas.idPeaje = tickets.idPeaje AND Ventas.idRuta = tickets.idCarretera AND Ventas.fecha = @Fecha
                )
            GROUP BY tickets.idCarretera, tickets.idPeaje, tickets.fecha;
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

-- exec sp_generarReporteVentasCentralizado '2024-08-20';
