WITH salesreason AS (
    SELECT 
        salesreason_name AS salesreason_name,
        reason_type      AS reason_type,
        salesreason_id   AS salesreason_id
    FROM 
        {{ ref('stg_shop_data__salesreason') }}
)

SELECT * 
FROM salesreason;
