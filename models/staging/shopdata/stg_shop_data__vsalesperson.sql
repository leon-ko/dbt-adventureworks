SELECT
    businessentityid,
    firstname,
    lastname,
    jobtitle,
    emailaddress,
    phonenumber,
    city,
    countryregionname,
    postalcode,
    territorygroup
FROM
    {{source('adventure_works', 'vsalesperson')}}


