WITH product_category AS (
    SELECT * 
    FROM {{ ref('stg_shop_data__productcategory') }}
),
final AS (
    SELECT    
        product_category.product_category_id   AS productcategory_id,
        product_category.product_category_name AS product_category_name
    FROM product_category
)
SELECT * 
FROM final;
