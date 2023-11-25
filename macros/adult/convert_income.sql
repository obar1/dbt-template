{# convert ranges in numbers
| income |
+--------+
|  >50K  |
|  <=50K |
 #}
{% macro convert_income(column_name) -%}
CASE
WHEN {{column_name}} ='<=50K' THEN 49999
WHEN {{column_name}} ='>50K' THEN 50001
ELSE NULL
END AS {{column_name}}
{%- endmacro %}