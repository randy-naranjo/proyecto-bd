-- RUN SCRIPT INTO DB CENTRAL
USE CENTRAL

-- RUN SCRIPT INTO DB OPERACIONES
USE OPERACIONES

IF EXISTS(SELECT distinct name FROM sys.objects WHERE name = 'fnTableFields')
	DROP FUNCTION dbo.fnTableFields
GO
-- CREA funci�n de campos de una tabla
CREATE FUNCTION [dbo].[fnTableFields] (@Table VARCHAR(MAX), @Alias VARCHAR(10) = NULL)
	RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @idTable INT, @strFields VARCHAR(MAX);

	SET @idTable = (SELECT sObj.id FROM sys.sysobjects AS sObj WHERE name = @Table);

	SET @strFields = (SELECT STUFF( 
							(SELECT CAST(' +' + CHAR(39)+ ',' + CHAR(39) + '+ ' AS varchar(MAX)),  
								(CASE  
									WHEN tp.name IN ('bigint','smallint', 'int', 'smalldatetime', 'tinyint', 'numeric', 'datetime', 'date', 'time', 'bit', 'char') THEN 'RTRIM(CONVERT(VARCHAR(100),' + ISNULL(@Alias + '.', '') + C.name +'))'
									ELSE ISNULL(@Alias + '.', '') + C.name
								END)
							 FROM sys.columns AS C
							 INNER JOIN sys.types AS Tp ON Tp.system_type_id = C.system_type_id AND Tp.user_type_id = C.user_type_id
						     WHERE object_id = @idTable
						     ORDER BY column_id
						     FOR XML PATH('')
						     ), 1, 7, ''
						) AS Campos)
	RETURN(@strFields);
END

IF EXISTS(SELECT distinct name FROM sys.objects WHERE name = 'sp_CreateTriggers')
	DROP PROCEDURE dbo.sp_CreateTriggers
GO

-- CREA EL PROCEDIMIENTO ALMACENADO PARA CREAR TRIGGERS
CREATE PROCEDURE [dbo].[sp_CreateTriggers]
	@schema VARCHAR(100),
	@table VARCHAR(100),
	@createAction BIT
AS
BEGIN
	DECLARE @strTRG VARCHAR(8000)
	SET @strTRG = 
		'CREATE TRIGGER [' + UPPER(RTRIM(@schema)) + '].[TRG_' + UPPER(RTRIM(@table)) + ']
		   ON  [' + UPPER(RTRIM(@schema)) + '].[' + UPPER(RTRIM(@table)) + ']
		   AFTER INSERT, UPDATE, DELETE
		AS
		BEGIN
			DECLARE @type CHAR(1)

			IF exists(SELECT * FROM inserted)
				IF exists(SELECT * FROM deleted) --Si es un update
					SELECT @Type='+ CHAR(39) + 'U' + CHAR(39) + '
				 ELSE --Si es un insert
					SELECT @Type = '+ CHAR(39) + 'I' + CHAR(39) +'
				 ELSE --Si es un delete
					SELECT @Type = '+ CHAR(39) + 'D' + CHAR(39) +'

			INSERT INTO [TLOG].[dbo].[TransationLog]
			SELECT	@type, @@SERVERNAME, DB_NAME(), ' + CHAR(39) + RTRIM(@table) + CHAR(39) + ' , 
					ISNULL(' + dbo.fnTableFields(@table, 'D') + ',' + CHAR(39) + '-' + CHAR(39) + '), 
					ISNULL(' + dbo.fnTableFields(@table, 'I') + ',' + CHAR(39) + '-' + CHAR(39) + '), 
					SUSER_SNAME(), APP_NAME(), HOST_NAME(), GETDATE() 
			FROM inserted AS I
			FULL OUTER JOIN deleted AS D ON ' + STUFF((SELECT ' AND ' + 'D.' + RTRIM(COLUMN_NAME) + ' = I.' + RTRIM(COLUMN_NAME)
																	FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
																	WHERE	TABLE_NAME = @table AND CONSTRAINT_NAME LIKE 'PK%'
																	FOR XML PATH('')),1,5,'') + '
			  
		END'

	SELECT @strTRG

	IF @createAction = 1
	BEGIN
		IF EXISTS(SELECT * FROM SYS.SYSOBJECTS WHERE name = 'TRG_' + UPPER(RTRIM(@table)))
		BEGIN
			DECLARE @Qry VARCHAR(50)
			SET @Qry = 'DROP TRIGGER [' + UPPER(RTRIM(@schema)) + '].[TRG_' + UPPER(RTRIM(@table)) + ']'
				EXEC sp_sqlexec @Qry
		END
		EXEC sp_sqlexec @strTRG
	END
END

-- EXECS IN DB CENTRAL

USE CENTRAL
GO
EXEC [dbo].sp_CreateTriggers 'catalogos', 'carreteras', 1
EXEC [dbo].sp_CreateTriggers 'catalogos', 'categVehiculos', 1
EXEC [dbo].sp_CreateTriggers 'catalogos', 'peajes', 1
EXEC [dbo].sp_CreateTriggers 'catalogos', 'tarifas', 1
EXEC [dbo].sp_CreateTriggers 'reportes', 'ventasCentralizado', 1

-- EXECS IN DB OPERACIONES

USE OPERACIONES
GO
EXEC [dbo].sp_CreateTriggers 'pagos', 'tiquetes', 1
EXEC [dbo].sp_CreateTriggers 'Catalogos_Replicas', 'Carreteras_Replica', 1
EXEC [dbo].sp_CreateTriggers 'Catalogos_Replicas', 'Peajes_Replica', 1
EXEC [dbo].sp_CreateTriggers 'Catalogos_Replicas', 'CategVehiculos_Replica', 1
EXEC [dbo].sp_CreateTriggers 'Catalogos_Replicas', 'Tarifas_Replica', 1



select * from sys.types