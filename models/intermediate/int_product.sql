with 
    product as (
        select *
        from {{ ref('stg__PRODUCT') }}
    )

    , orderdetail as (
        select *
        from {{ ref('stg__SALESORDERDETAIL') }}
    )

    , int_product as (
        select
            orderdetail.PK_orderdetail
            , orderdetail.FK_order
            , product.name_product
	        , orderdetail.ORDERQTY 
	        , orderdetail.SPECIALOFFERID 
	        , orderdetail.UNITPRICE 
	        , orderdetail.UNITPRICEDISCOUNT
        from orderdetail
        left join product
                on orderdetail.FK_product = product.PK_product
    )

    select *
    from int_product
    