with product_category as (
    select * from {{ref('stg_shop_data__productcategory')}}
),
final as (
    select    
        product_category.product_category_id        as productcategory_id,
        product_category.product_category_name      as product_category_name
    from product_category
     
)
select * from final