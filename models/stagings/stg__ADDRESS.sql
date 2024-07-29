WITH 
    address AS (
        SELECT 
            CAST(ADDRESSID AS NUMBER(38,0)) AS PK_adress
            , ADDRESSLINE1
            , ADDRESSLINE2
            , CITY
            , CAST(MODIFIEDDATE AS DATE) AS MODIFIEDDATE
            , POSTALCODE
            , ROWGUID
            , SPATIALLOCATION
            , CAST(STATEPROVINCEID AS NUMBER(38,0)) AS FK_Stateprovince
        FROM {{ source('RAW_ADVENTURE_WORKS', 'ADDRESS') }}
    )

SELECT *
FROM address
