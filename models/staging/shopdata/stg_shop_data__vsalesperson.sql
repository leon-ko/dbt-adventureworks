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
        EMAILADDRESS::VARCHAR                          AS EMAILADDRESS,
        EMAILPROMOTION::NUMBER                         AS EMAILPROMOTION,
        FIRSTNAME::VARCHAR                             AS FIRSTNAME,
        JOBTITLE::VARCHAR                              AS JOBTITLE,
        LASTNAME::VARCHAR                              AS LASTNAME,
        MIDDLENAME::VARCHAR                            AS MIDDLENAME,
        PHONENUMBER::VARCHAR                           AS PHONENUMBER,
        PHONENUMBERTYPE::VARCHAR                       AS PHONENUMBERTYPE,
        POSTALCODE::VARCHAR                            AS POSTALCODE,
        SALESLASTYEAR::FLOAT                           AS SALESLASTYEAR,
        SALESQUOTA::FLOAT                              AS SALESQUOTA,
        SALESYTD::FLOAT                                AS SALESYTD,
        STATEPROVINCENAME::VARCHAR                     AS STATEPROVINCENAME,
        SUFFIX::VARCHAR                                AS SUFFIX,
        TERRITORYGROUP::VARCHAR                        AS TERRITORGROUP,
        TERRITORYNAME::VARCHAR                         AS TERRITORYNAME,
        TITLE::VARCHAR                                 AS TITLE,
        _AIRBYTE_AB_ID::VARCHAR                        AS AIRBYTE_AB_ID,
        _AIRBYTE_EMITTED_AT::TIMESTAMP                 AS AIRBYTE_EMITTED_HASHID,
        _AIRBYTE_NORMALIZED_AT::TIMESTAMP              AS AIRBYTE_NORMALIZED_AT,
        _AIRBYTE_VSALESPERSON_HASHID::VARCHAR          AS AIRBYTE_VSALESPERSON_HASHID

    FROM source

)

SELECT *
FROM renamed



