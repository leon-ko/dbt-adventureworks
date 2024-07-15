WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'salesterritory') }}
),

final AS (
    SELECT
        countryregioncode::varchar              AS country_region_code,
        modifieddate::varchar                   AS modified_date,
        "group"::varchar                        AS sales_territory_group,
        name::varchar                           AS sales_territory_name,
        rowguid::varchar                        AS row_id,
        saleslastyear::float                    AS sales_last_year,
        salesytd::float                         AS sales_ytd,
        territoryid::number                     AS sales_territory_id,
        _airbyte_ab_id::varchar                 AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp          AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp       AS airbyte_normalized_at,
        _airbyte_salesterritory_hashid::varchar AS airbyte_salesterritory_hashid
    FROM source
)

SELECT *
FROM final;
