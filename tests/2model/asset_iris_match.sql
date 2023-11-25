-- at least a match 
SELECT * FROM (
    SELECT COALESCE('IRIS-VIRGINICA', 'IRIS-SETOSA', 'IRIS-VERSICOLOR') AS any_iris
    FROM {{ ref('iris_model' ) }}
)
WHERE any_iris IS null
{# group by 1,2,3 #}