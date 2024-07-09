WITH source AS (

    SELECT *
    FROM {{source('dbt_lk', 'source_customer')}}

), renamed AS (

    SELECT
        ACCOUNTNUMBER::VARCHAR              AS ACCOUNT_NUMBER,
        CUSTOMERID::NUMBER                  AS CUSTOMER_ID,
        MODIFIEDDATE::VARCHAR               AS MODIFIED_DATE,
        PERSONID::VARCHAR                   AS PERSON_ID,
        ROWGUID::VARCHAR                    AS ROW_ID,
        STOREID::NUMBER                     AS STORE_ID,
        TERRITORYID::NUMBER                 AS TERRITORY_ID,
        _AIRBYTE_AB_ID::VARCHAR             AS AIRBYTE_AB_ID,
        _AIRBYTE_CUSTOMER_HASHID::VARCHAR   AS AIRBYTE_CUSTOMER_HASHID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP      AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP   AS AIRBYTE_NORMALIZED_AT

    FROM source

)

SELECT *
FROM renamed