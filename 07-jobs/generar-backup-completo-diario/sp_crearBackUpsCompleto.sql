Use msdb
GO
CREATE PROCEDURE [dbo].[spCrearBackUpCompleto]
AS
BEGIN
    DECLARE @CENTRALBKPATH NVARCHAR(500) = N'/var/opt/mssql/backups/CENTRAL_Full' + FORMAT(GETDATE(), 'yyyyMMdd') + '.bak';

        BACKUP DATABASE CENTRAL
            TO DISK = @CENTRALBKPATH
            WITH FORMAT,
                MEDIANAME = N'BackUpDB_CENTRAL',
                NAME = N'Backup Completo de DB_CENTRAL';

        DECLARE @OPERACIONESBKPATH NVARCHAR(500) = N'/var/opt/mssql/backups/OPERACIONES_Full' + FORMAT(GETDATE(), 'yyyyMMdd') + '.bak'

        BACKUP DATABASE OPERACIONES
            TO DISK = @OPERACIONESBKPATH
            WITH FORMAT,
                MEDIANAME = N'BackUpDB_OPERACIONES',
                NAME = N'Backup Completo de DB_OPERACIONES';

        DECLARE @TLOGBKPATH NVARCHAR(500) = N'/var/opt/mssql/backups/TLOG_Full' + FORMAT(GETDATE(), 'yyyyMMdd') + '.bak'

        BACKUP DATABASE TLOG
            TO DISK = @TLOGBKPATH
            WITH FORMAT,
                MEDIANAME = N'BackUpDB_TLOG',
                NAME = N'Backup Completo de DB_TLOG';
END