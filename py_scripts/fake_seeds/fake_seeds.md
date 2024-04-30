# fake dbt seed

> given `some` metadata we want to create `some` meaningful dbt seeds with little intervention...
> while we get access to dev data or masked pre-pord exports :) 
> if you are in the data-eng field, you might be familiar with this ...


## export metadata

> currently supporting duckdb and biquery

get the metadata as

### duckdb

template is [here](./duckdb-metadata-export.sql)

```shell
cd py_scripts
duckcli ../db.duckdb < duckdb-metadata-export.sql 
```

https://duckdb.org/docs/sql/information_schema.html#information_schemaschemata-database-catalog-and-schema

### bigquery

template is [here](./bigquery-metadata-export.sql)

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



## Using the metadata export

Once you have the metadat csv export you can use it or add some `extra` :) 

Samples: 
- [bq](./bigquery-metadata-export.csv)
- [duck](./duckdb-metadata-export.csv)


run the code

```bash
$ cd py_scripts/fake_seeds/
$ python fake_seeds.py ./bigquery-metadata-export.csv 
```

in metadata file you get some useful info

![alt text](image.png)

ex of some data


