WITH 
    address AS (
        SELECT *
        FROM {{ ref('stg__ADDRESS') }}
    )

    , state AS (
        SELECT *
        FROM {{ ref('stg__STATEPROVINCE') }}
    )

    , country AS (
        SELECT *
        FROM {{ ref('stg__COUNTRYREGION') }}
    )

    , territory as (
        select *
        from {{ ref('stg__SALESTERRITORY') }}
    )

    , dim_address AS (
        SELECT
            address.PK_address
            , state.PK_Stateprovince
            , country.PK_countryregion
            , state.FK_countryregion
            , address.ADDRESSLINE1
            , address.ADDRESSLINE2
            , address.CITY
            , address.MODIFIEDDATE
            , address.POSTALCODE
            , address.ROWGUID
            , address.SPATIALLOCATION
            , state.STATEPROVINCECODE 
            , state.ISONLYSTATEPROVINCEFLAG 
            , state.Name_State 
            , state.TERRITORYID 
            , state.ROWGUID_state
            , country.Name_Country
        FROM state
        LEFT JOIN address
            ON state.PK_Stateprovince = address.FK_Stateprovince
        LEFT JOIN country  
            ON state.FK_countryregion = country.PK_countryregion
    )

SELECT *
FROM dim_address
