with
    EMAILADDRESS as (
    select 
       cast(BUSINESSENTITYID as number(38,0)) as FK_business
	   , EMAILADDRESSID
	   , EMAILADDRESS 
	   , cast (ROWGUID as varchar(16777216))  as ROWGUID_email 
	   , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    
    from {{ source('RAW_ADVENTURE_WORKS', 'EMAILADDRESS') }}
    )

select *
from EMAILADDRESS