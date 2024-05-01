{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['geo_id'], 'unique': True}
    ]
)}}


select  geo_id, 
p2010.population - p2000.population as population_delta 
from {{ref('population_by_zip_2000_cleaned')}} p2000 
full outer join {{ref('population_by_zip_2010_cleaned')}} p2010
using (geo_id) 