use [B2B_DB]
exec sp_replicationdboption @dbname = N'B2B_DB', @optname = N'publish', @value = N'true'
GO
use [B2B_DB]
exec [B2B_DB].sys.sp_addlogreader_agent @job_login = N'SANKET\swati', @job_password = null, @publisher_security_mode = 1, @job_name = null
GO
-- Adding the transactional publication
use [B2B_DB]
exec sp_addpublication @publication = N'B2B_Pub1', @description = N'Transactional publication of database ''B2B_DB'' from Publisher ''SANKET''.', @sync_method = N'concurrent', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'B2B_Pub1', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = N'SANKET\swati', @job_password = null, @publisher_security_mode = 1


use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Company', @source_owner = N'dbo', @source_object = N'Tbl_Company', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Company', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Company', @del_cmd = N'CALL sp_MSdel_dboTbl_Company', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Company'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Company_Price', @source_owner = N'dbo', @source_object = N'Tbl_Company_Price', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Company_Price', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Company_Price', @del_cmd = N'CALL sp_MSdel_dboTbl_Company_Price', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Company_Price'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Cust_Sub', @source_owner = N'dbo', @source_object = N'Tbl_Cust_Sub', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Cust_Sub', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Cust_Sub', @del_cmd = N'CALL sp_MSdel_dboTbl_Cust_Sub', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Cust_Sub'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Customer', @source_owner = N'dbo', @source_object = N'Tbl_Customer', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Customer', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Customer', @del_cmd = N'CALL sp_MSdel_dboTbl_Customer', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Customer'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Order', @source_owner = N'dbo', @source_object = N'Tbl_Order', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Order', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Order', @del_cmd = N'CALL sp_MSdel_dboTbl_Order', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Order'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Product', @source_owner = N'dbo', @source_object = N'Tbl_Product', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Product', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Product', @del_cmd = N'CALL sp_MSdel_dboTbl_Product', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Product'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Subsidiary', @source_owner = N'dbo', @source_object = N'Tbl_Subsidiary', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Subsidiary', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Subsidiary', @del_cmd = N'CALL sp_MSdel_dboTbl_Subsidiary', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Subsidiary'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Supplier_Price', @source_owner = N'dbo', @source_object = N'Tbl_Supplier_Price', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Supplier_Price', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Supplier_Price', @del_cmd = N'CALL sp_MSdel_dboTbl_Supplier_Price', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Supplier_Price'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'Tbl_Supplier_Product', @source_owner = N'dbo', @source_object = N'Tbl_Supplier_Product', @type = N'logbased', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Tbl_Supplier_Product', @destination_owner = N'dbo', @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dboTbl_Supplier_Product', @del_cmd = N'CALL sp_MSdel_dboTbl_Supplier_Product', @upd_cmd = N'SCALL sp_MSupd_dboTbl_Supplier_Product'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'USP_AddSubsidiary', @source_owner = N'dbo', @source_object = N'USP_AddSubsidiary', @type = N'proc schema only', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_table = N'USP_AddSubsidiary', @destination_owner = N'dbo'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'USP_GetTotalOrdersPerCustomer', @source_owner = N'dbo', @source_object = N'USP_GetTotalOrdersPerCustomer', @type = N'proc schema only', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_table = N'USP_GetTotalOrdersPerCustomer', @destination_owner = N'dbo'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'USP_GetTotalQuantityPerCompany', @source_owner = N'dbo', @source_object = N'USP_GetTotalQuantityPerCompany', @type = N'proc schema only', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_table = N'USP_GetTotalQuantityPerCompany', @destination_owner = N'dbo'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'USP_InsertCompany', @source_owner = N'dbo', @source_object = N'USP_InsertCompany', @type = N'proc schema only', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_table = N'USP_InsertCompany', @destination_owner = N'dbo'
GO




use [B2B_DB]
exec sp_addarticle @publication = N'B2B_Pub1', @article = N'VW_OrderDetails', @source_owner = N'dbo', @source_object = N'VW_OrderDetails', @type = N'view schema only', @description = null, @creation_script = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000008000001, @destination_table = N'VW_OrderDetails', @destination_owner = N'dbo'
GO




