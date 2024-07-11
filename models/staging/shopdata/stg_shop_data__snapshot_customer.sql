WITH source AS (

    SELECT *
    FROM {{ref('snapshot_vindividualcustomer')}}

), renamed AS (

    SELECT
        ADDRESSLINE1::VARCHAR                               AS ADDRESSLINE1,
        ADDRESSLINE2::VARCHAR                               AS ADDRESSLINE2,
        ADDRESSTYPE::VARCHAR                                AS ADDRESSTYPE,
        BUSINESSENTITYID::NUMBER                            AS BUSINESSENTITY_ID,
        CITY::VARCHAR                                       AS CITY,
        COUNTRYREGIONNAME::VARCHAR                          AS COUNTRYREGION_NAME,
        DEMOGRAPHICS::VARCHAR                               AS DEMOGRAPHICS,
        EMAILADDRESS::VARCHAR                               AS EMAIL_ADDRESS,
        EMAILPROMOTION::NUMBER                              AS EMAIL_PROMOTION,
        FIRSTNAME::VARCHAR                                  AS FIRSTNAME,
        LASTNAME::VARCHAR                                   AS LASTNAME,
        MIDDLENAME::VARCHAR                                 AS MIDDLENAME,
        PHONENUMBER::VARCHAR                                AS PHONENUMBER,
        PHONENUMBERTYPE::VARCHAR                            AS PHONENUMBER_TYPE,
        POSTALCODE::VARCHAR                                 AS POSTAL_CODE,
        STATEPROVINCENAME::VARCHAR                          AS STATEPROVINCENAME,
        SUFFIX::VARCHAR                                     AS SUFFIX,
        TITLE::VARCHAR                                      AS TITLE,
        _AIRBYTE_AB_ID::VARCHAR                             AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP                      AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP                   AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_VINDIVIDUALCUSTOMER_HASHID::VARCHAR        AS AIRBYTE_VINDIVIDUALCUSTOMER_HASHID,
        DBT_SCD_ID::VARCHAR                                 AS DBT_SCD_ID,
        to_char(to_timestamp(DBT_UPDATED_AT), 'YYYYMMDD')   AS DBT_UPDATED_AT,
        to_char(to_timestamp(DBT_VALID_FROM), 'YYYYMMDD')   AS DBT_VALID_FROM,
        to_char(to_timestamp(DBT_VALID_TO), 'YYYYMMDD')     AS DBT_VALID_TO
    FROM source
)

SELECT *
FROM renamed
