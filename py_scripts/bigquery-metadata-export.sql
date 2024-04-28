select 'bigquery' as db_id, table_catalog, table_schema, table_name, column_name, data_type 
from zoominfo-public.zi_dataset_companies_under_1000_employees_offering_tuition.INFORMATION_SCHEMA.COLUMNS 
order by 1,2,3,4