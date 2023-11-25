{# is valid iris class or not as flat table with attrs#}
{% macro iris_attrs(class, sepal_area, petal_ratio) -%}
    {% set huge_small = 100 %}
    {% for iris_class in ["IRIS-VIRGINICA","IRIS-SETOSA","IRIS-VERSICOLOR"] %}
    coalesce(
      case when {{ class }} = '{{ iris_class }}'  and    {{ sepal_area }} * {{ petal_ratio }} >= {{ huge_small }}  then   'HUGE' else NULL end,
      case when {{ class }} = '{{ iris_class }}'   and {{ sepal_area }} * {{ petal_ratio }} < {{ huge_small }}  then  'SMALL' else NULL end,
      NULL
    ) as '{{ iris_class }}',
{% endfor %}

{%- endmacro %}

