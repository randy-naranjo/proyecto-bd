USE CENTRAL
GO

SELECT * FROM [Catalogos].[Carreteras]
SELECT * FROM [Catalogos].[Peajes]
SELECT * FROM [Catalogos].[categVehiculos]



INSERT INTO [Catalogos].[Peajes]( idCarretera, direccion, descripcion ) VALUES
( 2, 'S', 'PEAJE 2 SUR' ),
( 1, 'N', 'PEAJE 2 NORTE' ),
( 3, 'N', 'PEAJE 1 NORTE' ),
( 3, 'N', 'PEAJE 2 NORTE' )


INSERT INTO [Catalogos].[categVehiculos](descripcion) VALUES
('LIVIANO'),
('BUS'),
('MOTO')

INSERT INTO [Catalogos].[Tarifas]