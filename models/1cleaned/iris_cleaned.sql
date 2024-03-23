{#
    map to the right column anmes and types etc

    . Attribute Information:
   1. sepal length in cm
   2. sepal width in cm
   3. petal length in cm
   4. petal width in cm
   5. class: 
      -- Iris Setosa
      -- Iris Versicolour
      -- Iris Virginica

#}
select
{% if var('MODE')  == 'DEV' %}
        current_timestamp as _ts,
{% endif %}

    cast(column0 as float) as sepal_length,
    cast(column1 as float) as sepal_width,
    cast(column2 as float) as petal_length,
    cast(column3 as float) as petal_width,
    upper(cast(column4 as string)) as class
from {{ ref('base_raw_iris_raw') }}
