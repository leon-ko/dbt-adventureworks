with salesterritory as (
    select
        sales_territory_id          as territory_id,
        sales_territory_name        as salesterritory_name,
        sales_territory_group       as salesterritory_group,
        country_region_code         as country_region_code
    from 
        {{ref('stg_shop_data__salesterritory')}}
)

select * from salesterritory