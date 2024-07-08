WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'salesterritory')}}

), renamed AS (

    SELECT
        COUNTRYREGIONCODE::VARCHAR                  AS COUNTRY_REGION_CODE,
        GROUP::VARCHAR                              AS GROUP,
        MODIFIEDDATE::VARCHAR                       AS MODIFIED_DATE,
        NAME::VARCHAR                               AS NAME,
        ROWGUID::VARCHAR                            AS ROW_ID,
        SALESLASTYEAR::FLOAT                        AS SALES_LAST_YEAR,
        SALESYTD::FLOAT                             AS SALES_YTD,
        TERRITORYID::NUMBER                         AS TERRITORY_ID,
        _AIRBYTE_AB_ID::VARCHAR                     AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP              AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP           AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_SALESTERRITORY_HASHID::VARCHAR     AS AIRBYTE_SALESORDERTERRITORY_HASHID

    FROM source

)

SELECT *
FROM renamed