with
    SALESORDERHEADERSALESREASON as (
    select 
        cast(SALESORDERID as number(38,0)) as FK_order 
	    , cast(SALESREASONID as number(38,0)) as FK_salesreason 
	    , cast(MODIFIEDDATE as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESORDERHEADERSALESREASON') }}
    )

select *
from SALESORDERHEADERSALESREASON