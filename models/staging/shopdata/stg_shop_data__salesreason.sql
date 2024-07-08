WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'salesreason')}}

), renamed AS (

    SELECT
        MODIFIEDDATE::VARCHAR                       AS MODIFIED_DATE,
        NAME::VARCHAR                               AS NAME,
        REASONTYPE::VARCHAR                         AS REASON_TYPE,
        SALESREASONID::NUMBER                       AS SALESREASON_ID,
        _AIRBYTE_AB_ID::VARCHAR                     AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP              AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP           AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_SALESREASON_HASHID::VARCHAR        AS AIRBYTE_SALESREASON_HASHID,

    FROM source

)

SELECT *
FROM renamed
