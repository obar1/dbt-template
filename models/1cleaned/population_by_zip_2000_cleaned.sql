{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['gender'], 'unique': False}
    ]
)}}

select  zipcode , geo_id         , coalesce(minimum_age,0) minimum_age, coalesce(maximum_age,0) maximum_age , coalesce(gender, {{constants("'na'")}}) gender , population , _ts                              

from  {{ ref('population_by_zip_2000_raw') }}
 

