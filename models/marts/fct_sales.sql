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

    , row_orders as (
        select 
            orders.PK_order
            , orderdetail.PK_orderdetail 
            , orderdetail.ORDERQTY 
            , row_number () over (partition by orders.PK_order order by orderdetail.FK_order) as row_orderdetail
            , orderdetail.ORDERQTY*orderdetail.UNITPRICE as valor_bruto
        from orders
        inner join orderdetail
                on orders.PK_order = orderdetail.FK_order
    )
  
    , rowsales_orders as (
        select 
            PK_order
            , count(row_orderdetail) as count_products
            , sum(valor_bruto) as gross_value
            , sum(ORDERQTY) as count_itens
        from row_orders
        group by PK_order
    )

    , fct_sales as(
        select      
            orders.PK_order
            , orders.ORDERDATE
            , orders.order_month
            , orders.order_year
            , orders.FK_customer
            , orders.FK_shipaddress
            , orders.subtotal
            , orders.totaldue            
            , coalesce(orders.order_status, 'No Status') as order_status
            , rowsales_orders.count_products
            , rowsales_orders.count_itens
            , rowsales_orders.gross_value      
            , coalesce(creditcard.CARDTYPE, 'No Creditcard') as CARDTYPE
        from orders
        left join rowsales_orders 
            on orders.PK_order = rowsales_orders.PK_order
        left join creditcard 
            on orders.FK_creditcard = creditcard.PK_creditcard
        order by orders.PK_order
    )

    select *
    from fct_sales


    
   