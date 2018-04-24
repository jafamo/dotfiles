
/*
--single-transaction  This will automatically deactivate --lock-tables and allow you to 
						dump all table in the same point-in-time and allow new writes to 
						come at the same time.

--add-drop-database		Drop table if EXISTS and ADD table.

--routines


--triggers

--events
 */


mysqldump --user=root --password=XXXX  --routines --trigers --events --add-drop-database --single-transaction DATABASE  > confluence_.sql

