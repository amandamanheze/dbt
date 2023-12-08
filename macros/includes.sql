{% macro fill_columns(include=[], exclude=[]) -%}
    {% set schemaCols = model['columns'] %}

    {% set finalCols = [] %}

    {% for col in schemaCols %}
        {% set column = schemaCols[col]%}
        {% set colName = column.name %}
        {% set colType = column.data_type %}
        {% set fieldValue = "CAST(NULL AS " + colType + ") AS " + colName %}

        {% if colName in include %}
            {% set _ = finalCols.append(fieldValue) %}
        {% elif not include and (colName not in exclude) %}
            {% set _ = finalCols.append(fieldValue) %}
        {% endif %}

    {% endfor %}

    {% do return(finalCols | join(', ')) %}
{%- endmacro %}
