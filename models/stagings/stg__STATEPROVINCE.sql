WITH 
    stateprovince AS (
        SELECT 
            CAST(STATEPROVINCEID AS NUMBER(38,0)) AS PK_Stateprovince
            , cast(TERRITORYID as number(38,0)) as FK_territory
            , STATEPROVINCECODE
            , CAST(COUNTRYREGIONCODE AS VARCHAR(16777216)) AS FK_countryregion
            , ISONLYSTATEPROVINCEFLAG
            , CAST(name AS VARCHAR(16777216)) AS Name_State
            , CAST(ROWGUID AS VARCHAR(16777216)) AS ROWGUID_state
            , CAST(MODIFIEDDATE AS DATE) AS modifieddate
        FROM {{ source('RAW_ADVENTURE_WORKS', 'STATEPROVINCE') }}
    )

SELECT *
FROM stateprovince
