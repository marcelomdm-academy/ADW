WITH 
    PRODUCT AS (
        SELECT 
            CAST(PRODUCTID AS NUMBER(38,0)) AS PK_product
            , CAST(NAME AS VARCHAR) AS name_product
            , CAST(PRODUCTSUBCATEGORYID AS NUMBER(38,0)) AS FK_subcategory
            , CAST(PRODUCTMODELID AS NUMBER(38,0)) AS FK_model
            , PRODUCTNUMBER
            , MAKEFLAG
            , FINISHEDGOODSFLAG
            , COLOR
            , SAFETYSTOCKLEVEL
            , REORDERPOINT 
            , STANDARDCOST
            , LISTPRICE
            , SIZE
            , SIZEUNITMEASURECODE
            , WEIGHTUNITMEASURECODE
            , WEIGHT
            , DAYSTOMANUFACTURE
            , PRODUCTLINE
            , CLASS
            , STYLE
            , CAST(SELLSTARTDATE AS DATE) AS SELLSTARTDATE
            , CAST(SELLENDDATE AS DATE) AS SELLENDDATE
            , DISCONTINUEDDATE
            , ROWGUID
            , CAST(MODIFIEDDATE AS DATE) AS MODIFIEDDATE
        FROM {{ source('RAW_ADVENTURE_WORKS', 'PRODUCT') }}
    )

SELECT *
FROM PRODUCT
