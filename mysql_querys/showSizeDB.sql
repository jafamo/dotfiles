/*
* No modify,just running
*/
SELECT 
    table_schema "Nombre base de datos",
    sum(data_length+index_length) / 1024 /
    1024 "Espacio ocupado en MB",
    sum(data_free)/ 1024 / 1024 "Espacio libre en MB"
FROM information_schema.TABLES
GROUP BY table_schema;

