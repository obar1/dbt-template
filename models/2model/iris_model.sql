select
    *, {{ iris_attrs('class', 'sepal_area', 'petal_ratio') }}
from (
    select
        class,
        sepal_length,
        sepal_width,
        petal_length,
        petal_width,
        sepal_length * sepal_width as sepal_area,
        {{ dbt_utils.safe_divide('petal_length', 'petal_width') }} as petal_ratio

    from {{ ref('iris_cleaned') }}

)
