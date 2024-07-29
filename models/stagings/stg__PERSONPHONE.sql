with
    PERSONPHONE as (
    select 
        cast(BUSINESSENTITYID as number(38,0)) as FK_business
        , cast(PHONENUMBERTYPEID as number(38,0)) as FK_phone 
	    , PHONENUMBER 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    
    from {{ source('RAW_ADVENTURE_WORKS', 'PERSONPHONE') }}
    )

select *
from PERSONPHONE