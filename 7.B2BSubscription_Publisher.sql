-----------------BEGIN: Script to be run at Publisher 'SANKET'-----------------
use [B2B_DB]
exec sp_addsubscription @publication = N'B2B_Pub1', @subscriber = N'SANKET\DBInstance1', @destination_db = N'ReplB2BDB', @sync_type = N'Automatic', @subscription_type = N'pull', @update_mode = N'read only'
GO
-----------------END: Script to be run at Publisher 'SANKET'-----------------
