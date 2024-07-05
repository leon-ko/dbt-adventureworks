SELECT
    businessentityid,
    lastname,
    firstname,
    postalcode,
    city,
    countryregionname
FROM
    {{source('adventure_works', 'vindividualcustomer')}}


