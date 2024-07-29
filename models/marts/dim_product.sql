WITH 
    product AS (
        SELECT *
        FROM {{ ref('stg__PRODUCT') }}
    )

    , category AS (
        SELECT *
        FROM {{ ref('stg__PRODUCTCATEGORY') }}
    )

    , subcategory AS (
        SELECT *
        FROM {{ ref('stg__PRODUCTSUBCATEGORY') }}
    )

    , price AS (
        SELECT *
        FROM {{ ref('stg__PRODUCTLISTPRICEHISTORY') }}
    )

    , dim_product AS (
        SELECT
            product.PK_product
            , category.PK_category
            , subcategory.PK_subcategory
            , subcategory.FK_category
            , product.FK_model
            , product.name_product
            , category.name_category
            , subcategory.name_subcategory
            , product.PRODUCTNUMBER
            , product.MAKEFLAG
            , product.FINISHEDGOODSFLAG
            , product.COLOR
            , product.SAFETYSTOCKLEVEL
            , product.REORDERPOINT
            , product.STANDARDCOST
            , product.LISTPRICE
            , product.SIZE
            , product.SIZEUNITMEASURECODE
            , product.WEIGHTUNITMEASURECODE
            , product.WEIGHT
            , product.DAYSTOMANUFACTURE
            , product.PRODUCTLINE
            , product.CLASS
            , product.STYLE
            , product.SELLSTARTDATE
            , product.SELLENDDATE
            , product.DISCONTINUEDDATE
            , product.ROWGUID
            , product.MODIFIEDDATE
            , price.startdate
            , price.enddate
            , CAST(price.LISTPRICE AS FLOAT) AS Listprice2
        FROM product
        LEFT JOIN subcategory
            ON product.FK_subcategory = subcategory.PK_subcategory
        LEFT JOIN category
            ON subcategory.FK_category = category.PK_category
        LEFT JOIN price
            ON product.PK_product = price.FK_product
    )

SELECT *
FROM dim_product
