{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['gender'], 'unique': False}
    ]
)}}

select
    zipcode,
    geo_id,
    coalesce(minimum_age, 0) as minimum_age,
    coalesce(maximum_age, 0) as maximum_age,
    coalesce(gender, {{constants("'na'")}}) as gender,
    population,
    _ts

from {{ ref('population_by_zip_2000_raw') }}
