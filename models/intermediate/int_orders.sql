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

    , calculate as (
        select 
            ORDERQTY * (UNITPRICE) AS total_price -- Cálculo do preço total
            , orderdetail.modifieddate
            , ORDERDATE
        from orderdetail
        left join orders
                on orders.PK_order = orderdetail.FK_order
    )

    select 
        SUM(calculate.total_price) AS total_vendas_brutas_2011
    from calculate
    where EXTRACT(YEAR FROM ORDERDATE) = 2011