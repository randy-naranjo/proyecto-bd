USE CENTRAL
GO

INSERT INTO [Catalogos].[Carreteras](id, nombre, descripcion) VALUES 
(1, 'Escazu', 'RUTA 27 KM 80' ),      -- id = 1
(2, 'ATHENAS', 'RUTA 27 KM 60' ),     -- id = 2
(3, 'RIO CLARO', 'RUTA 27 KM 40' ),   -- id = 3
(4, 'OROTINA', 'RUTA 27 KM 20' )      -- id = 4
GO

INSERT INTO [Catalogos].[Peajes](id, idCarretera , direccion, descripcion) VALUES
(1, 1, 'N', 'PEAJE 1 ESCAZU' ), --ID = 1
(2, 1, 'N', 'PEAJE 2 ESCAZU' ), --ID = 2
(3, 1, 'N', 'PEAJE 3 ESCAZU' ), --ID = 3
(4, 1, 'S', 'PEAJE 4 ESCAZU' ), --ID = 4
(5, 1, 'S', 'PEAJE 5 ESCAZU' ), --ID = 5
(6, 1, 'S', 'PEAJE 6 ESCAZU' ), --ID = 6

(7, 2, 'N', 'PEAJE 1 ATHENAS' ), --ID = 7
(8, 2, 'S', 'PEAJE 2 ATHENAS' ), --ID = 8
(9, 2, 'E', 'PEAJE 3 ATHENAS' ), --ID = 9
(10, 2, 'O', 'PEAJE 4 ATHENAS' ), --ID = 10

(11, 3, 'N', 'PEAJE 1 RIO CLARO' ), --ID = 11
(12, 3, 'N', 'PEAJE 2 RIO CLARO' ), --ID = 12
(13, 3, 'S', 'PEAJE 3 RIO CLARO' ), --ID = 13
(14, 3, 'S', 'PEAJE 4 RIO CLARO' ), --ID = 14

(15, 4, 'N', 'PEAJE 1 OROTINA' ), --ID = 15
(16, 4, 'N', 'PEAJE 2 OROTINA' ), --ID = 16
(17, 4, 'E', 'PEAJE 3 OROTINA' ), --ID = 17
(18, 4, 'O', 'PEAJE 4 OROTINA' ), --ID = 18
(19, 4, 'S', 'PEAJE 5 OROTINA' ), --ID = 19
(20, 4, 'S', 'PEAJE 6 OROTINA' ); --ID = 20
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



-- DELETE FROM [CENTRAL].[Catalogos].Carreteras
-- DELETE FROM [OPERACIONES].[Catalogos_Replicas].Carreteras_Replica

-- DELETE FROM [CENTRAL].[Catalogos].Peajes
-- DELETE FROM [OPERACIONES].[Catalogos_Replicas].Peajes_Replica

-- DELETE FROM [CENTRAL].[Catalogos].categVehiculos
-- DELETE FROM [OPERACIONES].[Catalogos_Replicas].CategVehiculos_Replica

-- DELETE FROM [CENTRAL].[Catalogos].[Tarifas]
-- DELETE FROM [OPERACIONES].[Catalogos_Replicas].[Tarifas_Replica]