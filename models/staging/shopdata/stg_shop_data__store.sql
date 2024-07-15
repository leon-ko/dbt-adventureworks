WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'store') }}
),

final AS (
    SELECT
        businessentityid::number          AS businessentity_id,
        demographics::varchar             AS demographics,
        modifieddate::varchar             AS modified_date,
        name::varchar                     AS store_name,
        rowguid::varchar                  AS row_id,
        salespersonid::number             AS salesperson_id,
        _airbyte_ab_id::varchar           AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp    AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp AS airbyte_normalized_at,
        _airbyte_store_hashid::varchar    AS airbyte_store_hashid
    FROM source
)

SELECT *
FROM final;
