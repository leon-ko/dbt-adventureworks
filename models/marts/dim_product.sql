with product as (
    select * from {{ref('stg_shop_data__product')}}
),

product_category as (
    select * from {{ref('stg_shop_data__productcategory')}}
),

product_subcategory as (
    select * from {{ref('stg_shop_data__productsubcategoryid')}}
),

final as (
    select
        product.product_name                                                as product_name,
        coalesce(product.product_size, 'unknown')                           as product_size,
        coalesce(product.product_class,'unknown')                           as product_class,
        coalesce(product.product_color,'unknown')                           as product_color,
        coalesce(product.product_style,'unknown')                           as product_style,
        coalesce(product.product_weight, 0)                                 as product_weight,
        coalesce(product.list_price, 0)                                     as list_price,
        product.product_id                                                  as product_id,
        coalesce(product.product_line, 'unknown')                           as product_line,
        coalesce(product_subcategory.product_subcategory_id, 0)             as productsubcategory_id,
        coalesce(product_subcategory.product_subcategory_name, 'unknown')   as productsubcategory_name,
        coalesce(product_category.product_category_id, 0)                   as productcategory_id,
        coalesce(product_category.product_category_name, 'unknown')         as productcategory_name

    from product

    left join product_subcategory on product.product_subcategory_id = product_subcategory.product_subcategory_id
    left join product_category on product_subcategory.product_category_id = product_category.product_category_id
)

select * from final


