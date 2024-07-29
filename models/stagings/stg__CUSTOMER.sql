with
    CUSTOMER as (
    select
        ACCOUNTNUMBER
        , CAST (CUSTOMERID as number(38,0)) as PK_customer
        , cast(MODIFIEDDATE as date) as MODIFIEDDATE
        , PERSONID
        , cast(ROWGUID as varchar) as rowguid_customer
        , STOREID
        , TERRITORYID 
    from {{ source('RAW_ADVENTURE_WORKS', 'CUSTOMER') }}
    )

select *
from CUSTOMER