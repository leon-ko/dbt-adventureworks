{{ config(
    post_hook="INSERT INTO dim_salesperson (salesperson_id, bonus, sales_ytd, sales_last_year, firstname, lastname, postal_code, phonenumber, email_address, jobtitle)
               VALUES (0, 0, 0, 0, 'unknown', 'unknown', 0, 0, 'unknown', 'unknown')"
) }}

WITH salesperson AS (
    SELECT * 
    FROM {{ ref("stg_shop_data_salesperson") }}
),

vsalesperson AS (
    SELECT * 
    FROM {{ ref("stg_shop_data__vsalesperson") }}
),

final AS (
    SELECT 
        salesperson.salesperson_id                                 AS salesperson_id,
        salesperson.bonus                                          AS bonus,
        salesperson.sales_ytd                                      AS sales_ytd,
        salesperson.sales_last_year                                AS sales_last_year,
        vsalesperson.firstname                                     AS firstname,
        vsalesperson.lastname                                      AS lastname,
        CONCAT(vsalesperson.firstname, ' ', vsalesperson.lastname) AS full_name,
        vsalesperson.postal_code                                   AS postal_code,
        vsalesperson.phonenumber                                   AS phonenumber,
        vsalesperson.email_address                                 AS email_address,
        vsalesperson.jobtitle                                      AS jobtitle

    FROM salesperson

    LEFT JOIN vsalesperson 
        ON salesperson.salesperson_id = vsalesperson.businessentity_id
)

SELECT * 
FROM final;
