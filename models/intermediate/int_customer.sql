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
            , coalesce(person.fullname, 'Not registered') as name_customer
            , customer.STOREID
            , customer.TERRITORYID 
            , customer.ACCOUNTNUMBER
            , person.FK_business
            from customer
            left join person
                    on customer.FK_person = person.FK_business
    )
        select *
        from int_customer
        