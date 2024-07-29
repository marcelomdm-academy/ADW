with
    SALESREASON as (
    select 
        cast(SALESREASONID as number) as PK_salesreason
	    , cast(NAME as varchar) as reason
	    , REASONTYPE 
	    , cast(MODIFIEDDATE as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESREASON') }}
    )

select *
from SALESREASON