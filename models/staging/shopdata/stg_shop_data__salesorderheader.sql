SELECT 
    salesorderid,
    customerid,
    duedate,
    orderdate,
    shipdate,
    subtotal,
    totaldue,
    territoryid,
    salespersonid
FROM
    {{source('adventure_works', 'salesorderheader')}}