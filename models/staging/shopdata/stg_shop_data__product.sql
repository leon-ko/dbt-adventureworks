WITH source AS (
    SELECT *
    FROM {{ source('adventure_works', 'product') }}
),

renamed AS (
    SELECT
        class::VARCHAR                    AS product_class,
        color::VARCHAR                    AS product_color,
        daystomanufacture::NUMBER         AS days_to_manufacture,
        discontinueddate::VARCHAR         AS discontinued_date,
        finishedgoodsflag::BOOLEAN        AS finished_goods_flag,
        listprice::FLOAT                  AS list_price,
        makeflag::BOOLEAN                 AS make_flag,
        modifieddate::VARCHAR             AS modified_date,
        name::VARCHAR                     AS product_name,
        productid::NUMBER                 AS product_id,
        productline::VARCHAR              AS product_line,
        productmodelid::NUMBER            AS productmodel_id,
        productnumber::VARCHAR            AS product_number,
        productsubcategoryid::NUMBER      AS product_subcategory_id,
        reorderpoint::NUMBER              AS reorder_point,
        rowguid::VARCHAR                  AS row_id,
        safetystocklevel::NUMBER          AS safety_stock_level,
        sellenddate::VARCHAR              AS sell_end_date,
        sellstartdate::VARCHAR            AS sell_start_date,
        size::VARCHAR                     AS product_size,
        sizeunitmeasurecode::VARCHAR      AS size_unit_measure_code,
        standardcost::FLOAT               AS standard_cost,
        style::VARCHAR                    AS product_style,
        weight::FLOAT                     AS product_weight,
        weightunitmeasurecode::VARCHAR    AS weight_unit_measure_code,
        _airbyte_ab_id::VARCHAR           AS airbyte_ab_id,
        _airbyte_emitted_at::TIMESTAMP    AS airbyte_emitted_at,
        _airbyte_normalized_at::TIMESTAMP AS airbyte_normalized_at,
        _airbyte_product_hashid::VARCHAR  AS airbyte_product_hashid
    FROM source
)

SELECT *
FROM renamed;
