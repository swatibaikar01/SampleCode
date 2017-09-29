
-----------------BEGIN: Script to be run at Subscriber 'SANKET\DBInstance1'-----------------
use [ReplB2BDB]
exec sp_addpullsubscription @publisher = N'SANKET', @publication = N'B2B_Pub1', @publisher_db = N'B2B_DB', @independent_agent = N'True', @subscription_type = N'pull', @description = N'', @update_mode = N'read only', @immediate_sync = 1

exec sp_addpullsubscription_agent @publisher = N'SANKET', @publisher_db = N'B2B_DB', @publication = N'B2B_Pub1', @distributor = N'SANKET', @distributor_security_mode = 1, @distributor_login = N'', @distributor_password = null, @enabled_for_syncmgr = N'False', @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 20170926, @active_end_date = 99991231, @alt_snapshot_folder = N'', @working_directory = N'', @use_ftp = N'False', @job_login = N'SANKET\swati', @job_password = null, @publication_type = 0
GO
-----------------END: Script to be run at Subscriber 'SANKET\DBInstance1'-----------------

