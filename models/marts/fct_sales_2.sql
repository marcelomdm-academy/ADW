with
    orders as (
    select *
    from {{ ref('stg__SALESORDERHEADER') }}
    )

    , orderdetail as (
    select *
    from {{ ref('stg__SALESORDERDETAIL') }}
    )

    , creditcard as (
        select 
            PK_creditcard
            , CARDNUMBER
            , CARDTYPE  
            , EXPIRATION_DATE
        from {{ ref('stg__CREDITCARD') }}
    )

    , fct_sales as (
        select 
            orders.PK_order 
            , orders.FK_customer
	        , orders.FK_salesperson 
	        , orders.FK_territory
	        , orders.FK_billaddress 
	        , orders.FK_shipaddress
	        , orders.FK_shipmethod
	        , orders.FK_creditcard
            , orders.FK_currencyrated

            , orderdetail.PK_orderdetail
            , orderdetail.FK_order
	        , orderdetail.FK_product

	        , orders.REVISIONNUMBER 
	        , orders.ORDERDATE
	        , orders.duedate
	        , orders.SHIPDATE
	        , orders.STATUS 
	        , orders.ONLINEORDERFLAG 
	        , orders.PURCHASEORDERNUMBER 
	        , orders.ACCOUNTNUMBER 
	        , orders.CREDITCARDAPPROVALCODE     
	        , orders.SUBTOTAL 
	        , orders.TAXAMT 
	        , orders.FREIGHT 
	        , orders.TOTALDUE 
	        , orderdetail.ORDERQTY 
	        , orderdetail.SPECIALOFFERID 
	        , orderdetail.UNITPRICE 
	        , orderdetail.UNITPRICEDISCOUNT 
           
        from orders
        left join orderdetail
                on orders.PK_order = orderdetail.FK_order
    )

    , fato_vendas as (
        select 
            creditcard.PK_creditcard
            , COALESCE(CARDTYPE, 'Not_resgistered') AS CARDTYPE  -- Substitui NULL por 'Not_registered'

            , fct_sales.PK_order 
            , fct_sales.FK_customer
	        , fct_sales.FK_salesperson 
	        , fct_sales.FK_territory
	        , fct_sales.FK_billaddress 
	        , fct_sales.FK_shipaddress
	        , fct_sales.FK_shipmethod
	        , fct_sales.FK_creditcard
            , fct_sales.FK_currencyrated

            , fct_sales.PK_orderdetail
            , fct_sales.FK_order
	        , fct_sales.FK_product

	        , fct_sales.REVISIONNUMBER 
	        , fct_sales.ORDERDATE
	        , fct_sales.duedate
	        , fct_sales.SHIPDATE 
	        , fct_sales.SUBTOTAL 
	        , fct_sales.TAXAMT 
	        , fct_sales.FREIGHT 
	        , fct_sales.TOTALDUE 
	        , fct_sales.ORDERQTY 
	        , fct_sales.SPECIALOFFERID 
	        , fct_sales.UNITPRICE 
	        , fct_sales.UNITPRICEDISCOUNT 
            from fct_sales
            left join creditcard
                    on fct_sales.FK_creditcard = creditcard.PK_creditcard
            
    )

    select *
    from fato_vendas
        