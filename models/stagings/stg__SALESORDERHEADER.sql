with
    SALESORDERHEADER as (
    select 
        cast(SALESORDERID as number(38,0)) as PK_order 
        , cast(CUSTOMERID as number(38,0)) as FK_customer
	    , cast(SALESPERSONID as number(38,0)) as FK_salesperson 
	    ,  cast(TERRITORYID as number(38,0)) as  FK_territory
	    ,  cast(BILLTOADDRESSID as number(38,0)) as FK_billaddress 
	    ,  cast(SHIPTOADDRESSID as number(38,0)) as  FK_shipaddress
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

    , extract_year_status as (
        select
            *
            , extract(year from ORDERDATE) as order_year
            , extract(month from ORDERDATE) as order_month
            
          
            , case
                when status = 1 then 'In process'
                when status = 2 then 'Approved'
                when status = 3 then 'Backordered'
                when status = 4 then 'Rejected'
                when status = 5 then 'Shipped'
                when status = 6 then 'Canceled'
            end as order_status
    from SALESORDERHEADER
    )

    select *
    from extract_year_status