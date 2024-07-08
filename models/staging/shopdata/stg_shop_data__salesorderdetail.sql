WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'salesorderdetail')}}

), renamed AS (

    SELECT
        CARRIERTRACKINGNUMBER::VARCHAR              AS CARRIER_TRACKING_NUMBER,
        LINETOTAL::FLOAT                            AS LINETOTAL,
        ORDERQTY::NUMBER                            AS ORDER_QTY,
        MODIFIEDDATE::VARCHAR                       AS MODIFIED_DATE,
        PRODUCTID::NUMBER                           AS PRODUCT_ID,
        ROWGUID::VARCHAR                            AS ROW_ID,
        SALESORDERDETAILID::NUMBER                  AS SALESORDER_DETAIL_ID,
        SALESORDERID::NUMBER                        AS SALESORDER_ID,
        SPECIALOFFERID::NUMBER                      AS SPECIALOFFER_ID,
        UNITPRICE::FLOAT                            AS UNITPRICE,
        UNITPRICEDISCOUNT::FLOAT                    AS UNITPRICE_DISCOUNT,
        _AIRBYTE_AB_ID::VARCHAR                     AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP              AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP           AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_SALESORDERDETAIL_HASHID::VARCHAR   AS AIRBYTE_SALESORDERDETAIL_HASHID

    FROM source

)

SELECT *
FROM renamed
