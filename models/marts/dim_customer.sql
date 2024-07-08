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
        customer.customer_id,
        coalesce(customer.person_id, 0) AS person_id,
        coalesce(customer.store_id, 0) AS store_id,
        coalesce((concat(individual_customer.firstname, ' ', individual_customer.lastname)), 'unknown') AS full_name,
        coalesce(store.name, 'unknown') AS store_name,
        coalesce(individual_customer.demographics, 'unknown') AS demographics,
        coalesce(individual_customer.postal_code, 'unknown') AS postal_code

    from customer

    left join individual_customer on customer.customer_id = individual_customer.BUSINESSENTITY_ID
    left join store on customer.customer_id = store.BUSINESSENTITY_ID
    
)

select * from final

