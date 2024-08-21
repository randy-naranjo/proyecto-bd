-- NOTA: Sql Server Agent Debe estar activado

-- SI Sql Server Agent esta desactivado, entonces abrir CMD o PowerShell con el contener corriendo y ejecutar:
/*

1. $ docker exec -it --user root [IdContenedor] bash

2. root@57301203bac5:/# /opt/mssql/bin/mssql-conf set sqlagent.enabled true

3. root@57301203bac5:/# systemctl restart mssql-server.service

// If you get an error message such as systemctl: command not found then just stop and start the container for the changes to take effect.

https://stackoverflow.com/questions/69038304/how-enable-sql-server-agent-in-docker-container-existing
*/
USE msdb
GO

EXEC msdb.dbo.sp_add_job
   @job_name = N'BackupCompletoDiario',
   @enabled = 1,
   @description = N'Job para realizar un backup completo diario de la base de datos a la 1 AM',
   @start_step_id = 1,
   @category_name = N'Database Maintenance',
   @owner_login_name = N'sa';
   GO

EXEC msdb.dbo.sp_add_jobstep
   @job_name = N'BackupCompletoDiario',
   @step_name = N'Realizar Backup Completo',
   @subsystem = N'TSQL',
   @command = N'EXEC [msdb].[dbo].[spCrearBackUpCompleto]',
   @retry_attempts = 0,
   @retry_interval = 0,
   @on_success_action = 1,
   @on_fail_action = 2;
   GO

EXEC msdb.dbo.sp_add_jobschedule
   @job_name = N'BackupCompletoDiario',
   @name = N'Horario Diario 1 AM',
   @freq_type = 4,
   @freq_interval = 1,  
   @active_start_time = 010000; -- 1:00 AM
   GO

EXEC msdb.dbo.sp_add_jobserver
   @job_name = N'BackupCompletoDiario',
   @server_name = N'(local)';
   GO
