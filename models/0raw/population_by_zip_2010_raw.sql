with source as (
    select * from {{ source('raw', 'population_by_zip_2010_init') }}
),

renamed as (
    select
{{ adapter.quote("geo_id") }},{{ adapter.quote("zipcode") }},{{ adapter.quote("population") }},{{ adapter.quote("minimum_age") }},{{ adapter.quote("maximum_age") }},{{ adapter.quote("gender") }},


    from source
)

select *, current_timestamp as _ts from renamed
{% if var('MODE')  == 'DEV' %}
LIMIT 1000
{% endif %}

