with
    customer as (
    select *
    from {{ ref('stg__CUSTOMER') }}
    )

    , person as (
        select *
        from {{ ref('stg__PERSON') }}
    )

    , int_customer as (
        select 
            COALESCE(customer.PK_customer, person.FK_business) AS PK_customer -- Substitui valores nulos de PK_customer por FK_business

            , customer.STOREID
            , customer.TERRITORYID 
            , customer.ACCOUNTNUMBER
            , person.FK_business
            from person
            left join customer
                    on person.FK_business = customer.PK_customer
    )
        select *
        from int_customer
        