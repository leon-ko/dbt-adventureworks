with salesorderdetail as (
    select * from {{ref('stg_shop_data__salesorderdetail')}}
),
salesorderheader as (
    select * from {{ref('stg_shop_data__salesorderheader')}}
),
salesorderreason as (
    select * from {{ref('stg_shop_data__salesorderheadersalesreason')}}
),
final as (
    select
        salesorderheader.customer_id                    as customer_id,
        to_char(to_timestamp(due_date), 'YYYYMMDD')     as due_at,
        to_char(to_timestamp(order_date), 'YYYYMMDD')   as ordered_at,
        salesorderheader.subtotal                       as order_subtotal,
        salesorderheader.totaldue                       as order_totaldue,
        salesorderheader.status                         as salesorderheader_status,
        salesorderheader.salesorder_id                  as salesorder_id,
        salesorderheader.salesorder_number              as salesorder_number,
        coalesce(salesorderheader.salesperson_id, 0)    as salesperson_id,
        to_char(to_timestamp(ship_date), 'YYYYMMDD')    as shipped_at,
        salesorderheader.territory_id                   as territory_id,
        salesorderdetail.line_total                     as line_total,
        salesorderdetail.order_qty                      as order_quantity,
        salesorderdetail.product_id                     as product_id,
        salesorderdetail.salesorder_detail_id           as salesorder_detail_id,
        salesorderdetail.unit_price                     as unit_price,
        salesorderdetail.unit_price_discount            as unit_price_discount,
        coalesce(salesorderreason.salesreason_id, 10)   as salesreason_id
        
    from salesorderdetail

    left join salesorderheader on salesorderdetail.salesorder_id = salesorderheader.salesorder_id
    left join salesorderreason on salesorderdetail.salesorder_id = salesorderreason.salesorder_id

)

select * from final