with salesperson as (
    select * from {{ref("stg_shop_data_salesperson")}}
),

vsalesperson as(
    select * from {{ref("stg_shop_data__vsalesperson")}}
),

final as (
    select 
        salesperson.salesperson_id,
        salesperson.bonus,
        salesperson.sales_ytd,
        salesperson.sales_last_year,
        vsalesperson.firstname,
        vsalesperson.lastname,
        vsalesperson.postal_code,
        vsalesperson.phonenumber,
        vsalesperson.email_address,
        vsalesperson.jobtitle

    from salesperson

    left join vsalesperson on salesperson.salesperson_id = vsalesperson.businessentity_id
)

select * from final