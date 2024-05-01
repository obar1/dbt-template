with source as (
    select * from {{ source('raw', 'population_by_zip_2000') }}
),

renamed as (
    select
{{ adapter.quote("zipcode") }},
{{ adapter.quote("geo_id") }},
{{ adapter.quote("minimum_age") }},
{{ adapter.quote("maximum_age") }},
{{ adapter.quote("gender") }},
{{ adapter.quote("population") }},


    from source
)

select *, current_timestamp as _ts from renamed
{% if var('MODE')  == 'DEV' %}
LIMIT 1000
{% endif %}
