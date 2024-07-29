with
    PRODUCTLISTPRICEHISTORY as (
    select 
        cast(PRODUCTID as number(38,0)) as FK_product
	    , cast(STARTDATE as date) as startdate
	    , cast(ENDDATE as date) as enddate
	    , LISTPRICE
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTLISTPRICEHISTORY') }}
    )

select *
from PRODUCTLISTPRICEHISTORY