with
    business_entity as (
        select *
        from {{ ref('stg__BUSINESSENTITY') }}
    )

    , person as (
        select *
        from {{ ref('stg__PERSON') }} 
    )
    
    , person_phone as (
        select *
        from {{ ref('stg__PERSONPHONE') }} 
    )

    , email_address as (
        select *
        from {{ ref('stg__EMAILADDRESS') }} 
    )

    , phone_number_type as (
        select *
    from {{ ref('stg__PHONENUMBERTYPE') }} 
    )

    , business as (
        select *
        from {{ ref('stg__BUSINESSENTITYCONTACT') }} 
    )

    , joined_number as (
        select
            person_phone.FK_business
	        , person_phone.PHONENUMBER 
	        , person_phone.FK_phone 
	        , person_phone.MODIFIEDDATE
            , phone_number_type.name_phone
        from person_phone
        left join phone_number_type
            on person_phone.FK_phone = phone_number_type.PK_phone
    )

    , joined_business as(
        select
        person.FK_business
	    , person.PERSONTYPE 
	    , person.NAMESTYLE 
	    , person.TITLE 
	    , person.FIRSTNAME 
	    , person.MIDDLENAME 
	    , person.LASTNAME 
        , person.fullname
	    , person.SUFFIX 
	    , person.EMAILPROMOTION 
	    , person.ADDITIONALCONTACTINFO 
	    , person.DEMOGRAPHICS 
	    , person.ROWGUID_person
	    , person.MODIFIEDDATE
        , business_entity.PK_business
        from person
        left join business_entity
                 on person.FK_business = business_entity.PK_business
    )

    , dim_person as (
        select 
            joined_business.PK_business
            , business.FK_contact
	        , business.FK_Person
            , joined_number.FK_phone
	        , joined_business.PERSONTYPE 
	        , joined_business.NAMESTYLE 
	        , joined_business.TITLE 
            , joined_business.firstname
            , joined_business.middlename
            , joined_business.LASTNAME
            , joined_business.fullname         
	        , joined_business.SUFFIX 
	        , joined_business.EMAILPROMOTION 
	        , joined_business.ADDITIONALCONTACTINFO 
	        , joined_business.DEMOGRAPHICS 
	        , joined_business.ROWGUID_person
            , joined_business.MODIFIEDDATE
            , email_address.EMAILADDRESSID
	        , email_address.EMAILADDRESS 
	        , email_address.ROWGUID_email
            , joined_number.PHONENUMBER      
            , joined_number.name_phone        
	        , business.ROWGUID_business
        from joined_business
        left join email_address
                on joined_business.PK_business = email_address.FK_business
        left join person_phone
                on joined_business.PK_business = person_phone.FK_business
       left join joined_number
                on joined_business.PK_business = joined_number.FK_business
        left join business
                on joined_business.PK_business = business.FK_business
    )
    
        select *
        from dim_person