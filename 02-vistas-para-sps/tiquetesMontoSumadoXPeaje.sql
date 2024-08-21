use OPERACIONES
go
CREATE VIEW [Pagos].resumenTiquetesXPeaje
AS
    SELECT idCarretera as idRuta, fecha, idPeaje, SUM(monto) as montoTotal
    FROM [Pagos].tiquetes
    GROUP BY idCarretera, idPeaje, fecha;