with salesreason as (
    select 
        salesreason_name,
        reason_type,
        salesreason_id
    from 
        {{ref('stg_shop_data__salesreason')}}
)

select * from salesreason