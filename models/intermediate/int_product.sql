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
            , product.ROWGUID
	        , orderdetail.CARRIERTRACKINGNUMBER 
	        , orderdetail.ORDERQTY 
	        , orderdetail.SPECIALOFFERID 
	        , orderdetail.UNITPRICE 
	        , orderdetail.UNITPRICEDISCOUNT 
        from product
        left join orderdetail
                on product.PK_product = orderdetail.FK_product
    )

    select *
    from int_product