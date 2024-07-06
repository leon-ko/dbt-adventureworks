{{
    config(
        materialized = "table"
    )
}}

with 
    raw_generated_dates as (
        {{dbt_date.get_date_dimension("2011-01-01", "2014-12-31")}}
    )


SELECT
    REPLACE(date_day, '-', '') as date_key,
    date_day,
    year_number,
    day_of_month,
    day_of_week,
    day_of_year,
    month_name,
    month_of_year,
    quarter_of_year,
    day_of_week_name,
    week_of_year
FROM 
    raw_generated_dates
