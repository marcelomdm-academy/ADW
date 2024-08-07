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
            product.PK_product
            , orderdetail.PK_orderdetail
            , orderdetail.FK_order
            , product.name_product
            , product.FK_subcategory
            , product.FK_model
            , product.PRODUCTNUMBER
            , product.MAKEFLAG
            , product.FINISHEDGOODSFLAG
            , product.COLOR
            , product.SAFETYSTOCKLEVEL
            , product.REORDERPOINT 
            , product.STANDARDCOST
            , product.LISTPRICE
            , product.SIZE
            , product.SIZEUNITMEASURECODE
            , product.WEIGHTUNITMEASURECODE
            , product.WEIGHT
            , product.DAYSTOMANUFACTURE
            , product.PRODUCTLINE
            , product.CLASS
            , product.STYLE
            , product.SELLSTARTDATE
            , product.SELLENDDATE
            , product.DISCONTINUEDDATE
	        , orderdetail.CARRIERTRACKINGNUMBER 
	        , orderdetail.ORDERQTY 
	        , orderdetail.SPECIALOFFERID 
	        , orderdetail.UNITPRICE 
	        , orderdetail.UNITPRICEDISCOUNT
            , orderdetail.ORDERQTY*orderdetail.UNITPRICE as valor_bruto
            , orderdetail.ORDERQTY*orderdetail.unitprice*(1 - orderdetail.UNITPRICEDISCOUNT) as valor_liquido
            , 
        from product
        left join orderdetail
                on product.PK_product = orderdetail.FK_product
    )

    , medidas as (
        select 
            int_product.PK_product
            , int_product.PK_orderdetail
            , int_product.FK_order
            , int_product.name_product
            , int_product.FK_subcategory
            , int_product.FK_model
            , int_product.PRODUCTNUMBER
            , int_product.REORDERPOINT 
            , int_product.STANDARDCOST
            , int_product.LISTPRICE
	        , int_product.ORDERQTY 
	        , int_product.SPECIALOFFERID 
	        , int_product.UNITPRICE 
	        , int_product.UNITPRICEDISCOUNT
            , int_product.valor_bruto
            , int_product.valor_liquido
            , int_product.valor_liquido/int_product.ORDERQTY as ticket_medio
            from int_product
    )

        select *
        from medidas
    