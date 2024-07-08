WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'productcategory')}}

), renamed AS (

    SELECT
        MODIFIEDDATE::VARCHAR                       AS MODIFIED_DATE,
        NAME::VARCHAR                               AS PRODUCT_CATEGORY_NAME,
        PRODUCTCATEGORYID::NUMBER                   AS PRODUCT_CATEGORY_ID,
        ROWGUID::VARCHAR                            AS ROW_ID,
        _AIRBYTE_AB_ID::VARCHAR                     AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP              AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP           AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_PRODUCTCATEGORY_HASHID::VARCHAR    AS AIRBYTE_PRODUCTCATEGORY_HASHID,

    FROM source

)

SELECT *
FROM renamed
