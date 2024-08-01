WITH 
    city as (
        SELECT *
        FROM {{ ref('stg__ADDRESS') }}
    )

    , state as (
        SELECT *
        FROM {{ ref('stg__STATEPROVINCE') }}
    )

    , country as (
        SELECT *
        FROM {{ ref('stg__COUNTRYREGION') }}
    )


    , int_address as (
        SELECT
            city.PK_address
            , state.PK_Stateprovince
            , country.PK_countryregion
            , state.FK_countryregion
            , city.CITY
            , state.Name_State 
            , country.Name_Country
            , city.MODIFIEDDATE
            , city.POSTALCODE
            , city.ROWGUID
            , city.SPATIALLOCATION
            , state.STATEPROVINCECODE 
            , state.ISONLYSTATEPROVINCEFLAG 
            , state.ROWGUID_state
            , state.TERRITORYID 
        FROM city
        LEFT JOIN state
            ON city.FK_Stateprovince = state.PK_Stateprovince
        LEFT JOIN country  
            ON state.FK_countryregion = country.PK_countryregion
    )

SELECT *
FROM int_address

