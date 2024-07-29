with
    PERSON as (
    select
        cast(BUSINESSENTITYID as number(38,0)) as FK_business
	    , PERSONTYPE 
	    , NAMESTYLE 
	    , TITLE 
	    , FIRSTNAME 
	    , MIDDLENAME 
	    , LASTNAME 
        , concat(firstname, ' ', COALESCE(middlename, ''), ' ', lastname) AS fullname
	    , SUFFIX 
	    , EMAILPROMOTION 
	    , ADDITIONALCONTACTINFO 
	    , DEMOGRAPHICS 
	    , cast (ROWGUID as varchar(16777216))  as ROWGUID_person
	    , cast (MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PERSON') }}
    )

select *
from PERSON