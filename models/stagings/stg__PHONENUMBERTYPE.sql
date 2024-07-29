with
    PHONENUMBERTYPE as (
    select 
        cast(PHONENUMBERTYPEID as number(38,0)) as PK_phone
	    , cast(NAME as varchar) as Name_phone
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PHONENUMBERTYPE') }}
    )

select *
from PHONENUMBERTYPE