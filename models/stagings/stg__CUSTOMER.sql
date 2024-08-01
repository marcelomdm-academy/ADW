with
    CUSTOMER as (
    select
        cast (CUSTOMERID as number(38,0)) as PK_customer
        , cast(PERSONID as number(38,0)) as FK_person
        , STOREID
        , TERRITORYID 
        , ACCOUNTNUMBER
        , cast(MODIFIEDDATE as date) as MODIFIEDDATE
        , cast(ROWGUID as varchar) as rowguid_customer
    from {{ source('RAW_ADVENTURE_WORKS', 'CUSTOMER') }}
    )

select *
from CUSTOMER