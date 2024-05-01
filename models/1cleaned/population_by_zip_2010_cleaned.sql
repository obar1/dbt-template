{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['gender'], 'unique': False}
    ]
)}}

select  geo_id, zipcode ,    population      , coalesce(cast(minimum_age as int),0) minimum_age, coalesce(cast(maximum_age as int) ,0) maximum_age , coalesce(gender, {{constants("'na'")}}) gender  , _ts                              

from  {{ ref('population_by_zip_2010_raw') }}
 

