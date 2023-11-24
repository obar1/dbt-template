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
    {{ convert_income('income') }}_converted
FROM {{ ref('adult_cleaned') }}
