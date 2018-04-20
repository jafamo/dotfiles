/*
*Show ENGINE 
*change dbname with you database
*/

SELECT TABLE_NAME,
       ENGINE
FROM   information_schema.TABLES
WHERE  TABLE_SCHEMA = 'dbname';
