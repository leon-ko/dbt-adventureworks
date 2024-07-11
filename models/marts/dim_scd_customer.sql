{{ config(
    post_hook="INSERT INTO dim_scd_customer ( 
                    ADDRESSLINE1,
                    ADDRESSLINE2,
                    ADDRESSTYPE,
                    BUSINESSENTITY_ID,
                    CITY,
                    COUNTRYREGION_NAME,
                    DEMOGRAPHICS,
                    EMAIL_ADDRESS,
                    EMAIL_PROMOTION,
                    FIRSTNAME,
                    LASTNAME,
                    MIDDLENAME,
                    PHONENUMBER,
                    PHONENUMBER_TYPE,
                    POSTAL_CODE,
                    STATEPROVINCENAME,
                    SUFFIX,
                    TITLE,
                    DBT_SCD_ID,
                    DBT_UPDATED_AT,
                    DBT_VALID_FROM,
                    DBT_VALID_TO)
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

with scd_customer as (
    select * from {{ref('stg_shop_data__snapshot_customer')}}
),

final as (

    select

        ADDRESSLINE1,
        ADDRESSLINE2,
        ADDRESSTYPE,
        BUSINESSENTITY_ID,
        CITY,
        COUNTRYREGION_NAME,
        DEMOGRAPHICS,
        EMAIL_ADDRESS,
        EMAIL_PROMOTION,
        FIRSTNAME,
        LASTNAME,
        MIDDLENAME,
        PHONENUMBER,
        PHONENUMBER_TYPE,
        POSTAL_CODE,
        STATEPROVINCENAME,
        SUFFIX,
        TITLE,
        DBT_SCD_ID,
        DBT_UPDATED_AT,
        DBT_VALID_FROM,
        DBT_VALID_TO

    from
        scd_customer   
         
)

select * from final

