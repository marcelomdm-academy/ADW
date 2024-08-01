with
    PRODUCTDOCUMENT as (
    select 
        PRODUCTID
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
	    , DOCUMENTNODE
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTDOCUMENT') }}
    )

select *
from PRODUCTDOCUMENT