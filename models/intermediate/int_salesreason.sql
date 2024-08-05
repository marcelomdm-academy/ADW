with
    salesreason as(
        select *
        from {{ ref('stg__SALESREASON') }}
    )

    , orderreason as (
        select *
        from {{ ref('stg__SALESORDERHEADERSALESREASON') }}
    )

    , salesorder as (
        select *
        from {{ ref('stg__SALESORDERHEADER') }}
    )

    , join_reason as (
        select 
            salesreason.PK_salesreason
	        , salesreason.name_reason
	        , salesreason.REASONTYPE
            , orderreason.FK_order 
            from salesreason
            left join orderreason
                    on salesreason.PK_salesreason = orderreason.FK_salesreason
        )

    , join_reason_header as(
        select
            join_reason.PK_salesreason
	        , join_reason.name_reason
	        , join_reason.REASONTYPE
            , join_reason.FK_order 
            , salesorder.PK_order 
            , salesorder.FK_customer
	        , salesorder.FK_salesperson 
	        , salesorder.FK_territory
	        , salesorder.FK_billaddress 
	        , salesorder.FK_shipaddress
	        , salesorder.FK_shipmethod
	        , salesorder.FK_creditcard
            , salesorder.FK_currencyrated
	        , salesorder.REVISIONNUMBER 
	        , salesorder.ORDERDATE
	        , salesorder.duedate
	        , salesorder.SHIPDATE
	        , salesorder.STATUS 
	        , salesorder.ONLINEORDERFLAG 
	        , salesorder.PURCHASEORDERNUMBER 
	        , salesorder.ACCOUNTNUMBER 
	        , salesorder.CREDITCARDAPPROVALCODE     
	        , salesorder.SUBTOTAL 
	        , salesorder.TAXAMT 
	        , salesorder.FREIGHT 
	        , salesorder.TOTALDUE 
	        , salesorder.COMMENT 
	        , salesorder.ROWGUID 
	        , salesorder.modifieddate
        from salesorder
        left join join_reason 
                on salesorder.PK_order = join_reason.FK_order 
    )

    , coalesce_order as (
        select
            join_reason_header.PK_order
            , coalesce(join_reason_header.PK_salesreason, 0) as PK_salesreason
            , coalesce(name_reason, 'No sales_reason') as name_reason
            , coalesce(REASONTYPE, 'No reason_type') as REASONTYPE
            from join_reason_header
    )

        select *
        from coalesce_order
        order by PK_order