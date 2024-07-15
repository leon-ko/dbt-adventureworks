WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'salesorderheader') }}
),

renamed AS (
    SELECT
        accountnumber::varchar                       AS accountnumber,
        billtoaddressid::number                      AS bill_to_address_id,
        comment::varchar                             AS comment,
        creditcardapprovalcode::varchar              AS credit_card_approval_code,
        creditcardid::number                         AS creditcard_id,
        currencyrateid::number                       AS currency_rate_id,
        customerid::number                           AS customer_id,
        duedate::varchar                             AS due_date,
        freight::float                               AS freight,
        modifieddate::varchar                        AS modified_date,
        onlineorderflag::boolean                     AS online_order_flag,
        to_char(to_timestamp(orderdate), 'YYYYMMDD') AS order_date,
        purchaseordernumber::varchar                 AS purchase_order_number,
        revisionnumber::number                       AS revision_number,
        rowguid::varchar                             AS row_id,
        salesorderid::number                         AS salesorder_id,
        salesordernumber::varchar                    AS salesorder_number,
        salespersonid::number                        AS salesperson_id,
        shipdate::varchar                            AS ship_date,
        shipmethodid::number                         AS shipmethod_id,
        shiptoaddressid::number                      AS shiptoaddress_id,
        status::number                               AS status,
        subtotal::float                              AS subtotal,
        territoryid::number                          AS territory_id,
        totaldue::float                              AS totaldue,
        _airbyte_ab_id::varchar                      AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp               AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp            AS airbyte_normalized_at,
        _airbyte_salesorderheader_hashid::varchar    AS airbyte_salesorderheader_hashid
    FROM source
)

SELECT *
FROM renamed;

