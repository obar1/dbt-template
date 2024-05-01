COPY (
    SELECT 'duckdb' db_id, 
    t.table_catalog, 
    t.table_schema, 
    t.table_name,   
    column_name, 
    data_type,
    CAST(NULL AS string) extra
    FROM db.information_schema.tables t 
    JOIN information_schema.columns c
    USING (table_name)
    where table_name IN ('population_by_zip_2000',
    'population_by_zip_2010')
    ORDER BY 1,2,3,4
) TO 'duckdb-metadata-export.csv' (HEADER, DELIMITER ',');