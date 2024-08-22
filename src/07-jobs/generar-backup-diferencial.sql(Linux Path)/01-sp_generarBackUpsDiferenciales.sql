USE msdb
GO

CREATE PROCEDURE [dbo].[sp_generarBackUpsDiferenciales]
AS
BEGIN
    DECLARE @CENTRALBKDIFFPATH NVARCHAR(500) = N'/var/opt/mssql/backups/CENTRAL_DIFF' + FORMAT(GETDATE(), 'yyyyMMdd_HHmm') + '.bak';

    BACKUP DATABASE CENTRAL
        TO DISK = @CENTRALBKDIFFPATH
        WITH DIFFERENTIAL, 
             FORMAT,
             MEDIANAME = 'BackUpDB_CENTRAL_Diff',
             NAME = 'Backup Diferencial de DB_CENTRAL';

    DECLARE @OPERACIONESBKDIFFPATH NVARCHAR(500) = N'/var/opt/mssql/backups/OPERACIONES_DIFF' + FORMAT(GETDATE(), 'yyyyMMdd_HHmm') + '.bak';

    BACKUP DATABASE OPERACIONES
        TO DISK = @OPERACIONESBKDIFFPATH
        WITH DIFFERENTIAL, 
             FORMAT,
             MEDIANAME = 'BackUpDB_OPERACIONES_Diff',
             NAME = 'Backup Diferencial de DB_OPERACIONES';

    DECLARE @TLOGBKDIFFPATH NVARCHAR(500) = N'/var/opt/mssql/backups/TLOG_DIFF' + FORMAT(GETDATE(), 'yyyyMMdd_HHmm') + '.bak';

    BACKUP DATABASE TLOG
        TO DISK = @TLOGBKDIFFPATH
        WITH DIFFERENTIAL, 
             FORMAT,
             MEDIANAME = 'BackUpDB_TLOG_Diff',
             NAME = 'Backup Diferencial de DB_CENTRAL';
END