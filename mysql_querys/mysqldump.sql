
/*
--single-transaction  This will automatically deactivate --lock-tables and allow you to 
						dump all table in the same point-in-time and allow new writes to 
						come at the same time.

--add-drop-database		Drop table if EXISTS and ADD table.
--routines
$(date +%Y-%m-%d-%H.%M.%S) 		add date.
 */



mysqldump --user=root --password=XXXX  --add-drop-database --single-transaction DATABASE  > backup_$(date +%Y-%m-%d-%H.%M.%S)_.sql

