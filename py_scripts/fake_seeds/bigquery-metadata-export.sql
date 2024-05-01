SELECT
  'bigquery' db_id,
  table_catalog,
  table_schema,
  table_name,
  column_name,
  data_type,
  CAST(NULL AS string) extra
FROM
  bigquery-public-data.census_bureau_usa.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name IN ('population_by_zip_2000',
    'population_by_zip_2010')
ORDER BY
  1,
  2,
  3,
  4

