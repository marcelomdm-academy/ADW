WITH 
    address as (
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

    , salesorder as (
        select *
        from {{ ref('stg__SALESORDERHEADER') }}
    )

    , territory as (
        select*
        from {{ ref('stg__SALESTERRITORY') }}

    )

    , join_sales_address  as (
        select
            salesorder.PK_order 
	        , salesorder.FK_shipaddress
            , address.PK_address
            , address.FK_Stateprovince
            , address.CITY
        from salesorder
        left join address
                on salesorder.FK_shipaddress = address.PK_address
    )

     , join_state as (
        select
            join_sales_address.PK_order 
            , join_sales_address.PK_address
            , join_sales_address.city
            , state.name_state
            , state.FK_countryregion
            , state.FK_territory
        from join_sales_address
        left join state 
            on join_sales_address.FK_Stateprovince = state.PK_Stateprovince
     )

     ,  join_country_territory as (
        select
            join_state.PK_address
            , join_state.city
            , join_state.name_state
            , country.name_country
            , territory.name_territory
        from join_state
        left join country 
                on join_state.FK_countryregion = country.PK_countryregion
        left join territory
                on join_state.FK_territory = territory.PK_territory
     )

    select *
    from join_country_territory 