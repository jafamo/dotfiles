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


/** Esta te lo muestra con mas precision
*/

select
    table_schema "Base de datos",
    convert(sum(data_length+index_length)/1048576,decimal(6,2)) "SIZE (MB)"
from
    information_schema.tables
where
    table_schema!="information_schema"
group by
    table_schema;
