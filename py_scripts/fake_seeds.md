# fake dbt seed

> given `some` metadata we want to create `some` meaningful dbt seeds with little intervention...
> while we get access to dev data or masked pre-pord exports :) 
> if you are in the data-eng field, you might be familiar with this ...


## export metadata

> currently supporting duckdb and biquery

get the metadata as

### duckdb

```sql
-- for duck_db
select 'duck_db' as db_type, t.table_catalog, t.table_schema, t.table_name, column_name, data_type 
from db.information_schema.tables t 
join information_schema.columns c
using (table_name)
order by 1,2,3,4
```

```shell
cd py_scripts
duckcli ../db.duckdb < duckdb-metadata-export.sql 
```

https://duckdb.org/docs/sql/information_schema.html#information_schemaschemata-database-catalog-and-schema

### bigquery

```sql
-- for bigquery
select 'bigquery' as db_id, table_catalog, table_schema, table_name, column_name, data_type 
from zoominfo-public.zi_dataset_companies_under_1000_employees_offering_tuition.INFORMATION_SCHEMA.COLUMNS 
order by 1,2,3,4

```

```ps1
cd py_scripts
bq query --format=csv  --use_legacy_sql=false < bigquery-metadata-export.sql > bigquery-metadata-export.csv
```
https://cloud.google.com/bigquery/docs/information-schema-intro

as 
for `duckdb` we have
+-----------+
| BIGINT    |
| DOUBLE    |
| VARCHAR   |
+-----------+

for `bigquery` we have

data_type
INT64
STRING
FLOAT64
DATE

we have to add the db_id columnm in the export to be used in the next step.. 





