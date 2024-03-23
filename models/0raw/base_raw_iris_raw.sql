with source as (
{% if var('MODE')  == 'QA' %}
    SELECT * FROM {{ ref('qa_iris_raw') }}
{% else %}
    select * from {{ source('raw', 'iris_raw') }}
{% endif %}
),

renamed as (
    select
        {{ adapter.quote("column0") }},
        {{ adapter.quote("column1") }},
        {{ adapter.quote("column2") }},
        {{ adapter.quote("column3") }},
        {{ adapter.quote("column4") }}
    from source
)

select * from renamed
