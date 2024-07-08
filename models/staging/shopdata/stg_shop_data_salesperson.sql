WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'salesperson')}}

), renamed AS (

    SELECT
        BONUS::FLOAT                                    AS BONUS,
        BUSINESSENTITYID::NUMBER                        AS BUSINESSENTITY_ID,
        COMMISSIONPCT::FLOAT                            AS COMMISSIONPCT,
        MODIFIEDDATE::VARCHAR                           AS MODIFIEDDATE,
        ROWGUID::VARCHAR                                AS ROW_ID,
        SALESLASTYEAR::FLOAT                            AS SALESLASTYEAR,
        SALESQUOTA::FLOAT                               AS SALESQUOTA,
        SALESYTD::FLOAT                                 AS SALESYTD,
        TERRITORYID::NUMBER                             AS TERRITORY_ID,                
        _AIRBYTE_AB_ID::VARCHAR                         AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP                  AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP               AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_SALESPERSON_HASHID::VARCHAR            AS AIRBYTE_SALESPERSON_HASHID

    FROM source

)

SELECT *
FROM renamed



