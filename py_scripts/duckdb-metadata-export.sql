COPY (
select 'duck_db' as db_type, t.table_catalog, t.table_schema, t.table_name, column_name, data_type 
from db.information_schema.tables t 
join information_schema.columns c
using (table_name)
order by 1,2,3,4
) TO 'duckdb-metadata-export.csv' (HEADER, DELIMITER ',');