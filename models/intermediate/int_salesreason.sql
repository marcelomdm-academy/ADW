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
            from orderreason 
            left join salesreason
                    on orderreason.FK_salesreason = salesreason.PK_salesreason
        )

    , join_reason_header as(
        select
            join_reason.PK_salesreason
	        , join_reason.name_reason
	        , join_reason.REASONTYPE
            , join_reason.FK_order 
            , salesorder.PK_order 
            , salesorder.FK_customer
        from salesorder
        left join join_reason 
                on salesorder.PK_order = join_reason.FK_order 
    )

    , coalesce_order as (
        select
            coalesce(join_reason_header.PK_salesreason, 0) as PK_salesreason
            , join_reason_header.FK_order
            , coalesce(name_reason, 'No sales reason') as name_reason
            , coalesce(REASONTYPE, 'No reason type') as REASONTYPE
            from join_reason_header
    )

        select *
        from coalesce_order