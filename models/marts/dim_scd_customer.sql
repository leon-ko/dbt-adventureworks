with scd_customer as (
    select * 
    from {{ ref('category_re') }}
), 
final as (
    select 
        productcategory_id  as product_category_id,
        revenue_forecast    as revenue_forecast,
        month_year_day      as month_year_day
    from 
        category_revenue_forecast
)

select * from final;
