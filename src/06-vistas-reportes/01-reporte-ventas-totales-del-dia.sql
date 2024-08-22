use CENTRAL
go
CREATE VIEW [Reportes].[ventasTotalesXDia]
AS
    SELECT fecha, SUM(montoTotal) as ventasTotales
    FROM [Reportes].[VentasCentralizado]
    GROUP BY fecha;
GO

CREATE VIEW [Reportes].[ventasTotalesXCarretera]
AS
    SELECT Ventas.fecha, C.nombre, SUM(Ventas.montoTotal) as ventasTotales
    FROM [Reportes].[VentasCentralizado] as Ventas
    INNER JOIN [Catalogos].Carreteras as C ON C.id = Ventas.idRuta
    GROUP BY Ventas.fecha, C.nombre;
GO

CREATE VIEW [Reportes].[ventasTotalesXPeaje]
AS
    SELECT Ventas.fecha, P.descripcion, SUM(Ventas.montoTotal) as ventasTotales
    FROM [Reportes].[VentasCentralizado] as Ventas
    INNER JOIN [Catalogos].Peajes as P ON P.id = Ventas.idPeaje
    GROUP BY Ventas.fecha, P.descripcion;
GO

SELECT * FROM [Reportes].[VentasCentralizado];
SELECT * FROM [Reportes].[ventasTotalesXDia];
SELECT * FROM [Reportes].[ventasTotalesXCarretera];
SELECT * FROM [Reportes].[ventasTotalesXPeaje];