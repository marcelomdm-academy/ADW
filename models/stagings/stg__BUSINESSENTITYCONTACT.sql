with
    BUSINESSENTITYCONTACT as (
    select 
         cast(BUSINESSENTITYID as number(38,0)) as FK_business
        , cast(CONTACTTYPEID as number(38,0)) as FK_contact 
        , cast(PERSONID as number(38,0)) as FK_Person
        , cast(MODIFIEDDATE as date) as MODIFIEDDATE
        , cast (ROWGUID as varchar(16777216))  as ROWGUID_Business   
    from {{ source('RAW_ADVENTURE_WORKS', 'BUSINESSENTITYCONTACT') }}
    )

select *
from BUSINESSENTITYCONTACT