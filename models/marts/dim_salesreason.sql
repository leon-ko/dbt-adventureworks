with salesreason as (
    select 
        salesreason_name    as salesreason_name,
        reason_type         as reason_type,
        salesreason_id      as salesreason_id
    from 
        {{ref('stg_shop_data__salesreason')}}
)

select * from salesreason