with
    PRODUCTMODEL as (
    select 
        CAST(PRODUCTMODELID AS NUMBER(38,0)) AS PK_product_model 
	    , NAME 
	    , CATALOGDESCRIPTION 
	    , INSTRUCTIONS 
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTMODEL') }}
    )

select *
from PRODUCTMODEL