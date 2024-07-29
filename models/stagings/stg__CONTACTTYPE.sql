with
    CONTACTTYPE as (
    select 
       cast(CONTACTTYPEID as number(38,0)) as PK_contact 
       , cast(MODIFIEDDATE as date) as MODIFIEDDATE
       , NAME
    from {{ source('RAW_ADVENTURE_WORKS', 'CONTACTTYPE') }}
    )

select *
from CONTACTTYPE