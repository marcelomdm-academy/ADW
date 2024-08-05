with
    SALESTERRITORY as (
    select 
        cast(TERRITORYID as number(38,0)) as  PK_territory 
	    , cast(NAME as varchar) as name_territory
	    , COUNTRYREGIONCODE 
	    , GROUP_ 
	    , SALESYTD 
	    , SALESLASTYEAR 
	    , COSTYTD 
	    , COSTLASTYEAR 
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'SALESTERRITORY') }} 
    )

select *
from SALESTERRITORY