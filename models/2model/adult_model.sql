SELECT
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
FROM {{ ref('adult_cleaned') }}
