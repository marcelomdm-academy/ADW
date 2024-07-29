WITH 
    countryregion AS (
        SELECT 
            CAST(COUNTRYREGIONCODE AS VARCHAR(16777216)) AS PK_countryregion
            , CAST(MODIFIEDDATE AS DATE) AS MODIFIEDDATE
            , CAST(name AS VARCHAR(16777216)) AS Name_Country     
        FROM {{ source('RAW_ADVENTURE_WORKS', 'COUNTRYREGION') }}
    )

SELECT *
FROM countryregion
