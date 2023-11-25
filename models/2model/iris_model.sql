SELECT *, 
{{ iris_attrs('class', 'sepal_area', 'petal_ratio')}} 
from (
SELECT
    class,
    sepal_length,
    sepal_width,
    petal_length,
    petal_width,
    sepal_length * sepal_width AS sepal_area,
    {{ dbt_utils.safe_divide('petal_length', 'petal_width') }} AS petal_ratio,
 
FROM {{ ref('iris_cleaned') }}
)
