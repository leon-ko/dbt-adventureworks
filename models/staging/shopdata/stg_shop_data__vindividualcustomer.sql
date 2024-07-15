WITH source AS (
    SELECT *
    FROM {{ source('dbt_lk', 'source_vindividualcustomer') }}
), 

final AS (
    SELECT
        addressline1::varchar                        AS addressline1,
        addressline2::varchar                        AS addressline2,
        addresstype::varchar                         AS addresstype,
        businessentityid::number                     AS businessentity_id,
        city::varchar                                AS city,
        countryregionname::varchar                   AS countryregion_name,
        demographics::varchar                        AS demographics,
        emailaddress::varchar                        AS email_address,
        emailpromotion::number                       AS email_promotion,
        firstname::varchar                           AS firstname,
        lastname::varchar                            AS lastname,
        middlename::varchar                          AS middlename,
        phonenumber::varchar                         AS phonenumber,
        phonenumbertype::varchar                     AS phonenumber_type,
        postalcode::varchar                          AS postal_code,
        stateprovincename::varchar                   AS stateprovincename,
        suffix::varchar                              AS suffix,
        title::varchar                               AS title,
        _airbyte_ab_id::varchar                      AS airbyte_ab_id,
        _airbyte_emitted_at::timestamp               AS airbyte_emitted_hashid,
        _airbyte_normalized_at::timestamp            AS airbyte_normalized_at,
        _airbyte_vindividualcustomer_hashid::varchar AS airbyte_vindividualcustomer_hashid
    FROM source
    WHERE addresstype = 'Home'
)

SELECT *
FROM final;
