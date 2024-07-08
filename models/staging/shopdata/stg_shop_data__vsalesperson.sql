WITH source AS (

    SELECT *
    FROM {{source('adventure_works', 'vsalesperson')}}

), renamed AS (

    SELECT
        ADDRESSLINE1::VARCHAR                          AS ADDRESSLINE1,
        ADDRESSLINE2::VARCHAR                          AS ADDRESSLINE2,
        BUSINESSENTITYID::NUMBER                       AS BUSINESSENTITY_ID,
        CITY::VARCHAR                                  AS CITY,
        COUNTRYREGIONNAME::VARCHAR                     AS COUNTRYREGION_NAME,
        EMAILADDRESS::VARCHAR                          AS EMAIL_ADDRESS,
        EMAILPROMOTION::NUMBER                         AS EMAIL_PROMOTION,
        FIRSTNAME::VARCHAR                             AS FIRSTNAME,
        JOBTITLE::VARCHAR                              AS JOBTITLE,
        LASTNAME::VARCHAR                              AS LASTNAME,
        MIDDLENAME::VARCHAR                            AS MIDDLENAME,
        PHONENUMBER::VARCHAR                           AS PHONENUMBER,
        PHONENUMBERTYPE::VARCHAR                       AS PHONENUMBERTYPE,
        POSTALCODE::VARCHAR                            AS POSTAL_CODE,
        SALESLASTYEAR::FLOAT                           AS SALES_LAST_YEAR,
        SALESQUOTA::FLOAT                              AS SALESQUOTA,
        SALESYTD::FLOAT                                AS SALES_YTD,
        STATEPROVINCENAME::VARCHAR                     AS STATE_PROVINCE_NAME,
        SUFFIX::VARCHAR                                AS SUFFIX,
        TERRITORYGROUP::VARCHAR                        AS TERRITORY_GROUP,
        TERRITORYNAME::VARCHAR                         AS TERRITORY_NAME,
        TITLE::VARCHAR                                 AS TITLE,
        _AIRBYTE_AB_ID::VARCHAR                        AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP                 AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP              AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_VSALESPERSON_HASHID::VARCHAR          AS AIRBYTE_VSALESPERSON_HASHID

    FROM source

)

SELECT *
FROM renamed



