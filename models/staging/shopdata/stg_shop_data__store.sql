WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'store')}}

), renamed AS (

    SELECT
        BUSINESSENTITYID::NUMBER            AS BUSINESSENTITY_ID,
        DEMOGRAPHICS::VARCHAR               AS DEMOGRAPHICS,
        MODIFIEDDATE::VARCHAR               AS MODIFIED_DATE,
        NAME::VARCHAR                       AS NAME,
        ROWGUID::VARCHAR                    AS ROW_ID,
        SALESPERSONID::NUMBER               AS SALESPERSON_ID,
        _AIRBYTE_AB_ID::VARCHAR             AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP      AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP   AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_STORE_HASHID::VARCHAR      AS AIRBYTE_STORE_HASHID

    FROM source

)

SELECT *
FROM renamed
