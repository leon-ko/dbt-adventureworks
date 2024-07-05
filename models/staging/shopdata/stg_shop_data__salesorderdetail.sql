SELECT
    salesorderid,
    salesorderdetailid,
    productid,
    orderqty,
    unitprice,
    unitpricediscount,
    linetotal, 
FROM 
    {{source('adventure_works', 'salesorderdetail')}}