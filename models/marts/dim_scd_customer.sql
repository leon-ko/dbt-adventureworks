{{ config(
    post_hook="INSERT INTO dim_scd_customer ( 
                    addressline1,
                    addressline2,
                    addresstype,
                    businessentity_id,
                    city,
                    countryregion_name,
                    demographics,
                    email_address,
                    email_promotion,
                    firstname,
                    lastname,
                    middlename,
                    phonenumber,
                    phonenumber_type,
                    postal_code,
                    stateprovincename,
                    suffix,
                    title,
                    dbt_scd_id,
                    dbt_updated_at,
                    dbt_valid_from,
                    dbt_valid_to)
               VALUES ('unknown',
                        'unknown',
                        'unknown',
                        0,
                        'unknown',
                        'unknown',
                        'unknown',
                        'unknown',
                        0,
                        'unknown',
                        'unknown',
                        'unknown',
                        0,
                        'unknown',
                        0,
                        'unknown',
                        'unknown',
                        'unknown',
                        0,
                        0,
                        0,
                        0)"
) }}

WITH scd_customer AS (
    SELECT * 
    FROM {{ ref('stg_shop_data__snapshot_customer') }}
),

final AS (
    SELECT
        addressline1       AS addressline1,
        addressline2       AS addressline2,
        addresstype        AS addresstype,
        businessentity_id  AS businessentity_id,
        city               AS city,
        countryregion_name AS countryregion_name,
        demographics       AS demographics,
        email_address      AS email_address,
        email_promotion    AS email_promotion,
        firstname          AS firstname,
        lastname           AS lastname,
        middlename         AS middlename,
        phonenumber        AS phonenumber,
        phonenumber_type   AS phonenumber_type,
        postal_code        AS postal_code,
        stateprovincename  AS stateprovincename,
        suffix             AS suffix,
        title              AS title,
        dbt_scd_id         AS dbt_scd_id,
        dbt_updated_at     AS dbt_updated_at,
        dbt_valid_from     AS dbt_valid_from,
        dbt_valid_to       AS dbt_valid_to

    FROM
        scd_customer
)

SELECT * 
FROM final;
