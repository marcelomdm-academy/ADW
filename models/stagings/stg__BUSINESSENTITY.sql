with
    BUSINESS_ENTITY as (
    select 
        cast(BUSINESSENTITYID as number(38,0)) as PK_business
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'BUSINESSENTITY') }}
    )

select *
from BUSINESS_ENTITY