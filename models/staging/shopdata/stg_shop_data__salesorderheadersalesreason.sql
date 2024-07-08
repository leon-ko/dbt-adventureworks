WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'salesorderheadersalesreason')}}

), renamed AS (

    SELECT
        MODIFIEDDATE::VARCHAR                                      AS MODIFIED_DATE,
        SALESORDERID::NUMBER                                       AS SALESORDER_ID,
        SALESREASONID::NUMBER                                      AS SALESREASON_ID,
        _AIRBYTE_AB_ID::VARCHAR                                    AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP                             AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP                          AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_SALESORDERHEADERSALESREASON_HASHID::VARCHAR       AS AIRBYTE_SALESORDERHEADERSALESREASON_HASHID

    FROM source

)

SELECT *
FROM renamed
