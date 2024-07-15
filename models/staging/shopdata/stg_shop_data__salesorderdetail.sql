WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'salesorderdetail') }}
),

renamed AS (
    SELECT
        carriertrackingnumber::varchar            AS carrier_tracking_number,
        linetotal::float                          AS line_total,
        orderqty::number                          AS order_qty,
        modifieddate::varchar                     AS modified_date,
        productid::number                         AS product_id,
        rowguid::varchar                          AS row_id,
        salesorderdetailid::number                AS salesorder_detail_id,
        salesorderid::number                      AS salesorder_id,
        specialofferid::number                    AS specialoffer_id,
        unitprice::float                          AS unit_price,
        unitpricediscount::float                  AS unit_price_discount,
        _airbyte_ab_id::varchar                   AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp            AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp         AS airbyte_normalized_at,
        _airbyte_salesorderdetail_hashid::varchar AS airbyte_salesorderdetail_hashid
    FROM source
)

SELECT *
FROM renamed;
