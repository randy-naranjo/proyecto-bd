USE OPERACIONES
GO

EXEC [Pagos].[sp_crearTiquete] @placa = 'ABC123', @idPeaje = 1, @tipoVehiculo = 1;
EXEC [Pagos].[sp_crearTiquete] @placa = 'DEF456', @idPeaje = 2, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'GHI789', @idPeaje = 3, @tipoVehiculo = 3;
EXEC [Pagos].[sp_crearTiquete] @placa = 'JKL012', @idPeaje = 4, @tipoVehiculo = 4;
EXEC [Pagos].[sp_crearTiquete] @placa = 'MNO345', @idPeaje = 5, @tipoVehiculo = 5;
EXEC [Pagos].[sp_crearTiquete] @placa = 'PQR678', @idPeaje = 7, @tipoVehiculo = 1;
EXEC [Pagos].[sp_crearTiquete] @placa = 'STU901', @idPeaje = 8, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'VWX234', @idPeaje = 9, @tipoVehiculo = 3;
EXEC [Pagos].[sp_crearTiquete] @placa = 'YZA567', @idPeaje = 10, @tipoVehiculo = 4;
EXEC [Pagos].[sp_crearTiquete] @placa = 'BCD890', @idPeaje = 7, @tipoVehiculo = 5;
EXEC [Pagos].[sp_crearTiquete] @placa = 'EFG123', @idPeaje = 11, @tipoVehiculo = 1;
EXEC [Pagos].[sp_crearTiquete] @placa = 'HIJ456', @idPeaje = 12, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'KLM789', @idPeaje = 13, @tipoVehiculo = 3;
EXEC [Pagos].[sp_crearTiquete] @placa = 'NOP012', @idPeaje = 14, @tipoVehiculo = 4;
EXEC [Pagos].[sp_crearTiquete] @placa = 'QRS345', @idPeaje = 11, @tipoVehiculo = 5;
EXEC [Pagos].[sp_crearTiquete] @placa = 'TUV678', @idPeaje = 15, @tipoVehiculo = 1;
EXEC [Pagos].[sp_crearTiquete] @placa = 'WXY901', @idPeaje = 16, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'ZAB234', @idPeaje = 17, @tipoVehiculo = 3;
EXEC [Pagos].[sp_crearTiquete] @placa = 'CDE567', @idPeaje = 18, @tipoVehiculo = 4;
EXEC [Pagos].[sp_crearTiquete] @placa = 'FGH890', @idPeaje = 19, @tipoVehiculo = 5;
EXEC [Pagos].[sp_crearTiquete] @placa = 'LMN123', @idPeaje = 1, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'OPQ456', @idPeaje = 2, @tipoVehiculo = 4;
EXEC [Pagos].[sp_crearTiquete] @placa = 'RST789', @idPeaje = 5, @tipoVehiculo = 6;
EXEC [Pagos].[sp_crearTiquete] @placa = 'UVW012', @idPeaje = 7, @tipoVehiculo = 3;
EXEC [Pagos].[sp_crearTiquete] @placa = 'XYZ345', @idPeaje = 8, @tipoVehiculo = 1;
EXEC [Pagos].[sp_crearTiquete] @placa = 'ABX678', @idPeaje = 9, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'CDE901', @idPeaje = 10, @tipoVehiculo = 5;
EXEC [Pagos].[sp_crearTiquete] @placa = 'FGH234', @idPeaje = 11, @tipoVehiculo = 4;
EXEC [Pagos].[sp_crearTiquete] @placa = 'IJK567', @idPeaje = 12, @tipoVehiculo = 6;
EXEC [Pagos].[sp_crearTiquete] @placa = 'LMO890', @idPeaje = 13, @tipoVehiculo = 1;
EXEC [Pagos].[sp_crearTiquete] @placa = 'NPQ123', @idPeaje = 15, @tipoVehiculo = 3;
EXEC [Pagos].[sp_crearTiquete] @placa = 'RST456', @idPeaje = 16, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'UVW789', @idPeaje = 18, @tipoVehiculo = 5;
EXEC [Pagos].[sp_crearTiquete] @placa = 'XYZ012', @idPeaje = 19, @tipoVehiculo = 6;
EXEC [Pagos].[sp_crearTiquete] @placa = 'ABC345', @idPeaje = 6, @tipoVehiculo = 1;
EXEC [Pagos].[sp_crearTiquete] @placa = 'DEF678', @idPeaje = 7, @tipoVehiculo = 4;
EXEC [Pagos].[sp_crearTiquete] @placa = 'GHI901', @idPeaje = 13, @tipoVehiculo = 2;
EXEC [Pagos].[sp_crearTiquete] @placa = 'JKL234', @idPeaje = 15, @tipoVehiculo = 3;
EXEC [Pagos].[sp_crearTiquete] @placa = 'MNO567', @idPeaje = 4, @tipoVehiculo = 5;


EXEC [Pagos].[sp_crearTiquete] @placa = 'FGH234', @idPeaje = 11, @tipoVehiculo = 4, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'IJK567', @idPeaje = 12, @tipoVehiculo = 6, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'LMO890', @idPeaje = 13, @tipoVehiculo = 1, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'NPQ123', @idPeaje = 15, @tipoVehiculo = 3, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'RST456', @idPeaje = 16, @tipoVehiculo = 2, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'UVW789', @idPeaje = 18, @tipoVehiculo = 5, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'XYZ012', @idPeaje = 19, @tipoVehiculo = 6, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'ABC345', @idPeaje = 6, @tipoVehiculo = 1, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'DEF678', @idPeaje = 7, @tipoVehiculo = 4, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'GHI901', @idPeaje = 13, @tipoVehiculo = 2, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'JKL234', @idPeaje = 15, @tipoVehiculo = 3, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'MNO567', @idPeaje = 4, @tipoVehiculo = 5, @fecha = '2024-08-21';

EXEC [Pagos].[sp_crearTiquete] @placa = 'ABC123', @idPeaje = 1, @tipoVehiculo = 1, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'DEF456', @idPeaje = 2, @tipoVehiculo = 2, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'GHI789', @idPeaje = 3, @tipoVehiculo = 3, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'JKL012', @idPeaje = 4, @tipoVehiculo = 4, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'MNO345', @idPeaje = 5, @tipoVehiculo = 5, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'PQR678', @idPeaje = 7, @tipoVehiculo = 1, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'STU901', @idPeaje = 8, @tipoVehiculo = 2, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'VWX234', @idPeaje = 9, @tipoVehiculo = 3, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'YZA567', @idPeaje = 10, @tipoVehiculo = 4, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'BCD890', @idPeaje = 7, @tipoVehiculo = 5, @fecha = '2024-08-21';
EXEC [Pagos].[sp_crearTiquete] @placa = 'EFG123', @idPeaje = 11, @tipoVehiculo = 1, @fecha = '2024-08-21';