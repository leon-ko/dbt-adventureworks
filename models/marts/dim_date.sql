with 
    raw_generated_dates as (
        {{dbt_date.get_date_dimension("2011-01-01", "2014-12-31")}}
    ),

final AS (

    SELECT
        REPLACE(date_day, '-', '')  AS date_key,
        date_day                    AS date_day,
        year_number                 AS year_number,
        day_of_month                AS day_of_month,
        day_of_week                 AS day_of_week,
        day_of_year                 AS day_of_year,
        month_name                  AS month_name,
        month_of_year               AS month_of_year,
        quarter_of_year             AS quarter_of_year,
        day_of_week_name            AS day_of_week_name,
        week_of_year                AS week_of_year
    
    FROM 
        raw_generated_dates

)

SELECT *
FROM final 
