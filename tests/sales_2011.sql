with
    sales_2011 as (
        select
            round(sum(gross_value)) as sales_2011

        from {{ ref('fct_sales') }}
        where ORDERDATE = '2011'
    )
    
    select *
    from sales_2011
    where sales_2011 != 12646112