WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'productcategory') }}
),

renamed AS (
    SELECT
        modifieddate::varchar                    AS modified_date,
        name::varchar                            AS product_category_name,
        productcategoryid::number                AS product_category_id,
        rowguid::varchar                         AS row_id,
        _airbyte_ab_id::varchar                  AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp           AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp        AS airbyte_normalized_at,
        _airbyte_productcategory_hashid::varchar AS airbyte_productcategory_hashid
    FROM source
)

SELECT *
FROM renamed
