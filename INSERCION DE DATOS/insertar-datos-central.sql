USE CENTRAL
GO

INSERT INTO [Catalogos].[Carreteras](nombre, descripcion) VALUES 
( 'Escazu', 'RUTA 27 KM 80' ),      -- id = 1
( 'ATHENAS', 'RUTA 27 KM 60' ),     -- id = 2
( 'RIO CLARO', 'RUTA 27 KM 40' ),   -- id = 3
( 'OROTINA', 'RUTA 27 KM 20' )      -- id = 4
GO

SELECT * FROM [Catalogos].[Carreteras];
GO

INSERT INTO [Catalogos].[Peajes](idCarretera, direccion, descripcion) VALUES
( 1, 'N', 'PEAJE 1 ESCAZU' ), --ID = 1
( 1, 'N', 'PEAJE 2 ESCAZU' ), --ID = 2
( 1, 'N', 'PEAJE 3 ESCAZU' ), --ID = 3
( 1, 'S', 'PEAJE 4 ESCAZU' ), --ID = 4
( 1, 'S', 'PEAJE 5 ESCAZU' ), --ID = 5
( 1, 'S', 'PEAJE 6 ESCAZU' ), --ID = 6

( 2, 'N', 'PEAJE 1 ATHENAS' ), --ID = 7
( 2, 'S', 'PEAJE 2 ATHENAS' ), --ID = 8
( 2, 'E', 'PEAJE 3 ATHENAS' ), --ID = 9
( 2, 'O', 'PEAJE 4 ATHENAS' ), --ID = 10

( 3, 'N', 'PEAJE 1 RIO CLARO' ), --ID = 11
( 3, 'N', 'PEAJE 2 RIO CLARO' ), --ID = 12
( 3, 'S', 'PEAJE 3 RIO CLARO' ), --ID = 13
( 3, 'S', 'PEAJE 4 RIO CLARO' ), --ID = 14

( 4, 'N', 'PEAJE 1 OROTINA' ), --ID = 15
( 4, 'N', 'PEAJE 2 OROTINA' ), --ID = 16
( 4, 'E', 'PEAJE 3 OROTINA' ), --ID = 17
( 4, 'O', 'PEAJE 4 OROTINA' ), --ID = 18
( 4, 'S', 'PEAJE 5 OROTINA' ), --ID = 19
( 4, 'S', 'PEAJE 6 OROTINA' ); --ID = 20
GO

INSERT INTO [Catalogos].[categVehiculos](id, descripcion) VALUES
( 1, 'MOTO' ),          --id = 1     
( 2, 'LIVIANO' ),       --id = 2
( 3, 'BUS' ),           --id = 3
( 4, 'PESADO 2 EJES' ), --id = 4
( 5, 'PESADO 3 EJES' ), --id = 5
( 6, 'PESADO 4 EJES' )  --id = 6
GO

INSERT INTO [Catalogos].[Tarifas]( idRuta, tipoVehiculo, monto) VALUES
-- TARIFAS ESCAZU
(1, 1, 1000), --MOTO
(1, 2, 2000), --LIVIANO
(1, 3, 3000), --BUS
(1, 4, 4000), --PESADO 2 EJES
(1, 5, 5000), --PESADO 3 EJES
(1, 6, 6000), --PESADO 4 EJES
-- TARIFAS ATHENAS
(2, 1, 800),  --MOTO
(2, 2, 1600), --LIVIANO
(2, 3, 2400), --BUS
(2, 4, 3200), --PESADO 2 EJES
(2, 5, 4000), --PESADO 3 EJES
(2, 6, 4800), --PESADO 4 EJES
-- TARIFAS RIO CLARO
(3, 1, 600),  --MOTO
(3, 2, 1200), --LIVIANO
(3, 3, 1800), --BUS
(3, 4, 2400), --PESADO 2 EJES
(3, 5, 3000), --PESADO 3 EJES
(3, 6, 3600), --PESADO 4 EJES
-- TARIFAS OROTINA
(4, 1, 400),  --MOTO
(4, 2, 800),  --LIVIANO
(4, 3, 1200), --BUS
(4, 4, 1600), --PESADO 2 EJES
(4, 5, 2000), --PESADO 3 EJES
(4, 6, 2400); --PESADO 4 EJES
GO



SELECT * FROM [CENTRAL].[Catalogos].Carreteras
SELECT * FROM [OPERACIONES].[Catalogos_Replicas].Carreteras_Replica

SELECT * FROM [CENTRAL].[Catalogos].Peajes
SELECT * FROM [OPERACIONES].[Catalogos_Replicas].Peajes_Replica

SELECT * FROM [CENTRAL].[Catalogos].categVehiculos
SELECT * FROM [OPERACIONES].[Catalogos_Replicas].CategVehiculos_Replica

SELECT * FROM [CENTRAL].[Catalogos].[Tarifas]
SELECT * FROM [OPERACIONES].[Catalogos_Replicas].[Tarifas_Replica]