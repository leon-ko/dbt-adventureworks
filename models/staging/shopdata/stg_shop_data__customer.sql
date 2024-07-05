SELECT
    customerid,
    storeid,
    personid,
    territoryid
FROM
    {{source('adventure_works', 'customer')}}