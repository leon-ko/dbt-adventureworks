WITH customer AS (
    SELECT *
    FROM {{ ref('stg_shop_data__customer') }}
),

individual_customer AS (
    SELECT *
    FROM {{ ref('stg_shop_data__vindividualcustomer') }}
),

store AS (
    SELECT *
    FROM {{ ref('stg_shop_data__store') }}
),

final AS (
    SELECT
        customer.customer_id                                                                          AS customer_id,
        COALESCE(customer.person_id, 0)                                                               AS person_id,
        COALESCE(customer.store_id, 0)                                                                AS store_id,
        COALESCE(CONCAT(individual_customer.firstname, ' ', individual_customer.lastname), 'unknown') AS full_name,
        COALESCE(store.name, 'unknown')                                                               AS store_name,
        COALESCE(individual_customer.demographics, 'unknown')                                         AS demographics,
        COALESCE(individual_customer.postal_code, 'unknown')                                          AS postal_code
    FROM customer
    LEFT JOIN individual_customer
        ON customer.customer_id = individual_customer.businessentity_id
    LEFT JOIN store
        ON customer.store_id = store.businessentity_id
)

SELECT *
FROM final;

