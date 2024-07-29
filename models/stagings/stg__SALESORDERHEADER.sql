with
    SALESORDERHEADER as (
    select 
        cast(SALESORDERID as number(38,0)) as PK_order 
        , cast(CUSTOMERID as number(38,0)) as FK_customer
	    , cast(SALESPERSONID as number(38,0)) as FK_salesperson 
	    ,  cast(TERRITORYID as number(38,0)) as  FK_territory
	    ,  cast(BILLTOADDRESSID as number(38,0)) as FK_billadress 
	    ,  cast(SHIPTOADDRESSID as number(38,0)) as  FK_shipadress
	    ,  cast(SHIPMETHODID as number(38,0)) as  FK_shipmethod
	    ,  cast(CREDITCARDID as number(38,0)) as FK_creditcard
        ,  cast(CURRENCYRATEID as number(38,0)) as  FK_currencyrated
	    , REVISIONNUMBER 
	    , cast(ORDERDATE as date) as ORDERDATE
	    , cast(DUEDATE as date) as duedate
	    , cast(SHIPDATE as date) as SHIPDATE
	    , STATUS 
	    , ONLINEORDERFLAG 
	    , PURCHASEORDERNUMBER 
	    , ACCOUNTNUMBER 
	    , CREDITCARDAPPROVALCODE     
	    , SUBTOTAL 
	    , TAXAMT 
	    , FREIGHT 
	    , TOTALDUE 
	    , COMMENT 
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESORDERHEADER') }}
    )

select *
from SALESORDERHEADER