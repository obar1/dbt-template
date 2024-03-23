{% if var('MODE')  == 'DEV' %}
    {{
        config(
            materialized='incremental',
            unique_key='_ts'
        )
    }}
{% endif %}

select
    *, {{ iris_attrs('class', 'sepal_area', 'petal_ratio') }}
from (
    select
{% if var('MODE')  == 'DEV' %}
        current_timestamp as _ts,
{% endif %}
        class,
        sepal_length,
        sepal_width,
        petal_length,
        petal_width,
        sepal_length * sepal_width as sepal_area,
        {{ dbt_utils.safe_divide('petal_length', 'petal_width') }} as petal_ratio

    from {{ ref('iris_cleaned') }}
    {% if var('MODE')  == 'DEV' %}
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where _ts >= (select max(_ts) from {{ this }})

{% endif %}
{% endif %}
)
