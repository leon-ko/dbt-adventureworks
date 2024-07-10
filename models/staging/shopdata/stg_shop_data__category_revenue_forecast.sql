with category_revenue_forecast as (
    select * from {{ref('category_revenue_forecast')}}
), 
final as (
    select 
        productcategory_id  as productcategory_id,
        revenue_forecast    as revenue_forecast,
        month_year_day      as month_year_day

    from 
        category_revenue_forecast
)

select * from final