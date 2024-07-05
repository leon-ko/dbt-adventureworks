SELECT
    salesreasonid,
    name,
    reasontype
FROM
    {{source('adventure_works', 'salesreason')}}
    