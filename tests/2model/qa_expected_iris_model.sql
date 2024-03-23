{% set actual=ref('iris_model') %}

{% set expected=ref('qa_expected_iris_model') %}

{% if var('MODE')  == 'QA' %}
{{ audit_helper.compare_relations(
    a_relation=actual,
    b_relation=expected,
) }}
{% else %}
    select null as percent_of_total
{% endif %}

where percent_of_total < 100
{#
    TODO: conver this logic to a macro to encapsulate the logic
#}