WITH category_revenue_forecast AS (
    SELECT * 
    FROM {{ ref('stg_shop_data__category_revenue_forecast') }}
),

final AS (
    SELECT 
        productcategory_id AS productcategory_id,
        revenue_forecast   AS revenue_forecast,
        month_year_day     AS month_year_day
    FROM 
        category_revenue_forecast
)

SELECT * 
FROM final;
