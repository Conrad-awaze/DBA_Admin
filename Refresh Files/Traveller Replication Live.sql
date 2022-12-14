-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'TR4_LIVE', @optname = N'publish', @value = N'true'
GO

exec [TR4_LIVE].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [TR4_LIVE]
exec sp_addpublication @publication = N'pubFusionILTCache', @description = N'Transactional publication of database ''TR4_LIVE'' from Publisher ''AWSPTRAVSQLCL''.', @sync_method = N'concurrent', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO

exec sp_addpublication_snapshot @publication = N'pubFusionILTCache', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 225000, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'pubFusionILTCache', @login = N'sa'
GO

-- Adding the transactional articles
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Agent', @source_owner = N'dbo', @source_object = N'Agent', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Agent', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_dboAgent]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboAgent]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboAgent]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'PID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Created', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Updated', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Travel', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Mailing', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'TID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'CID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'CID2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Gx', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Gy', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'TermsID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'LimitID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'LID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Points', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Overseas', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Logo', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'CanxCom', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'IsOwnDocumentation', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'IsVATInc', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'IsDepositPayable', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'IsLowDeposit', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'DaysBefBalIsDue', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'ContactNo_CTI', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Mobile_CTI', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Office_CTI', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'TotalHolidayValueComm', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'MailVerified', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'Is3rdPartyPaymentAccepted', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'StateID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'HoldingDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Agent', @column = N'RedactionDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'pubFusionILTCache', @article = N'Agent', @view_name = N'syncobj_0x4146333938463999', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Attribute', @source_owner = N'dbo', @source_object = N'Attribute', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Attribute', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboAttribute]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboAttribute]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboAttribute]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Band', @source_owner = N'dbo', @source_object = N'Band', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Band', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboBand]', @del_cmd = N'CALL [sp_MSdel_dboBand]', @upd_cmd = N'SCALL [sp_MSupd_dboBand]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'BedBankStock', @source_owner = N'dbo', @source_object = N'BedBankStock', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'none', @destination_table = N'BedBankStock', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboBedBankStock]', @del_cmd = N'CALL [sp_MSdel_dboBedBankStock]', @upd_cmd = N'SCALL [sp_MSupd_dboBedBankStock]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Bonding', @source_owner = N'dbo', @source_object = N'Bonding', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Bonding', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboBonding]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboBonding]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboBonding]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Booking', @source_owner = N'dbo', @source_object = N'Booking', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Booking', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [sp_MSins_dboBooking]', @del_cmd = N'CALL [sp_MSdel_dboBooking]', @upd_cmd = N'SCALL [sp_MSupd_dboBooking]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'Updated', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'QuoteID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'ClientID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'AgentID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'TID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'MoneyID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'Created', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'Depart', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'Confirmed', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'MoveDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'Brand_Id', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'IsOldPricing', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'IsEpicPricing', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'CancelledDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'AccountingGroupCode', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'StockGroupId', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'SubAccountingGroupCode', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'SupplierCommissionRate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'NeedsSnapshot', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'EnquiryId', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'LoginID_Confirmation', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'Smoking', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'AgentBookingInitialCommissionRate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'AgentTotalHolidayValueComm', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'ExpiryReason', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'AgentTotalHolidayValueCommOverride', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'LoginID_Quote', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'CollectBalanceOverride', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'UpdateLoginID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'HoldingDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'RedactionDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Booking', @column = N'BasePriceDeposit', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'pubFusionILTCache', @article = N'Booking', @view_name = N'SYNC_Booking_1__999', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'CacheBuildHistory', @source_owner = N'dbo', @source_object = N'CacheBuildHistory', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'CacheBuildHistory', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboCacheBuildHistory]', @del_cmd = N'CALL [sp_MSdel_dboCacheBuildHistory]', @upd_cmd = N'SCALL [sp_MSupd_dboCacheBuildHistory]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'CacheBuildServer', @source_owner = N'dbo', @source_object = N'CacheBuildServer', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'CacheBuildServer', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboCacheBuildServer]', @del_cmd = N'CALL [sp_MSdel_dboCacheBuildServer]', @upd_cmd = N'SCALL [sp_MSupd_dboCacheBuildServer]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'CachePartition', @source_owner = N'dbo', @source_object = N'CachePartition', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'CachePartition', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboCachePartition]', @del_cmd = N'CALL [sp_MSdel_dboCachePartition]', @upd_cmd = N'SCALL [sp_MSupd_dboCachePartition]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'CacheServer', @source_owner = N'dbo', @source_object = N'CacheServer', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'CacheServer', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboCacheServer]', @del_cmd = N'CALL [sp_MSdel_dboCacheServer]', @upd_cmd = N'SCALL [sp_MSupd_dboCacheServer]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Calendar', @source_owner = N'dbo', @source_object = N'Calendar', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'Calendar', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboCalendar]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboCalendar]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboCalendar]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Commission', @source_owner = N'dbo', @source_object = N'Commission', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Commission', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboCommission]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboCommission]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboCommission]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'CompanySupplierType', @source_owner = N'dbo', @source_object = N'CompanySupplierType', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'CompanySupplierType', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboCompanySupplierType]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboCompanySupplierType]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboCompanySupplierType]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Contract', @source_owner = N'dbo', @source_object = N'Contract', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Contract', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboContract]', @del_cmd = N'CALL [sp_MSdel_dboContract]', @upd_cmd = N'SCALL [sp_MSupd_dboContract]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'DateMapping', @source_owner = N'dbo', @source_object = N'DateMapping', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'DateMapping', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboDateMapping]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboDateMapping]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboDateMapping]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Feature', @source_owner = N'dbo', @source_object = N'Feature', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'Feature', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboFeature]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboFeature]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboFeature]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_BookingType', @source_owner = N'dbo', @source_object = N'hos_BookingType', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_BookingType', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_BookingType]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_BookingType]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_BookingType]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_ConfigurationSettingsType', @source_owner = N'dbo', @source_object = N'hos_ConfigurationSettingsType', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_ConfigurationSettingsType', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_ConfigurationSettingsType]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_ConfigurationSettingsType]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_ConfigurationSettingsType]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_Discount', @source_owner = N'dbo', @source_object = N'hos_Discount', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_Discount', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_Discount]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_Discount]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_Discount]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountAgent', @source_owner = N'dbo', @source_object = N'hos_DiscountAgent', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountAgent', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountAgent]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountAgent]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountAgent]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountAppliesTo', @source_owner = N'dbo', @source_object = N'hos_DiscountAppliesTo', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountAppliesTo', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountAppliesTo]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountAppliesTo]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountAppliesTo]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountCalculationType', @source_owner = N'dbo', @source_object = N'hos_DiscountCalculationType', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountCalculationType', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountCalculationType]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountCalculationType]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountCalculationType]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountEngineCacheLastChange', @source_owner = N'dbo', @source_object = N'hos_DiscountEngineCacheLastChange', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'hos_DiscountEngineCacheLastChange', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountEngineCacheLastChange]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountEngineCacheLastChange]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountEngineCacheLastChange]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountHeader', @source_owner = N'dbo', @source_object = N'hos_DiscountHeader', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountHeader', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountHeader]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountHeader]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountHeader]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountHeaderGroup', @source_owner = N'dbo', @source_object = N'hos_DiscountHeaderGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountHeaderGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountHeaderGroup]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountHeaderGroup]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountHeaderGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountHeaderGroupDiscountHeader', @source_owner = N'dbo', @source_object = N'hos_DiscountHeaderGroupDiscountHeader', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountHeaderGroupDiscountHeader', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountHeaderGroupDiscountHeader]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountHeaderGroupDiscountHeader]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountHeaderGroupDiscountHeader]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountPolicy', @source_owner = N'dbo', @source_object = N'hos_DiscountPolicy', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountPolicy', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountPolicy]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountPolicy]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountPolicy]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountPolicyDiscountHeaderGroup', @source_owner = N'dbo', @source_object = N'hos_DiscountPolicyDiscountHeaderGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountPolicyDiscountHeaderGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountPolicyDiscountHeaderGroup]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountPolicyDiscountHeaderGroup]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountPolicyDiscountHeaderGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountRuleGroup', @source_owner = N'dbo', @source_object = N'hos_DiscountRuleGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountRuleGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountRuleGroup]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountRuleGroup]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountRuleGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountSelectorType', @source_owner = N'dbo', @source_object = N'hos_DiscountSelectorType', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountSelectorType', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountSelectorType]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountSelectorType]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountSelectorType]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountService', @source_owner = N'dbo', @source_object = N'hos_DiscountService', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountService', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountService]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountService]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountService]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountStockGroup', @source_owner = N'dbo', @source_object = N'hos_DiscountStockGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountStockGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountStockGroup]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountStockGroup]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountStockGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountSupplier', @source_owner = N'dbo', @source_object = N'hos_DiscountSupplier', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountSupplier', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountSupplier]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountSupplier]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountSupplier]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountType', @source_owner = N'dbo', @source_object = N'hos_DiscountType', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountType', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountType]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountType]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountType]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_DiscountUnit', @source_owner = N'dbo', @source_object = N'hos_DiscountUnit', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_DiscountUnit', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_DiscountUnit]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_DiscountUnit]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_DiscountUnit]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_ExtraGroup', @source_owner = N'dbo', @source_object = N'hos_ExtraGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'hos_ExtraGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_ExtraGroup]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_ExtraGroup]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_ExtraGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_Funding', @source_owner = N'dbo', @source_object = N'hos_Funding', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_Funding', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_Funding]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_Funding]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_Funding]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_FundingCategory', @source_owner = N'dbo', @source_object = N'hos_FundingCategory', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_FundingCategory', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_FundingCategory]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_FundingCategory]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_FundingCategory]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_Rule', @source_owner = N'dbo', @source_object = N'hos_Rule', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_Rule', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_Rule]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_Rule]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_Rule]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_RuleGroup', @source_owner = N'dbo', @source_object = N'hos_RuleGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_RuleGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_RuleGroup]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_RuleGroup]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_RuleGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_RuleGroupRule', @source_owner = N'dbo', @source_object = N'hos_RuleGroupRule', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_RuleGroupRule', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_RuleGroupRule]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_RuleGroupRule]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_RuleGroupRule]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hos_RuleTemplate', @source_owner = N'dbo', @source_object = N'hos_RuleTemplate', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hos_RuleTemplate', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohos_RuleTemplate]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohos_RuleTemplate]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohos_RuleTemplate]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'hosautopricingoffers', @source_owner = N'dbo', @source_object = N'hosautopricingoffers', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'hosautopricingoffers', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbohosautopricingoffers]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbohosautopricingoffers]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbohosautopricingoffers]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Itinerary', @source_owner = N'dbo', @source_object = N'Itinerary', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Itinerary', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboItinerary]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboItinerary]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboItinerary]', @filter_clause = N'start > getdate()-45 and unitid is not null'

-- Adding the article filter
exec sp_articlefilter @publication = N'pubFusionILTCache', @article = N'Itinerary', @filter_name = N'FLTR_Itinerary_1__158', @filter_clause = N'start > getdate()-45 and unitid is not null', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'pubFusionILTCache', @article = N'Itinerary', @view_name = N'syncobj_0x4146343842343242', @filter_clause = N'start > getdate()-45 and unitid is not null', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Lookup', @source_owner = N'dbo', @source_object = N'Lookup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'Lookup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_dboLookup]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboLookup]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboLookup]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'PID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Notes', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Act', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Idx', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val1', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val3', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val4', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val5', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Flag1', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Flag2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Flag3', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val6', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val8', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Lookup', @column = N'Val9', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'pubFusionILTCache', @article = N'Lookup', @view_name = N'syncobj_0x4231393735423431', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Money', @source_owner = N'dbo', @source_object = N'Money', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Money', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboMoney]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboMoney]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboMoney]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'MoneyBand', @source_owner = N'dbo', @source_object = N'MoneyBand', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'MoneyBand', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboMoneyBand]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboMoneyBand]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboMoneyBand]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Numbers', @source_owner = N'dbo', @source_object = N'Numbers', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Numbers', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboNumbers]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboNumbers]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboNumbers]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Object', @source_owner = N'dbo', @source_object = N'Object', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Object', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboObject]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboObject]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboObject]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Profile', @source_owner = N'dbo', @source_object = N'Profile', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Profile', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboProfile]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboProfile]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboProfile]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'ProfileDetail', @source_owner = N'dbo', @source_object = N'ProfileDetail', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'ProfileDetail', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboProfileDetail]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboProfileDetail]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboProfileDetail]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'ProfileHeader', @source_owner = N'dbo', @source_object = N'ProfileHeader', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'ProfileHeader', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboProfileHeader]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboProfileHeader]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboProfileHeader]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Region', @source_owner = N'dbo', @source_object = N'Region', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Region', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboRegion]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboRegion]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboRegion]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SecurityDepositPolicy', @source_owner = N'dbo', @source_object = N'SecurityDepositPolicy', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'SecurityDepositPolicy', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboSecurityDepositPolicy]', @del_cmd = N'CALL [sp_MSdel_dboSecurityDepositPolicy]', @upd_cmd = N'SCALL [sp_MSupd_dboSecurityDepositPolicy]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SecurityDepositPolicyBand', @source_owner = N'dbo', @source_object = N'SecurityDepositPolicyBand', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'SecurityDepositPolicyBand', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboSecurityDepositPolicyBand]', @del_cmd = N'CALL [sp_MSdel_dboSecurityDepositPolicyBand]', @upd_cmd = N'SCALL [sp_MSupd_dboSecurityDepositPolicyBand]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SecurityDepositPolicySupplier', @source_owner = N'dbo', @source_object = N'SecurityDepositPolicySupplier', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'SecurityDepositPolicySupplier', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboSecurityDepositPolicySupplier]', @del_cmd = N'CALL [sp_MSdel_dboSecurityDepositPolicySupplier]', @upd_cmd = N'SCALL [sp_MSupd_dboSecurityDepositPolicySupplier]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Service', @source_owner = N'dbo', @source_object = N'Service', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Service', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboService]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboService]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboService]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SharedAvailabilityMethodDescription', @source_owner = N'dbo', @source_object = N'SharedAvailabilityMethodDescription', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'SharedAvailabilityMethodDescription', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboSharedAvailabilityMethodDescription]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboSharedAvailabilityMethodDescription]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboSharedAvailabilityMethodDescription]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SharedAvailabilitySupplier', @source_owner = N'dbo', @source_object = N'SharedAvailabilitySupplier', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'SharedAvailabilitySupplier', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboSharedAvailabilitySupplier]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboSharedAvailabilitySupplier]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboSharedAvailabilitySupplier]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SharedAvailabilitySupplierParameter', @source_owner = N'dbo', @source_object = N'SharedAvailabilitySupplierParameter', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'SharedAvailabilitySupplierParameter', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboSharedAvailabilitySupplierParameter]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboSharedAvailabilitySupplierParameter]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboSharedAvailabilitySupplierParameter]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Source', @source_owner = N'dbo', @source_object = N'Source', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Source', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboSource]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboSource]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboSource]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Stock', @source_owner = N'dbo', @source_object = N'Stock', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'Stock', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboStock]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboStock]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboStock]', @filter_clause = N'date > getdate()-45'

-- Adding the article filter
exec sp_articlefilter @publication = N'pubFusionILTCache', @article = N'Stock', @filter_name = N'FLTR_Stock_1__158', @filter_clause = N'date > getdate()-45', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'pubFusionILTCache', @article = N'Stock', @view_name = N'syncobj_0x3732383830464632', @filter_clause = N'date > getdate()-45', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Supplier', @source_owner = N'dbo', @source_object = N'Supplier', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Supplier', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_dboSupplier]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboSupplier]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboSupplier]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'PID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Created', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Updated', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'TID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Code', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Name', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'CID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'CID2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Gx', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Gy', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Method', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'RegionID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Dist', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Dir', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Mx', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'My', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'TermsID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'CanxID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'MarginID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'PayID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Free', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'FPer', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'FMax', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'FreeID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'IVR', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'IVRCode', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Opened', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Closed', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'LID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'MApplied', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'MThreshold', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'MCharge', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'HotelGroupCode', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'Map', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'IVRMail', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'PayMID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'AvailabilityPriority', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SellTypeID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'BookingConfirm', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'CanSpanProfiles', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SharedAvailabilitySupplierCode', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SharedAvailabilitySupplierID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SupportsDummyUnits', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SearchEqualisation', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'OECNumber', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'OwnerBookingTerms', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'ContactAlt1', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'ContactAlt2', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'AccNameSVNDBBKU', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'AccountSVNDBBKU', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'BBankSVNDBBKU', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SortCodeSVNDBBKU', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'OnlineStatement', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'StatementEmail', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'SuppressedReasonId', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'MailVerified', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'StateID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'TelephoneReviewDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'HoldingDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = N'pubFusionILTCache', @article = N'Supplier', @column = N'RedactionDate', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = N'pubFusionILTCache', @article = N'Supplier', @view_name = N'syncobj_0x3744344230413999', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SupplierBookingRestriction', @source_owner = N'dbo', @source_object = N'SupplierBookingRestriction', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'SupplierBookingRestriction', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboSupplierBookingRestriction]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboSupplierBookingRestriction]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboSupplierBookingRestriction]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'SupplierBookingRestrictionUnit', @source_owner = N'dbo', @source_object = N'SupplierBookingRestrictionUnit', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'SupplierBookingRestrictionUnit', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboSupplierBookingRestrictionUnit]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboSupplierBookingRestrictionUnit]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboSupplierBookingRestrictionUnit]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_BookingFeeRule', @source_owner = N'dbo', @source_object = N'thg_BookingFeeRule', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_BookingFeeRule', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_BookingFeeRule]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_BookingFeeRule]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_BookingFeeRule]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_BookingFeeRuleItem', @source_owner = N'dbo', @source_object = N'thg_BookingFeeRuleItem', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_BookingFeeRuleItem', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_BookingFeeRuleItem]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_BookingFeeRuleItem]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_BookingFeeRuleItem]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_BookingFeeRuleItemPrice', @source_owner = N'dbo', @source_object = N'thg_BookingFeeRuleItemPrice', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_BookingFeeRuleItemPrice', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_BookingFeeRuleItemPrice]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_BookingFeeRuleItemPrice]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_BookingFeeRuleItemPrice]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_CMS', @source_owner = N'dbo', @source_object = N'thg_CMS', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_CMS', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_CMS]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_CMS]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_CMS]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_CMSBand', @source_owner = N'dbo', @source_object = N'thg_CMSBand', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_CMSBand', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_CMSBand]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_CMSBand]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_CMSBand]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_CMSBandAssignment', @source_owner = N'dbo', @source_object = N'thg_CMSBandAssignment', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_CMSBandAssignment', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_CMSBandAssignment]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_CMSBandAssignment]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_CMSBandAssignment]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_CMSBandData', @source_owner = N'dbo', @source_object = N'thg_CMSBandData', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'thg_CMSBandData', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_CMSBandData]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_CMSBandData]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_CMSBandData]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_CMSTranslation', @source_owner = N'dbo', @source_object = N'thg_CMSTranslation', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'thg_CMSTranslation', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_CMSTranslation]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_CMSTranslation]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_CMSTranslation]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_DepositRule', @source_owner = N'dbo', @source_object = N'thg_DepositRule', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_DepositRule', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_DepositRule]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_DepositRule]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_DepositRule]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_DepositRuleItem', @source_owner = N'dbo', @source_object = N'thg_DepositRuleItem', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_DepositRuleItem', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_DepositRuleItem]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_DepositRuleItem]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_DepositRuleItem]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_DepositRuleItemPrice', @source_owner = N'dbo', @source_object = N'thg_DepositRuleItemPrice', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_DepositRuleItemPrice', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_DepositRuleItemPrice]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_DepositRuleItemPrice]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_DepositRuleItemPrice]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_ExtrasRule', @source_owner = N'dbo', @source_object = N'thg_ExtrasRule', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_ExtrasRule', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_ExtrasRule]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_ExtrasRule]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_ExtrasRule]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_ExtrasRuleExtra', @source_owner = N'dbo', @source_object = N'thg_ExtrasRuleExtra', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_ExtrasRuleExtra', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_ExtrasRuleExtra]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_ExtrasRuleExtra]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_ExtrasRuleExtra]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_ExtrasRuleExtraPrice', @source_owner = N'dbo', @source_object = N'thg_ExtrasRuleExtraPrice', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_ExtrasRuleExtraPrice', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_ExtrasRuleExtraPrice]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_ExtrasRuleExtraPrice]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_ExtrasRuleExtraPrice]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_InsuranceRule', @source_owner = N'dbo', @source_object = N'thg_InsuranceRule', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_InsuranceRule', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_InsuranceRule]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_InsuranceRule]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_InsuranceRule]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_InsuranceRuleInsurance', @source_owner = N'dbo', @source_object = N'thg_InsuranceRuleInsurance', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_InsuranceRuleInsurance', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_InsuranceRuleInsurance]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_InsuranceRuleInsurance]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_InsuranceRuleInsurance]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_InsuranceRuleInsurancePrice', @source_owner = N'dbo', @source_object = N'thg_InsuranceRuleInsurancePrice', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_InsuranceRuleInsurancePrice', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_InsuranceRuleInsurancePrice]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_InsuranceRuleInsurancePrice]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_InsuranceRuleInsurancePrice]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_PaymentRule', @source_owner = N'dbo', @source_object = N'thg_PaymentRule', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_PaymentRule', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_PaymentRule]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_PaymentRule]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_PaymentRule]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_PaymentRuleMethod', @source_owner = N'dbo', @source_object = N'thg_PaymentRuleMethod', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_PaymentRuleMethod', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_PaymentRuleMethod]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_PaymentRuleMethod]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_PaymentRuleMethod]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_Pricing', @source_owner = N'dbo', @source_object = N'thg_Pricing', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_Pricing', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_Pricing]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_Pricing]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_Pricing]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_PricingDetail', @source_owner = N'dbo', @source_object = N'thg_PricingDetail', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_PricingDetail', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_PricingDetail]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_PricingDetail]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_PricingDetail]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_ProductGroup', @source_owner = N'dbo', @source_object = N'thg_ProductGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'thg_ProductGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dbothg_ProductGroup]', @del_cmd = N'CALL [sp_MSdel_dbothg_ProductGroup]', @upd_cmd = N'SCALL [sp_MSupd_dbothg_ProductGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_ProductGroupService', @source_owner = N'dbo', @source_object = N'thg_ProductGroupService', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'thg_ProductGroupService', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dbothg_ProductGroupService]', @del_cmd = N'CALL [sp_MSdel_dbothg_ProductGroupService]', @upd_cmd = N'SCALL [sp_MSupd_dbothg_ProductGroupService]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_ProductGroupServicePrice', @source_owner = N'dbo', @source_object = N'thg_ProductGroupServicePrice', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_ProductGroupServicePrice', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_ProductGroupServicePrice]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_ProductGroupServicePrice]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_ProductGroupServicePrice]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_RegionAdjacency', @source_owner = N'dbo', @source_object = N'thg_RegionAdjacency', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'thg_RegionAdjacency', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_RegionAdjacency]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_RegionAdjacency]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_RegionAdjacency]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_RegionSupplierCache', @source_owner = N'dbo', @source_object = N'thg_RegionSupplierCache', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'thg_RegionSupplierCache', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_RegionSupplierCache]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_RegionSupplierCache]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_RegionSupplierCache]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchy', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchy', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_SalesHierarchy', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SalesHierarchy]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SalesHierarchy]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SalesHierarchy]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchyBrochure', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchyBrochure', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'thg_SalesHierarchyBrochure', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SalesHierarchyBrochure]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SalesHierarchyBrochure]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SalesHierarchyBrochure]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchyCache', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchyCache', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'none', @destination_table = N'thg_SalesHierarchyCache', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SalesHierarchyCache]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SalesHierarchyCache]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SalesHierarchyCache]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchyCommission', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchyCommission', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_SalesHierarchyCommission', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SalesHierarchyCommission]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SalesHierarchyCommission]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SalesHierarchyCommission]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchyOrder', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchyOrder', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_SalesHierarchyOrder', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SalesHierarchyOrder]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SalesHierarchyOrder]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SalesHierarchyOrder]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchyProductGroup', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchyProductGroup', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'thg_SalesHierarchyProductGroup', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dbothg_SalesHierarchyProductGroup]', @del_cmd = N'CALL [sp_MSdel_dbothg_SalesHierarchyProductGroup]', @upd_cmd = N'SCALL [sp_MSupd_dbothg_SalesHierarchyProductGroup]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchyRestrictedDatesCache', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchyRestrictedDatesCache', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'none', @destination_table = N'thg_SalesHierarchyRestrictedDatesCache', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dbothg_SalesHierarchyRestrictedDatesCache]', @del_cmd = N'CALL [sp_MSdel_dbothg_SalesHierarchyRestrictedDatesCache]', @upd_cmd = N'SCALL [sp_MSupd_dbothg_SalesHierarchyRestrictedDatesCache]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchySleepsRange', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchySleepsRange', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_SalesHierarchySleepsRange', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SalesHierarchySleepsRange]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SalesHierarchySleepsRange]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SalesHierarchySleepsRange]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SalesHierarchyUnitCache', @source_owner = N'dbo', @source_object = N'thg_SalesHierarchyUnitCache', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_SalesHierarchyUnitCache', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SalesHierarchyUnitCache]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SalesHierarchyUnitCache]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SalesHierarchyUnitCache]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'thg_SupplierExtra', @source_owner = N'dbo', @source_object = N'thg_SupplierExtra', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'thg_SupplierExtra', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dbothg_SupplierExtra]', @del_cmd = N'CALL [dbo].[sp_MSdel_dbothg_SupplierExtra]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dbothg_SupplierExtra]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'Unit', @source_owner = N'dbo', @source_object = N'Unit', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'Unit', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboUnit]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboUnit]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboUnit]'
GO
use [TR4_LIVE]
exec sp_addarticle @publication = N'pubFusionILTCache', @article = N'UnitRequest', @source_owner = N'dbo', @source_object = N'UnitRequest', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000080350DF, @identityrangemanagementoption = N'manual', @destination_table = N'UnitRequest', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_dboUnitRequest]', @del_cmd = N'CALL [dbo].[sp_MSdel_dboUnitRequest]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_dboUnitRequest]'
GO

-- Adding the transactional subscriptions
use [TR4_LIVE]
exec sp_addsubscription @publication = N'pubFusionILTCache', @subscriber = N'VRUK-A-SILCLUS', @destination_db = N'FusionILTCacheSearch', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'pubFusionILTCache', @subscriber = N'VRUK-A-SILCLUS', @subscriber_db = N'FusionILTCacheSearch', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

