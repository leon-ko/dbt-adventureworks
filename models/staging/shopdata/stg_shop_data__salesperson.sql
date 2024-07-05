SELECT
    businessentityid,
    bonus,
    salesytd,
    salesquota,
    saleslastyear,
    territoryid
FROM
    {{source('adventure_works', 'salesperson')}}
