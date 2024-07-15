WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'salesorderheadersalesreason') }}
),

final AS (
    SELECT
        modifieddate::varchar                                AS modified_date,
        salesorderid::number                                 AS salesorder_id,
        salesreasonid::number                                AS salesreason_id,
        _airbyte_ab_id::varchar                              AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp                       AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp                    AS airbyte_normalized_at,
        _airbyte_salesorderheadersalesreason_hashid::varchar AS airbyte_salesorderheadersalesreason_hashid
    FROM source
)

SELECT *
FROM final;
