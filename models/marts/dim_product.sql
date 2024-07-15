WITH product AS (
    SELECT *
    FROM {{ ref('stg_shop_data__product') }}
),

product_category AS (
    SELECT *
    FROM {{ ref('stg_shop_data__productcategory') }}
),

product_subcategory AS (
    SELECT *
    FROM {{ ref('stg_shop_data__productsubcategoryid') }}
),

final AS (
    SELECT
        product.product_name                                              AS product_name,
        COALESCE(product.product_size, 'unknown')                         AS product_size,
        COALESCE(product.product_class, 'unknown')                        AS product_class,
        COALESCE(product.product_color, 'unknown')                        AS product_color,
        COALESCE(product.product_style, 'unknown')                        AS product_style,
        COALESCE(product.product_weight, 0)                               AS product_weight,
        COALESCE(product.list_price, 0)                                   AS list_price,
        product.product_id                                                AS product_id,
        COALESCE(product.product_line, 'unknown')                         AS product_line,
        COALESCE(product_subcategory.product_subcategory_id, 0)           AS productsubcategory_id,
        COALESCE(product_subcategory.product_subcategory_name, 'unknown') AS productsubcategory_name,
        COALESCE(product_category.product_category_id, 0)                 AS productcategory_id,
        COALESCE(product_category.product_category_name, 'unknown')       AS productcategory_name

    FROM product

    LEFT JOIN product_subcategory
        ON product.product_subcategory_id = product_subcategory.product_subcategory_id
    LEFT JOIN product_category
        ON product_subcategory.product_category_id = product_category.product_category_id
)

SELECT * 
FROM final;