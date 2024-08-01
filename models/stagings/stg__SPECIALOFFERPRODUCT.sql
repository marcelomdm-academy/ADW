with
    SPECIALOFFERPRODUCT as (
    select 
        CAST(SPECIALOFFERID AS NUMBER(38,0)) AS specialoffer  
	    , CAST(PRODUCTID AS NUMBER(38,0)) AS FK_product 
	    , ROWGUID
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'SPECIALOFFERPRODUCT') }}
    )

select *
from SPECIALOFFERPRODUCT