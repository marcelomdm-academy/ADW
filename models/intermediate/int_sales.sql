with
    orderheader as (
    select *
    from {{ ref('stg__SALESORDERHEADER') }}
    )

    , orderdetail as (
        select *
        from {{ ref('stg__SALESORDERDETAIL') }}
    )

    , join_order as (
        select
          orderheader.PK_order 
        , orderheader.FK_customer
	    , orderheader.FK_salesperson 
	    , orderheader.FK_territory
	    , orderheader.FK_billadress 
	    , orderheader.FK_shipadress
	    , orderheader.FK_shipmethod
	    , orderheader.FK_creditcard
        , orderheader.FK_currencyrated
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
        , orderdetail.PK_orderdetail
        , orderdetail.FK_order
	    , orderdetail.FK_product
	    , orderdetail.CARRIERTRACKINGNUMBER 
	    , orderdetail.ORDERQTY 
	    , orderdetail.SPECIALOFFERID 
	    , orderdetail.UNITPRICE 
	    , orderdetail.UNITPRICEDISCOUNT
        , orderdetail.ORDERQTY * orderdetail.UNITPRICE AS Faturamento_Bruto
        , orderdetail.ORDERQTY * orderdetail.UNITPRICEDISCOUNT AS Desconto_Produto
        from orderheader
        left join orderdetail
                on orderheader.PK_order = orderdetail.FK_order
        )

    , calc_ticket_medio as (
        SELECT
            COUNT(DISTINCT PK_order) as Numero_Pedidos
            , SUM(Faturamento_Bruto) as faturamento_bruto
            , SUM(Faturamento_Bruto) - SUM(Desconto_Produto) as Faturamento_Liquido
        FROM join_order
        )

       SELECT
        Faturamento_Liquido / Numero_Pedidos AS Ticket_Medio
        FROM calc_ticket_medio