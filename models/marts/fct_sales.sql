with salesorderdetail as (
    select * from {{ref('stg_shop_data__salesorderdetail')}}
),
salesorderheader as (
    select * from {{ref('stg_shop_data__salesorderheader')}}
),
salesorderreason as (
    select * from {{ref('stg_shop_data__salesorderheadersalesreason')}}
),
snapshot_customer as (
    select * from {{ref('stg_shop_data__snapshot_customer')}}
),
substage as (
    select *
    from salesorderheader
    left join snapshot_customer on salesorderheader.customer_id = snapshot_customer.businessentity_id 
    and salesorderheader.order_date between snapshot_customer.dbt_valid_from and snapshot_customer.dbt_valid_to
),

final as (
    select
        substage.customer_id                            as customer_id,
        coalesce(substage.dbt_scd_id, '0')              as dbt_scd_id,
        to_char(to_timestamp(due_date), 'YYYYMMDD')     as due_at,
        substage.order_date                             as ordered_at,
        substage.subtotal                               as order_subtotal,
        substage.totaldue                               as order_totaldue,
        substage.status                                 as salesorderheader_status,
        substage.salesorder_id                          as salesorder_id,
        substage.salesorder_number                      as salesorder_number,
        coalesce(substage.salesperson_id, 0)            as salesperson_id,
        to_char(to_timestamp(ship_date), 'YYYYMMDD')    as shipped_at,
        substage.territory_id                           as territory_id,
        salesorderdetail.line_total                     as line_total,
        salesorderdetail.order_qty                      as order_quantity,
        salesorderdetail.product_id                     as product_id,
        salesorderdetail.salesorder_detail_id           as salesorder_detail_id,
        salesorderdetail.unit_price                     as unit_price,
        salesorderdetail.unit_price_discount            as unit_price_discount,
        coalesce(salesorderreason.salesreason_id, 10)   as salesreason_id
        
    from salesorderdetail

    left join substage          on salesorderdetail.salesorder_id = substage.salesorder_id
    left join salesorderreason  on salesorderdetail.salesorder_id = salesorderreason.salesorder_id

)

select * from final 