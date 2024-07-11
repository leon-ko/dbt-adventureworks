{% test max_value(model, column_name, threshold) %}
SELECT *
FROM {{model}}
WHERE {{column_name}} > {{threshold}}
{% endtest %}