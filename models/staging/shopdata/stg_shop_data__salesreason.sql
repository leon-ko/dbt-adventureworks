WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'salesreason') }}
),

final AS (
    SELECT
        modifieddate::varchar                AS modified_date,
        name::varchar                        AS salesreason_name,
        reasontype::varchar                  AS reason_type,
        salesreasonid::number                AS salesreason_id,
        _airbyte_ab_id::varchar              AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp       AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp    AS airbyte_normalized_at,
        _airbyte_salesreason_hashid::varchar AS airbyte_salesreason_hashid
    FROM source
)

SELECT *
FROM final;
