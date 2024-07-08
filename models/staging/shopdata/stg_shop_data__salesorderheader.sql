WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'salesorderheader')}}

), renamed AS (

    SELECT
        ACCOUNTNUMBER::VARCHAR                      AS ACCOUNTNUMBER,
        BILLTOADDRESSID::NUMBER                     AS BILL_TOAD_DRESS_ID,
        COMMENT::VARCHAR                            AS COMMENT,
        CREDITCARDAPPROVALCODE::VARCHAR             AS CREDIT_CARD_APPROVAL_CODE,
        CREDITCARDID::NUMBER                        AS CREDITCARD_ID,
        CURRENCYRATEID::NUMBER                      AS CURRENCY_RATE_ID,
        CUSTOMERID::NUMBER                          AS CUSTOMER_ID,
        DUEDATE::VARCHAR                            AS DUE_DATE,
        FREIGHT::FLOAT                              AS FREIGHT,
        MODIFIEDDATE::VARCHAR                       AS MODIFIED_DATE,
        ONLINEORDERFLAG::BOOLEAN                    AS ONLINE_ORDER_FLAG,
        ORDERDATE::VARCHAR                          AS ORDER_DATE,
        PURCHASEORDERNUMBER::VARCHAR                AS PURCHASE_ORDER_NUMBER,
        REVISIONNUMBER::NUMBER                      AS REVISION_NUMBER,
        ROWGUID::VARCHAR                            AS ROW_ID
        SALESORDERID::NUMBER                        AS SALESORDER_ID,
        SALESORDERNUMBER::VARCHAR                   AS SALESORDER_NUMBER,
        SALESPERSONID::NUMBER                       AS SALESPERSON_ID,
        SHIPDATE::VARCHAR                           AS SHIPDATE,
        SHIPMETHODID::NUMBER                        AS SHIPMETHOD_ID,
        SHIPTTOADDRESSID::NUMBER                    AS SHIPTOADDRESS_ID,
        STATUS::NUMBER                              AS STATUS,
        SUBTOTAL::FLOAT                             AS SUBTOTAL,
        TERRITORYID::NUMBER                         AS TERRITORY_ID,
        TOTALDUE::FLOAT                             AS TOTALDUE,
        _AIRBYTE_AB_ID::VARCHAR                     AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP              AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP           AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_SALESORDERHEADER_HASHID::VARCHAR   AS AIRBYTE_SALESORDERHEADER_HASHID,

    FROM source

)

SELECT *
FROM renamed
