WITH category_revenue_forecast AS (
    SELECT *
    FROM {{ ref('category_revenue_forecast') }}
), --noqa: disable=LT01 

final AS (
    SELECT
        productcategory_id AS productcategory_id,  --noqa: disable=AL09
        revenue_forecast   AS revenue_forecast,
        month_year_day     AS month_year_day
    FROM category_revenue_forecast
)

SELECT *
FROM final;