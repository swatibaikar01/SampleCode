USE [msdb]
GO
DECLARE @jobId BINARY(16)
EXEC  msdb.dbo.sp_add_job @job_name=N'B2BDiffBackUpJob', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'SANKET\swati', @job_id = @jobId OUTPUT
select @jobId
GO
EXEC msdb.dbo.sp_add_jobserver @job_name=N'B2BDiffBackUpJob', @server_name = N'SANKET'
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_add_jobstep @job_name=N'B2BDiffBackUpJob', @step_name=N'DiffBackup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_fail_action=2, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Declare @p_filepath1 nvarchar(200)
Declare @p_filepath2 DATETIME
Declare @p_filepath nvarchar(300)

SET @p_filepath1 = N''C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\Backup\DiffBackupB2BDB''
SELECT @p_filepath2 = GETDATE()
SET @p_filepath = @p_filepath1 +replace(replace(replace(
convert(nvarchar(50), getdate(), 120), '' '',''''),''-'',''''),'':'','''')+''.bak''




BACKUP DATABASE [B2B_DB] TO  DISK = @p_filepath 
WITH  DIFFERENTIAL , NOFORMAT, INIT,  NAME = N''B2BDB-Differential Database Backup'', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO', 
		@database_name=N'master', 
		@flags=0
GO
USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_name=N'B2BDiffBackUpJob', 
		@enabled=1, 
		@start_step_id=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@delete_level=0, 
		@description=N'', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'SANKET\swati', 
		@notify_email_operator_name=N'', 
		@notify_page_operator_name=N''
GO
USE [msdb]
GO
DECLARE @schedule_id int
EXEC msdb.dbo.sp_add_jobschedule @job_name=N'B2BDiffBackUpJob', @name=N'Sch_2hours', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20170925, 
		@active_end_date=99991231, 
		@active_start_time=90000, 
		@active_end_time=200000, @schedule_id = @schedule_id OUTPUT
select @schedule_id
GO
