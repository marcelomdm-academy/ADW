with
    orderheader as (
        select *
        from {{ ref('stg__SALESORDERHEADER') }}
    )

    , orderdetail as (
        select *
        from  {{ ref('stg__SALESORDERDETAIL') }}
    )

    , order_reason as (
        select *
        from  {{ ref('stg__SALESORDERHEADERSALESREASON') }}
    )

    , reason as (
        select * 
        from {{ ref('stg__SALESREASON') }}
    )

    , sales_reason as(
        select
            order_reason.FK_order 
	        , order_reason.FK_salesreason
            , reason.PK_salesreason
	        , reason.reason 
	        , reason.REASONTYPE
        from order_reason
        left join reason
                on order_reason.FK_salesreason = reason.PK_salesreason
    )
    , fct_sales as (
        select
            orderheader.PK_order
            , orderdetail.PK_orderdetail
            , sales_reason.PK_salesreason
	        , orderdetail.FK_product 
            , orderheader.FK_customer
	        , orderheader.FK_salesperson 
	        , orderheader.FK_territory
	        , orderheader.FK_billadress 
	        , orderheader.FK_shipadress
	        , orderheader.FK_shipmethod
	        , orderheader.FK_creditcard
            , orderheader.FK_currencyrated
            , sales_reason.FK_order 
	        , sales_reason.FK_salesreason
	        , orderheader.REVISIONNUMBER 
	        , orderheader.ORDERDATE
	        , orderheader.duedate
	        , orderheader.SHIPDATE
	        , orderheader.STATUS 
	        , orderheader.ONLINEORDERFLAG 
	        , orderheader.PURCHASEORDERNUMBER 
	        , orderheader.ACCOUNTNUMBER 
	        , orderheader.CREDITCARDAPPROVALCODE     
	        , orderheader.SUBTOTAL 
	        , orderheader.TAXAMT 
	        , orderheader.FREIGHT 
	        , orderheader.TOTALDUE 
	        , orderheader.COMMENT 
	        , orderheader.ROWGUID 
	        , orderheader.modifieddate   
            , orderdetail.CARRIERTRACKINGNUMBER 
	        , orderdetail.ORDERQTY 
	        , orderdetail.SPECIALOFFERID 
	        , orderdetail.UNITPRICE 
	        , orderdetail.UNITPRICEDISCOUNT
	        , sales_reason.reason 
	        , sales_reason.REASONTYPE
        from orderheader
        left join orderdetail
                on orderheader.pk_order = orderdetail.FK_order
        left join sales_reason
                on orderheader.PK_order = sales_reason.FK_order
    )

    select *
    from fct_sales