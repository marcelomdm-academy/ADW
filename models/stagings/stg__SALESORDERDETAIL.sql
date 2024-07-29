with
    SALESORDERDETAIL as (
    select 
        cast(SALESORDERDETAILID as number) as PK_orderdetail
        , cast(SALESORDERID as number) as FK_order
	    , cast(PRODUCTID as number) as FK_product
	    , CARRIERTRACKINGNUMBER 
	    , ORDERQTY 
	    , SPECIALOFFERID 
	    , UNITPRICE 
	    , UNITPRICEDISCOUNT 
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESORDERDETAIL') }}
    )

select *
from SALESORDERDETAIL