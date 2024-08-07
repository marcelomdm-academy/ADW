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
            , COALESCE(CARDTYPE, 'No_credit_card') AS CARDTYPE  -- Substitui NULL por 'No_credit_card' 
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

            , creditcard.PK_creditcard
            , creditcard.CARDNUMBER
            , creditcard.CARDTYPE  
            , creditcard.EXPIRATION_DATE 
           
        from orders
        left join orderdetail
                on orders.PK_order = orderdetail.FK_order
        left join creditcard
                on orders.FK_creditcard = creditcard.PK_creditcard
    )

    select *
    from fct_sales
        