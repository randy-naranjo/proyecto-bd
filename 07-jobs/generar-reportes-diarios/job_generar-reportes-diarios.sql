-- NOTA: Sql Server Agent Debe estar activado

-- SI Sql Server Agent esta desactivado, entonces abrir CMD o PowerShell con el contener corriendo y ejecutar:
/*

1. $ docker exec -it --user root [IdContenedor] bash

2. root@57301203bac5:/# /opt/mssql/bin/mssql-conf set sqlagent.enabled true

3. root@57301203bac5:/# systemctl restart mssql-server.service

// If you get an error message such as systemctl: command not found then just stop and start the container for the changes to take effect.

https://stackoverflow.com/questions/69038304/how-enable-sql-server-agent-in-docker-container-existing
*/

EXEC msdb.dbo.sp_add_category 
   @class = N'JOB',
   @type = N'LOCAL',
   @name = N'[ReportesJobs]';

EXEC msdb.dbo.sp_add_job
   @job_name = N'GenerarReporteCentralizadoDiario',
   @enabled = 1,
   @description = N'Job generar reporte de ventas centralizado al final del día',
   @start_step_id = 1,
   @category_name = N'[ReportesJobs]',
   @owner_login_name = N'sa';

EXEC msdb.dbo.sp_add_jobstep
   @job_name = N'GenerarReporteCentralizadoDiario',
   @step_name = N'Generar Reporte',
   @subsystem = N'TSQL',
   @command = N'
   BEGIN
        DECLARE @DiaAnterior DATE;
        SELECT @DiaAnterior = DATEADD(DAY, -1, CAST(GETDATE() AS DATE));
        EXEC [OPERACIONES].[dbo].[sp_generarReporteVentasCentralizado] @Fecha = @DiaAnterior;
   END
   ',
   @retry_attempts = 0,
   @retry_interval = 0,
   @on_success_action = 1,
   @on_fail_action = 2;

EXEC msdb.dbo.sp_add_jobschedule
   @job_name = N'GenerarReporteCentralizadoDiario',
   @name = N'Reporte Centralizado de Ventas Diario',
   @freq_type = 4,
   @freq_interval = 1,
   @active_start_time = 000000;  --Medianoche (12:00 AM)

EXEC msdb.dbo.sp_add_jobserver
   @job_name = N'GenerarReporteCentralizadoDiario',
   @server_name = N'(local)';