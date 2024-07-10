with customer as (

    select * from {{ref('stg_shop_data__customer')}}

),

individual_customer as (
    select * from {{ref('stg_shop_data__vindividualcustomer')}}
),

store as (
    select * from {{ref('stg_shop_data__store')}}
),

final as (
    select
        customer.customer_id                                                                                as customer_id,
        coalesce(customer.person_id, 0)                                                                     as person_id,
        coalesce(customer.store_id, 0)                                                                      as store_id,
        coalesce((concat(individual_customer.firstname, ' ', individual_customer.lastname)), 'unknown')     as full_name,
        coalesce(store.name, 'unknown')                                                                     as store_name,
        coalesce(individual_customer.demographics, 'unknown')                                               as demographics,
        coalesce(individual_customer.postal_code, 'unknown')                                                as postal_code

    from customer

    left join individual_customer on customer.customer_id = individual_customer.BUSINESSENTITY_ID
    left join store on customer.store_id = store.BUSINESSENTITY_ID
    
)

select * from final

