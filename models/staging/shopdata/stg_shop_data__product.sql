SELECT
    productid,
    name,
    size,
    class,
    color,
    productsubcategoryid
FROM
    {{source('adventure_works', 'product')}}
