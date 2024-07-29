with
    STORE as (
    select 
        cast(BUSINESSENTITYID as number(38,0)) as fK_business
	    , NAME 
	    , SALESPERSONID
	    , DEMOGRAPHICS 
	    , ROWGUID
        , cast(MODIFIEDDATE as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'STORE') }}
    )

select *
from STORE