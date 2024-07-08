WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'salesterritory')}}

), renamed AS (

    SELECT
        COUNTRYREGIONCODE::VARCHAR                  AS COUNTRY_REGION_CODE,
        MODIFIEDDATE::VARCHAR                       AS MODIFIED_DATE,
        "Group"::VARCHAR                            AS SALES_TERRITORY_GROUP,
        NAME::VARCHAR                               AS SALES_TERRITORY_NAME,
        ROWGUID::VARCHAR                            AS ROW_ID,
        SALESLASTYEAR::FLOAT                        AS SALES_LAST_YEAR,
        SALESYTD::FLOAT                             AS SALES_YTD,
        TERRITORYID::NUMBER                         AS SALES_TERRITORY_ID,
        _AIRBYTE_AB_ID::VARCHAR                     AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP              AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP           AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_SALESTERRITORY_HASHID::VARCHAR     AS AIRBYTE_SALESORDERTERRITORY_HASHID

    FROM source

)

SELECT *
FROM renamed
