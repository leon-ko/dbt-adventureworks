WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'vsalesperson') }}
),

final AS (
    SELECT
        addressline1::varchar                 AS addressline1,
        addressline2::varchar                 AS addressline2,
        businessentityid::number              AS businessentity_id,
        city::varchar                         AS city,
        countryregionname::varchar            AS countryregion_name,
        emailaddress::varchar                 AS email_address,
        emailpromotion::number                AS email_promotion,
        firstname::varchar                    AS firstname,
        jobtitle::varchar                     AS jobtitle,
        lastname::varchar                     AS lastname,
        middlename::varchar                   AS middlename,
        phonenumber::varchar                  AS phonenumber,
        phonenumbertype::varchar              AS phonenumbertype,
        postalcode::varchar                   AS postal_code,
        saleslastyear::float                  AS sales_last_year,
        salesquota::float                     AS salesquota,
        salesytd::float                       AS sales_ytd,
        stateprovincename::varchar            AS state_province_name,
        suffix::varchar                       AS suffix,
        territorygroup::varchar               AS territory_group,
        territoryname::varchar                AS territory_name,
        title::varchar                        AS title,
        _airbyte_ab_id::varchar               AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp        AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp     AS airbyte_normalized_at,
        _airbyte_vsalesperson_hashid::varchar AS airbyte_vsalesperson_hashid
    FROM source
)

SELECT *
FROM final;
