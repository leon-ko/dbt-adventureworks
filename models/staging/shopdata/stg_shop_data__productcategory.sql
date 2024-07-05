SELECT
    productcategoryid,
    name
FROM
    {{source('adventure_works', 'productcategory')}}