WITH source AS (
{% if var('MODE')  == 'QA' %}
    SELECT * FROM {{ ref('qa_iris_raw') }}
{% else %}
    SELECT * FROM {{ source('raw', 'iris_raw') }}
{% endif %}
),

renamed AS (
    SELECT
        {{ adapter.quote("column0") }},
        {{ adapter.quote("column1") }},
        {{ adapter.quote("column2") }},
        {{ adapter.quote("column3") }},
        {{ adapter.quote("column4") }}
    FROM source
)

SELECT * FROM renamed
