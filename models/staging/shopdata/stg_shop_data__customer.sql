WITH source AS (
    SELECT *
    FROM {{ source('dbt_lk', 'source_customer') }}
),

renamed AS (
    SELECT
        accountnumber::varchar            AS account_number,
        customerid::number                AS customer_id,
        modifieddate::varchar             AS modified_date,
        personid::varchar                 AS person_id,
        rowguid::varchar                  AS row_id,
        storeid::number                   AS store_id,
        territoryid::number               AS territory_id,
        _airbyte_ab_id::varchar           AS airbyte_ab_id,
        _airbyte_customer_hashid::varchar AS airbyte_customer_hashid,
        _airbyte_emitted_at::timestamp    AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp AS airbyte_normalized_at
    FROM source
)

SELECT *
FROM renamed;