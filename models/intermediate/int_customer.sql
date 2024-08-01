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
            customer.PK_customer
            , customer.FK_person
            , customer.STOREID
            , customer.TERRITORYID 
            , customer.ACCOUNTNUMBER
            , person.FK_business
	        , person.PERSONTYPE 
	        , person.NAMESTYLE 
	        , person.TITLE 
            , person.fullname
	        , person.SUFFIX 
	        , person.EMAILPROMOTION 
	        , person.ADDITIONALCONTACTINFO 
	        , person.DEMOGRAPHICS
            from person
            left join customer
                    on person.FK_business = customer.PK_customer
        )

        select *
        from int_customer
        