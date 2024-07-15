WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'salesperson') }}
), 

final AS (
    SELECT
        bonus::float                         AS bonus,
        businessentityid::number             AS salesperson_id,
        commissionpct::float                 AS commissionpct,
        modifieddate::varchar                AS modified_date,
        rowguid::varchar                     AS row_id,
        saleslastyear::float                 AS sales_last_year,
        salesquota::float                    AS salesquota,
        salesytd::float                      AS sales_ytd,
        territoryid::number                  AS territory_id,                
        _airbyte_ab_id::varchar              AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp       AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp    AS airbyte_normalized_at,
        _airbyte_salesperson_hashid::varchar AS airbyte_salesperson_hashid
    FROM source
)

SELECT *
FROM final;
