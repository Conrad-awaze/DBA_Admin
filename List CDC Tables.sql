USE TR4_LIVE
GO
select name,is_tracked_by_cdc
from sys.tables
where is_tracked_by_cdc  = 1
GO
