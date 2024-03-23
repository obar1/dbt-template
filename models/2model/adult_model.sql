    {{
        config(
            materialized='incremental',
            unique_key='_ts'
        )
    }}
select
_ts,
    age,
    workclass,
    fnlwgt,
    education,
    occupation,
    race,
    sex,
    capital_gain,
    capital_loss,
    native_country,
    income,
    {{ convert_income('income') }} as income_converted
from {{ ref('adult_cleaned') }}
 {% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where _ts >= (select max(_ts) from {{ this }})

{% endif %}
