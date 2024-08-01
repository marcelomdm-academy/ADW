with
    PURCHASEORDERDETAIL as (
    select 
        cast("purchaseorderdetailid" as number(38,0)) as PK_purchase_od
	    , cast("purchaseorderid" as number(38,0)) as FK_purchase 
	    , cast("duedate" as date) as duedate
        , cast("productid" as number(38,0)) as FK_product
	    , "orderqty" 
	    , "unitprice"
	    , "receivedqty" 
	    , "rejectedqty" 
	    , cast("modifieddate" as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'PURCHASEORDERDETAIL') }}
    )

select *
from PURCHASEORDERDETAIL