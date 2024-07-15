WITH salesorderdetail AS (
    SELECT *
    FROM {{ ref('stg_shop_data__salesorderdetail') }}
),

salesorderheader AS (
    SELECT *
    FROM {{ ref('stg_shop_data__salesorderheader') }}
),

salesorderreason AS (
    SELECT *
    FROM {{ ref('stg_shop_data__salesorderheadersalesreason') }}
),

snapshot_customer AS (
    SELECT *
    FROM {{ ref('stg_shop_data__snapshot_customer') }}
),

substage AS (
    SELECT *
    FROM salesorderheader
    LEFT JOIN snapshot_customer
        ON salesorderheader.customer_id = snapshot_customer.businessentity_id
        AND salesorderheader.order_date BETWEEN snapshot_customer.dbt_valid_from AND snapshot_customer.dbt_valid_to
),

final AS (
    SELECT
        substage.customer_id                          AS customer_id, --noqa: disable=AL09 
        COALESCE(substage.dbt_scd_id, '0')            AS dbt_scd_id,
        TO_CHAR(TO_TIMESTAMP(due_date), 'YYYYMMDD')   AS due_at,
        substage.order_date                           AS ordered_at,
        substage.subtotal                             AS order_subtotal,
        substage.totaldue                             AS order_totaldue,
        substage.status                               AS salesorderheader_status,
        substage.salesorder_id                        AS salesorder_id,
        substage.salesorder_number                    AS salesorder_number,
        COALESCE(substage.salesperson_id, 0)          AS salesperson_id,
        TO_CHAR(TO_TIMESTAMP(ship_date), 'YYYYMMDD')  AS shipped_at,
        substage.territory_id                         AS territory_id,
        salesorderdetail.line_total                   AS line_total,
        salesorderdetail.order_qty                    AS order_quantity,
        salesorderdetail.product_id                   AS product_id,
        salesorderdetail.salesorder_detail_id         AS salesorder_detail_id,
        salesorderdetail.unit_price                   AS unit_price,
        salesorderdetail.unit_price_discount          AS unit_price_discount,
        COALESCE(salesorderreason.salesreason_id, 10) AS salesreason_id
    FROM salesorderdetail
    LEFT JOIN substage
        ON salesorderdetail.salesorder_id = substage.salesorder_id
    LEFT JOIN salesorderreason
        ON salesorderdetail.salesorder_id = salesorderreason.salesorder_id
)

SELECT * 
FROM final;
