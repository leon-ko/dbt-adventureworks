WITH salesterritory AS (
    SELECT
        sales_territory_id    AS territory_id,
        sales_territory_name  AS salesterritory_name,
        sales_territory_group AS salesterritory_group,
        country_region_code   AS country_region_code
    FROM 
        {{ ref('stg_shop_data__salesterritory') }}
)

SELECT * 
FROM salesterritory;
