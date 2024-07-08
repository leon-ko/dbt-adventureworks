WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'productsubcategory')}}

), renamed AS (

    SELECT
        MODIFIEDDATE::VARCHAR                           AS MODIFIED_DATE,
        NAME::VARCHAR                                   AS PRODUCT_SUBCATEGORY_NAME,
        PRODUCTCATEGORYID::NUMBER                       AS PRODUCT_CATEGORY_ID,
        PRODUCTSUBCATEGORYID::NUMBER                    AS PRODUCT_SUBCATEGORY_ID,
        ROWGUID::VARCHAR                                AS ROWGU_ID,
        _AIRBYTE_AB_ID::VARCHAR                         AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP                  AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP               AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_PRODUCTSUBCATEGORY_HASHID::VARCHAR     AS AIRBYTE_PRODUCTSUBCATEGORY_HASHID

    FROM source

)

SELECT *
FROM renamed
