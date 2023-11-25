{# is valid iris class or not as flat table with attrs#}
{% macro iris_attrs(class, sepal_area, petal_ratio) -%}

{% for iris_class in ["IRIS-VIRGINICA","IRIS-SETOSA","IRIS-VERSICOLOR"] %}
      case when {{ class }} = '{{ iris_class }}'   
            case when {{ sepal_area }} * {{ petal_ratio }} > 10  then  
                  'HUGE' else 'SMALL'  end
      else NULL end as '{{ iris_class }}',
{% endfor %}

{%- endmacro %}

