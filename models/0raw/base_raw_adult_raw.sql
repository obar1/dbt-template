with source as (
    select * from {{ source('raw', 'adult_raw') }}
),

renamed as (
    select
        {{ adapter.quote("column00") }},
        {{ adapter.quote("column01") }},
        {{ adapter.quote("column02") }},
        {{ adapter.quote("column03") }},
        {{ adapter.quote("column04") }},
        {{ adapter.quote("column05") }},
        {{ adapter.quote("column06") }},
        {{ adapter.quote("column07") }},
        {{ adapter.quote("column08") }},
        {{ adapter.quote("column09") }},
        {{ adapter.quote("column10") }},
        {{ adapter.quote("column11") }},
        {{ adapter.quote("column12") }},
        {{ adapter.quote("column13") }},
        {{ adapter.quote("column14") }}

    from source
)

select *,        current_timestamp as _ts from renamed
