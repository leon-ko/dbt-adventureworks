SELECT
    productsubcategoryid,
    name
FROM
    {{source('adventure_works', 'productsubcategory')}}