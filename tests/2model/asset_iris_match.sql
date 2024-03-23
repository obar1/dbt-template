-- at least a match 
select * from (
    select coalesce('IRIS-VIRGINICA', 'IRIS-SETOSA', 'IRIS-VERSICOLOR') as any_iris
    from {{ ref('iris_model' ) }}
)
where any_iris is null
{# group by 1,2,3 #}