
{% set actual=ref('iris_cleaned') %}

{% set expected=ref('qa_expected_iris_cleaned') %}

{% if var('MODE')  == 'QA' %}
{{ audit_helper.compare_relations(
    a_relation=actual,
    b_relation=expected,
) }}
{% else %}
    SELECT null AS percent_of_total
{% endif %}

WHERE percent_of_total < 100
