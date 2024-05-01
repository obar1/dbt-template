{{ config(
    materialized = 'view'
)}}


select  geo_id 
from {{ref('population_delta')}} 
where population_delta >= 0 