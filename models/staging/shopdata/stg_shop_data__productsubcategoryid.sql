WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'productsubcategory') }}
), 

renamed AS (
    SELECT
        modifieddate::varchar                       AS modified_date,
        name::varchar                               AS product_subcategory_name,
        productcategoryid::number                   AS product_category_id,
        productsubcategoryid::number                AS product_subcategory_id,
        rowguid::varchar                            AS rowgu_id,
        _airbyte_ab_id::varchar                     AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp              AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp           AS airbyte_normalized_at,
        _airbyte_productsubcategory_hashid::varchar AS airbyte_productsubcategory_hashid
    FROM source
)

SELECT *
FROM renamed;

