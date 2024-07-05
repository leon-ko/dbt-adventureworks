SELECT 
    salesorderid,
    salesreasonid
FROM
    {{source('adventure_works', 'salesorderheadersalesreason')}}