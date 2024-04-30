SELECT
  'bigquery' db_id,
  table_catalog,
  table_schema,
  table_name,
  column_name,
  data_type,
  CAST(NULL AS string) extra
FROM
  bigquery-public-data.austin_bikeshare.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name IN ('bikeshare_stations',
    'bikeshare_trips')
ORDER BY
  1,
  2,
  3,
  4