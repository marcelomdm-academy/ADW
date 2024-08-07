WITH
    dim_salesreason_2 as (
        select *
        from {{ ref('int_salesreason_2') }}
    )

    select *
    from dim_salesreason_2