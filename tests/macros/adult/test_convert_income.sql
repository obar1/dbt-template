{# 
    test macro convert_income
    n> dbt pass if nothis is returned
 #}
{% set actual %}
with actual as (
    select '<=50K' as c1 
    union all
    select '>50K' as c1 
)

  select  {{ convert_income('c1')}} as c1
  from actual
{% endset %}

{% set expected %}
   with expected as (
    select 49999 as c1 
    union all
    select 50001 as c1 
)

  select c1
  from expected 
{% endset %}

{{ audit_helper.compare_queries(
    a_query=actual,
    b_query=expected,
) }}
where percent_of_total < 100