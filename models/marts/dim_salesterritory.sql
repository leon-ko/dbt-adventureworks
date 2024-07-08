with salesterritory as (
    select
        sales_territory_id,
        sales_territory_name,
        sales_territory_group,
        country_region_code
    from 
        {{ref('stg_shop_data__salesterritory')}}
)

select * from salesterritory