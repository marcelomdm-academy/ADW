with
    PRODUCTINVENTORY as (
    select
        CAST(PRODUCTID AS NUMBER(38,0)) AS FK_product 
	    , CAST(LOCATIONID AS NUMBER(38,0)) AS FK_location
	    , SHELF 
	    , BIN 
	    , QUANTITY 
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTINVENTORY') }}
    )

select *
from PRODUCTINVENTORY