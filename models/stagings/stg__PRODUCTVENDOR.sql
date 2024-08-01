with
    PRODUCTVENDOR as (
    select 
        CAST(PRODUCTID AS NUMBER(38,0)) AS FK_product
	    , cast(BUSINESSENTITYID as number(38,0)) as FK_business
	    , AVERAGELEADTIME
	    , STANDARDPRICE 
	    , LASTRECEIPTCOST 
	    , cast(LASTRECEIPTDATE as date) as LASTRECEIPTDATE
	    , MINORDERQTY
	    , MAXORDERQTY
	    , ONORDERQTY
	    , UNITMEASURECODE 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTVENDOR') }}
    )

select *
from PRODUCTVENDOR