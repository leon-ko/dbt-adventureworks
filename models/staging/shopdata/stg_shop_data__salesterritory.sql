SELECT
    territoryid,
    name,
    countryregioncode
FROM
    {{source('adventure_works', 'salesterritory')}}