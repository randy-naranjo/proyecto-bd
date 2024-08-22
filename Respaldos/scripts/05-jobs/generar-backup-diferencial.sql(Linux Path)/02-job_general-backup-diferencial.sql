-- NOTA: Sql Server Agent Debe estar activado

-- SI Sql Server Agent esta desactivado, entonces abrir CMD o PowerShell con el contener corriendo y ejecutar:
/*

1. $ docker exec -it --user root [IdContenedor] bash

2. root@57301203bac5:/# /opt/mssql/bin/mssql-conf set sqlagent.enabled true

3. root@57301203bac5:/# systemctl restart mssql-server.service

// If you get an error message such as systemctl: command not found then just stop and start the container for the changes to take effect.

https://stackoverflow.com/questions/69038304/how-enable-sql-server-agent-in-docker-container-existing
*/

USE msdb;
GO

EXEC msdb.dbo.sp_add_job 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @enabled = 1, 
    @description = N'Backup diferencial diario ejecutado a las 6am, 9am, 12pm, 3pm, 6pm y 9pm',
    @notify_level_eventlog = 2,
    @category_name = N'Database Maintenance';
GO

EXEC msdb.dbo.sp_add_jobstep 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @step_name = N'Backup Diferencial',
    @subsystem = N'TSQL',
    @command = N'EXEC [msdb].[dbo].[sp_generarBackUpsDiferenciales]',
    @retry_attempts = 0,
    @retry_interval = 0;
GO

EXEC msdb.dbo.sp_add_jobschedule 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @name = N'Respaldo Diferencial 6am',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 060000; -- 6:00 AM
GO

EXEC msdb.dbo.sp_add_jobschedule 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @name = N'Respaldo Diferencial 9am',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 090000; -- 9:00 AM
GO

EXEC msdb.dbo.sp_add_jobschedule 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @name = N'Respaldo Diferencial 12pm',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 120000; -- 12:00 PM
GO

EXEC msdb.dbo.sp_add_jobschedule 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @name = N'Respaldo Diferencial 3pm',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 150000; -- 3:00 PM
GO

EXEC msdb.dbo.sp_add_jobschedule 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @name = N'Respaldo Diferencial 6pm',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 180000; -- 6:00 PM
GO

EXEC msdb.dbo.sp_add_jobschedule 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @name = N'Respaldo Diferencial 9pm',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 210000; -- 9:00 PM
GO

EXEC msdb.dbo.sp_add_jobserver 
    @job_name = N'GenerarBackupDiferencialCada3horas',
    @server_name = N'(local)';
GO