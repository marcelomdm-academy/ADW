with
    PERSONCREDITCARD as (
    select 
        cast(BUSINESSENTITYID as number(38,0)) as FK_business 
	    , CREDITCARDID 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PERSONCREDITCARD') }}  
    )

select *
from PERSONCREDITCARD