{{ config(
    post_hook="INSERT INTO dim_salesperson (salesperson_id, bonus, sales_ytd, sales_last_year, firstname, lastname, postal_code, phonenumber, email_address, jobtitle)
               VALUES (0, 0, 0, 0, 'unknown', 'unknown', 0, 0, 'unknown', 'unknown')"
) }}

with salesperson as (
    select * from {{ ref("stg_shop_data_salesperson") }}
),

vsalesperson as (
    select * from {{ ref("stg_shop_data__vsalesperson") }}
),

final as (
    select 
        salesperson.salesperson_id                                  as salesperson_id,
        salesperson.bonus                                           as bonus,
        salesperson.sales_ytd                                       as sales_ytd,
        salesperson.sales_last_year                                 as sales_last_year,
        vsalesperson.firstname                                      as firstname,
        vsalesperson.lastname                                       as lastname,
        concat(vsalesperson.firstname, ' ', vsalesperson.lastname)  as full_name,
        vsalesperson.postal_code                                    as postal_code,
        vsalesperson.phonenumber                                    as phonenumber,
        vsalesperson.email_address                                  as email_address,
        vsalesperson.jobtitle                                       as jobtitle

    from salesperson

    left join vsalesperson on salesperson.salesperson_id = vsalesperson.businessentity_id
)

select * from final
